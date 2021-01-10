data "template_file" "s3_web_policy" {
    template = file("scripts/iam/iam-role-policy.jason")
    vars ={
        s3_bucket_arn = "arn:aws:s3:::(var.devops_s3_bucket)/*"

    }
}

resource "aws_iam_role_policy" "s3_ec2_policy" {
  name = "s3_ec2_polic"
  role = aws_iam_role.s3_ec2_role.id

  policy = data.template_file.s3_web_policy.rendered
}

resource "aws_iam_role" "s3_ec2_role" {
  name = "ts3_ec2_role"

  assume_role_policy = file("scripts/iam/iam-role.jason")
}

resource "aws_iam_instance_profile" "s3_ec2_profile" {
  name = "s3_ec2_profile"
  role = aws_iam_role.s3_ec2_role.name
}
