variable "virginia_cidr" {
    description = "CIDR VPC Virginia"
    type        = string
}

# variable "public_subnet" {
#     description = "CIDR public subnet Virginia"
#     type = string
# }

# variable "private_subnet" {
#     description = "CIDR private subnet Virginia"
#     type = string
# }

# uso de listas para crear subnets
variable "subnets" {
    description = "Lista de subnets"
    type = list(string)
}