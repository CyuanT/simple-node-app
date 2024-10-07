# This code block allows us to create an ec2 instance with hardcoded values
#resource "aws_instance" "sample_ec2_hardcoded" {
#  ami           = "ami-0b72821e2f351e396"
#  instance_type = "t2.micro"
#  key_name      = "luqman-useast1-13072024" # change to your own keypair name
#  subnet_id     = "subnet-09acf5721004f526c" # change to your own vpc subnet id
#  associate_public_ip_address = true
#  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

#  tags = {
#    Name = "luqman-webserver-terraform"
#  }
#}

# This code block allows us to create an ec2 instance with the use of variables
# To overwrite any one particular variable, we can pass the variable at runtime during terraform apply step
# e.g. terraform apply --var ec2_name="my-webserver"
/*
resource "aws_instance" "sample_ec2_variables" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = aws_key_pair.TanYuan-tf-ec2-key.key_name
  subnet_id     = aws_subnet.TanYuan-tf-public-subnet01.id
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.TanYuan-tf-sg-allow-ssh-http-https.id]

  tags = {
    Name = var.tf_ec2_name
  }
}
*/

#Create EC2 instances with module
module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 5.7"

  name = "ce7-TanYuan-tf-node-app"

  ami           = var.ami_id
  instance_type = "t2.micro"
  # key_name                    = aws_key_pair.TanYuan-tf-ec2-key.key_name
  key_name               = var.key_name
  monitoring             = true
  vpc_security_group_ids = [(aws_security_group.ty-sg.id)]
  subnet_id              = module.vpc.public_subnets[1]
  # associate_public_ip_address = true

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}