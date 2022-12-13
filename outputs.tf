output "id_security_group" {
  value = element(concat(aws_security_group.sg.*.id, [""]), 0)
}
