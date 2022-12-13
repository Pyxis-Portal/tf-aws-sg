locals {
  tags = {
    terraform = true
    Name      = var.sg_name
  }
}

data "aws_instance" "instance" {
  count = var.sg_attachment_to_ec2 ? 1 : 0
  instance_id = var.ec2_id
}


resource "aws_security_group" "sg" {
  count = var.create_sg ? 1 : 0

  name        = "${var.sg_name}"
  description = "Security Group for ${var.sg_name}"
  vpc_id      = var.sg_vpc_id
  

  dynamic "ingress" {
    for_each = var.sg_ingress_rules

    content {
      description     = ingress.value["description"]
      from_port       = ingress.value["from_port"]
      to_port         = ingress.value["to_port"]
      cidr_blocks     = lookup(ingress.value, "cidr_blocks", null)
      protocol        = ingress.value["protocol"]
      security_groups = lookup(ingress.value, "security_groups", null)
    }
  }

  dynamic "egress" {
    for_each = var.sg_egress_rules

    content {
      description     = egress.value["description"]
      from_port       = egress.value["from_port"]
      to_port         = egress.value["to_port"]
      cidr_blocks     = lookup(egress.value, "cidr_blocks", null)
      protocol        = egress.value["protocol"]
      security_groups = lookup(egress.value, "security_groups", null)
    }
  }

  tags = merge(
    local.tags,
    var.tags
  )
}



resource "aws_security_group_rule" "sg_rule" {
  for_each = var.add_sg_rule ? var.sg_ingress_rules_own : {}

  security_group_id = var.sg_id
  type        =var.sg_type

  
  from_port   = each.value.from_port
  to_port     = each.value.to_port
  protocol    = each.value.protocol
  description = each.value.description
  #source_security_group_id = lookup(each.value, "security_groups", null)

  cidr_blocks              = length(each.value.cidr_blocks) == 0 ? null : each.value.cidr_blocks
  ipv6_cidr_blocks         = length(each.value.ipv6_cidr_blocks) == 0 ? null : each.value.ipv6_cidr_blocks
  prefix_list_ids          = length(each.value.prefix_list_ids) == 0 ? [] : each.value.prefix_list_ids
  self                     = each.value.self
  source_security_group_id = each.value.source_security_group_id


  }

resource "aws_network_interface_sg_attachment" "sg_attachment" {
  count = var.sg_attachment_to_ec2 ? 1 : 0
  security_group_id    = var.sg_id
  network_interface_id = data.aws_instance.instance[count.index].network_interface_id
}