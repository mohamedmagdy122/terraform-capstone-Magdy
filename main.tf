# VPC Module
module "vpc" {
  source               = "github.com/mohamedmagdy122/VPC-Module-Magdy"
  vpc_cidr             = "10.0.0.0/16"
  vpc_name             = "magdy-vpc"
  public_subnet_count  = 3
  private_subnet_count = 3
  ingress_ports        = [80, 443, 22]
}

# EC2 Module
module "ec2" {
  source            = "github.com/mohamedmagdy122/EC2-Module-Magdy"
  instance_count    = 3
  ami_id            = "ami-01eef276553a61355"
  instance_type     = "t2.micro"
  key_name          = "my-key"
  subnet_ids        = module.vpc.public_subnet_ids
  security_group_id = module.vpc.security_group_id
  user_data         = file("userdata.sh")
  ec2_name          = "magdy-ec2"
}

# ALB Module
module "alb" {
  source            = "github.com/mohamedmagdy122/ALB-Module-Magdy"
  alb_name          = "magdy-alb"
  alb_type          = "internet-facing"
  vpc_id            = module.vpc.vpc_id
  subnet_ids        = module.vpc.public_subnet_ids
  security_group_id = module.vpc.security_group_id
  instance_ids      = module.ec2.instance_ids
}
