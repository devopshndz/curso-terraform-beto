virginia_cidr = "10.10.0.0/16"
subnets = [ "10.10.0.0/24", "10.10.1.0/24" ] # uso de listas

tags = {
    "env" = "dev"
    "owner" = "Alberto"
    "cloud" = "AWS"
    "IAC" = "Terraform"
    "IAC Version" = "1.5.4"
}

sg_ingress_cidr = "0.0.0.0/0" 

ec2_specs = {
    "ami" = "ami-0f34c5ae932e6f0e4"
    "instance_type" = "t2.micro"
}