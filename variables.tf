
variable "create_sg" {
  type        = bool
  default     = false
  description = "if true, enable create security group "
}

variable "sg_name" {
  description = "Name to be used on SG created."
  default     = null
  type        = string
}

variable "add_sg_rule" {
  type        = bool
  default     = false
  description = "if true, enable create rules to security group "
}
variable "sg_attachment_to_ec2" {
  type        = bool
  default     = false
  description = "if true, enable attach security group to Instance"
}

variable "sg_ingress_rules" {
  type        = any
  default     = []
  description = "all configuration for rules ingress of security group"
}

variable "sg_egress_rules" {
  type        = any
  default     = []
  description = "all configuration for rules ingress of security group"
}

variable "sg_vpc_id" {
  type        = string
  default     = null
  description = " (Optional, Forces new resource) VPC ID. Defaults to the region's default VPC"
}
variable "sg_id" {
  type        = string
  default     = null
  description = "(Required) Security group to apply this rule to."
}
variable "ec2_id" {
  type        = string
  default     = null
  description = "ID of AMI to use for the instance"
}
variable "sg_type" {
  type        = string
  description = "(Required) Type of rule being created. Valid options are ingress (inbound) or egress (outbound)"
}

variable "tags" {
  type        = any
  default     = null
  description = "all tags for all recursives"
}

# variable "sg_ingress_rules_own" {
#   description = "Map of sg."
#   type        = any
#   default     = {
#     client-sg = {
#       from_port         = 2,
#       to_port           = 2,
#       protocol          = "-1",
#       description       = "sg",
#       cidr_blocks       = [],
#       ipv6_cidr_blocks  = [],
#       prefix_list_ids   = [],
#       self              = null,
#       source_security_group_id  = []
#     }
#   }
# }

variable "sg_ingress_rules_own" {
  type        = any
  default     = null
  description = <<-EOT
    type = map(object({
        client-sg = {
        # from_port         = 2,
        # to_port           = 2,
        # protocol          = "-1",
        # description       = "sg",
        # cidr_blocks       = [],
        # ipv6_cidr_blocks  = [],
        # prefix_list_ids   = [],
        # self              = null,
        # source_security_group_id  = []
        }
    }))
    Required configuration for attach rule to Sg
    EOT
}
