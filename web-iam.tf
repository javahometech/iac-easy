data "template_file" "web_policy" {
  template = "${file("iam/web-policy.json")}"
  vars = {
      bucket_name = "${var.bucket_name}"
  }
}


resource "aws_iam_role_policy" "ec2_policy" {
  name        = "s3_uplod_javahome"
  role = "${aws_iam_role.web_role.id}"
  policy = "${data.template_file.web_policy.rendered}"
}

resource "aws_iam_role" "web_role" {
  name = "javahome_web_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_instance_profile" "web_profile" {
  name = "javahome_web_role"
  role = "${aws_iam_role.web_role.name}"
}