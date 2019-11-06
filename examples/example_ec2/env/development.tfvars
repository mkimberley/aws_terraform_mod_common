ec2_instance_name       = "ec2_example"
instance_type           = "t2.small"
environment             = "development"
ec2_subnet_name         = "Public"
description             = "Example RedHat EL 8 EC2 Instance"
ami_name                = "test-ami"
security_group_data     = ["
{
    type            = 
    description     =
    from_port       =
    to_port         +

}"
]