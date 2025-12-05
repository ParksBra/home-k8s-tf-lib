#!/bin/bash
usage() {
    echo "Usage: $0 <unhashed_password> <optional_salt>" >&2
    exit 1
}

if [ "$#" -lt 1 ]; then
    usage
fi

PASSWORD="$1"
SALT="$2"

# If no salt is provided, generate a random 12-character alphanumeric string.
if [ -z "$SALT" ]; then
    SALT=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 12 | head -n 1)
fi

export TARGET_PASS="$PASSWORD"
export TARGET_SALT="$SALT"

HASH_OUTPUT=$(perl -MDigest::SHA=hmac_sha512 -MMIME::Base64 -e '
    use strict;
    use warnings;

    my $pass = $ENV{TARGET_PASS};
    my $salt = $ENV{TARGET_SALT};
    my $iterations = 101;

    my $salt_encoded = encode_base64($salt, "");
    $salt_encoded =~ s/=*$//; # Strip padding (=)

    my $block_num = pack("N", 1);

    my $u = hmac_sha512($salt . $block_num, $pass);
    my $result = $u;

    for (my $i = 2; $i <= $iterations; $i++) {
        $u = hmac_sha512($u, $pass);
        $result = $result ^ $u;
    }

    my $b64_hash = encode_base64($result, "");
    $b64_hash =~ s/=*$//;
    $b64_hash .= "==";

    # Output format: $7$rounds$encoded_salt$encoded_hash
    print "\$7\$${iterations}\$${salt_encoded}\$${b64_hash}";
')

printf '{"hashed_password": "%s"}' "$HASH_OUTPUT"
