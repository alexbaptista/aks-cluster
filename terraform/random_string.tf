resource "random_string" "random" {
  length           = 6
  special          = false
  override_special = "/@£$"
}