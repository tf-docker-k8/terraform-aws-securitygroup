variable "security_group_name" {
    type = string
}

variable "security_group_description" {
  type = string
  default = ""
}

variable "vpc_id" {
  type = string
}

variable "security_group_tags" {
  type = map
  default = {}
}

#optional
variable "ingress" {
  type = map
  default = {}
}