provider "aws" { }

resource "aws_instance" "demo" {
  ami           = "ami-a4c7edb2"
  instance_type = "t2.micro"
  key_name       = "vinh"

  tags {
    Role = "vinhdemo"
  }

  count         = 2
}

