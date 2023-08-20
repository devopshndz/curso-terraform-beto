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

variable "sg_ingress_cidr" {
    description = "CIDR for ingress traffic"
    type = string
}

variable "ec2_specs" {
    description = "Especificaciones de la instancia"
    type = map(string)
}

# variable "instancias" { # solo cuando se usa count
#   description = "descripcion de las instancias"
#   type        = list(string)
#   default     = ["apache", "mysql", "jumpserver"] # lista de instancias
# }

variable "instancias" { # solo cuando se usa for_each
  description = "descripcion de las instancias"
  type        = set(string)
  default     = ["apache", "mysql", "jumpserver"] # lista de instancias
}