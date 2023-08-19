virginia_cidr = "10.10.0.0/16"
subnets = [ "10.10.0.0/24", "10.10.1.0/24" ] # uso de listas

# Vamos a definir aquí los tags (variable tags) que son constantes en los recursos. Son tags que valen para
# todos los recursos
# tags genéricos para todos. Los llamamos en el provider para que los tome todos los recursos
tags = {
    "env" = "dev"
    "owner" = "Alberto"
    "cloud" = "AWS"
    "IAC" = "Terraform"
    "IAC Version" = "1.5.4"
}

sg_ingress_cidr = "0.0.0.0/0" # para mas seguridad usar la ip de la casa