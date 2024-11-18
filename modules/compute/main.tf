# modules/compute/main.tf


resource "aws_instance" "public_instance" {
  count         = length(var.public_subnets)
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.public_subnets[count.index]
  security_groups = [var.security_group_id]

  # Use the existing or generated key
  key_name = var.key_name           # If using an existing key
  # key_name = aws_key_pair.generated_key.key_name  # If generating a new key

  tags = {
    Name = "public-instance-${count.index}"
  }
}

resource "aws_instance" "private_instance" {
  count         = length(var.private_subnets)
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.private_subnets[count.index]
  security_groups = [var.security_group_id]
  key_name = var.key_name
  tags = {
    Name = "private-instance-${count.index}"
  }
}
