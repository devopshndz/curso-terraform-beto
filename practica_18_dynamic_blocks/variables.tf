variable "virginia_cidr" {
  description = "CIDR VPC Virginia"
  type        = string
}

# uso de listas para crear subnets
variable "subnets" {
  description = "Lista de subnets"
  type        = list(string)
}

variable "tags" {
  description = "Tags del proyecto"
  type        = map(string)
}

variable "sg_ingress_cidr" {
  description = "CIDR for ingress traffic"
  type        = string
}

variable "ec2_specs" {
  description = "Especificaciones de la instancia"
  type        = map(string)
}

variable "instancias" {
  description = "descripcion de las instancias"
  type        = list(string) # usar toset para llamarla
  default     = ["apache"]
}

variable "enable_monitoring" {
  description = "Habilitador de una instancia de monitoreo"
  type        = bool
}

variable "ingress_port_list" {
  description = "Lista de puertos ingress"
  type = list(number)
}