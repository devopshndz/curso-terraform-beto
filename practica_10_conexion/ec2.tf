# EC2 desde terraform registry 
resource "aws_instance" "public_instance" {
  ami                     = "ami-0f34c5ae932e6f0e4" 
  instance_type           = "t2.micro" 
  subnet_id = aws_subnet.public_subnet.id 
  key_name = data.aws_key_pair.key.key_name 
  vpc_security_group_ids = [ aws_security_group.sg_public_instance.id]
  tags = {
    Name = "Instance_terraform"
  }
}
