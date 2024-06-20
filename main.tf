resource "aws_instance" "my_iinstance" {
ami = "ami-0eaf7c3456e7b5b68"
instance_type = "t2.micro"
key_name = "i"
subnet_id = aws_subnet.my_subnet_1.id
security_groups = [aws_security_group.my_sg.id]
root_block_device {
volume_size = 20
}
tags = {
Name = "terraform_instance"
}
}

