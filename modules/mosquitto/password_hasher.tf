locals {
  generate_password = var.admin_password == null
  generated_password_length = 32
}

resource "random_password" "admin_password" {
  count            = local.generate_password ? 1 : 0
  length           = local.generated_password_length
  special          = false
  numeric          = true
  lower            = true
  upper            = true
  min_lower        = floor((local.generated_password_length / 2) / 3)
  min_upper        = ceil((local.generated_password_length / 2) / 3)
  min_numeric      = floor((local.generated_password_length / 2) / 3)
  keepers          = {
    generated_password_length = local.generated_password_length
  }
}

locals {
  admin_password = var.admin_password != null ? var.admin_password : random_password.admin_password[0].result
}

data "external" "mosquitto_password_hasher" {
  program = ["${var.python_executable}", "${path.module}/scripts/mosquitto_password_hasher.py", local.admin_password]
}
