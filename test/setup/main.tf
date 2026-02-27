resource "random_id" "id" {
  byte_length = 4
}

output "id" {
  value = random_id.id.hex
}
