resource "aws_instance" "vms" {
  ami                    = "ami-0cb0e70f44e1a4bb5"
  instance_type          = "t2.micro"
  subnet_id              = "${aws_subnet.public.id}"
  iam_instance_profile = "${aws_iam_instance_profile.web_profile.name}"
  user_data = "${file("scripts/apache.sh")}"
  tags = {
      Name = "EC2InstanceOne"
  }
}
