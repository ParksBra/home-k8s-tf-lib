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
  keepers          = [
    local.generated_password_length,
  ]
}

locals {
  admin_password = var.admin_password != null ? var.admin_password : random_password.admin_password[0].result
}

resource "terraform_data" "mosquitto_password_hasher" {
  input = var.admin_password

  triggers_replace = [
    var.admin_password
  ]

  provisioner "local-exec" {
    command = "${var.python_executable} mosquitto_password_hasher.py ${local.admin_password}"
    working_dir = "${path.module}/scripts"
  }
}
