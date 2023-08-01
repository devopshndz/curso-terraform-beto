variable "virginia_cidr" {
    description = "CIDR VPC Virginia"
    type        = string
}

# uso de listas para crear subnets
variable "subnets" {
    description = "Lista de subnets"
    type = list(string)
}

variable "tags" {
    description = "Tags del proyecto"
    type = map(string)
}
