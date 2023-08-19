# # EC2 desde terraform registry 
# resource "aws_instance" "public_instance" {
#   ami                     = "ami-0f34c5ae932e6f0e4" 
#   instance_type           = "t2.micro" 
#   subnet_id = aws_subnet.public_subnet.id 
#   key_name = data.aws_key_pair.key.key_name 
#   vpc_security_group_ids = [ aws_security_group.sg_public_instance.id]
#   tags = {
#     Name = "Instance_terraform"
#   }
# }

# resource "aws_instance" "mywebserver" {
#   # recurso vacio antes del import
# }

### import ec2 creada manualmente en aws
resource "aws_instance" "mywebserver" {
  ami           = "ami-08a52ddb321b32a8c"
  instance_type = "t2.micro"
  key_name      = data.aws_key_pair.key.key_name
  subnet_id     = aws_subnet.public_subnet.id
  tags = {
    "Name" = "MyServer"
  }
  vpc_security_group_ids = [
    aws_security_group.sg_public_instance.id
  ]
}