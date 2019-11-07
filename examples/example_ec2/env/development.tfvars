ec2_instance_name       = "ec2_example"
instance_type           = "t2.small"
environment             = "development"
ec2_subnet_name         = "Public"
description             = "Example RedHat EL 8 EC2 Instance"
ami_name                = "test-ami"
security_group_rules     = [
{
    type            =   "ingress"
    description     =   "SSH Admin Access"
    from_port       = 22
    to_port         = 22

},
{
    type            =   "ingress"
    description     =   "Cockpit port"
    from_port       = 9090
    to_port         = 9090

}
]