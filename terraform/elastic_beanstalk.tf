resource "aws_iam_role" "beanstalk_service" {
  name = "beanstalk_role"

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

resource "aws_iam_role_policy_attachment" "beanstalk_log_attach" {
  role       = aws_iam_role.beanstalk_service.name
  policy_arn = "arn:aws:iam::aws:policy/AWSElasticBeanstalkWebTier"
}

resource "aws_iam_instance_profile" "beanstalk_iam_instance_profile" {
  name = "beanstalk_iam_instance_profile"
  role = aws_iam_role.beanstalk_service.name
}

resource "aws_elastic_beanstalk_application" "express_app" {
    name = "expressjs_app"
    description = "Express JS application deployed on elastic beanstalk"
}

resource "aws_elastic_beanstalk_environment" "express_app-env" {
    name = "expressjs-app-env"
    application = aws_elastic_beanstalk_application.express_app.name
    cname_prefix = "express-app-sheriff"
    solution_stack_name = "64bit Amazon Linux 2 v3.5.7 running Docker"

    setting {
      namespace = "aws:ec2:vpc"
      name = "VPCId"
      value = aws_vpc.elb_vpc.id
    }

    setting {
    namespace = "aws:ec2:vpc"
    name      = "Subnets"
    value     = aws_subnet.elb_subnet.id
  }
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = aws_iam_instance_profile.beanstalk_iam_instance_profile.arn
  }

  setting {
    namespace = "aws:elasticbeanstalk:cloudwatch:logs"
    name      = "StreamLogs"
    value     = "True"
  }

}

resource "aws_elastic_beanstalk_application_version" "my_app_ebs_version" {
  name        = "my-app-ebs-version"
  application = aws_elastic_beanstalk_application.express_app.name
  description = "application version created by terraform"
  bucket      = aws_s3_bucket.my_app_ebs.id
  key         = aws_s3_bucket_object.my_app_deployment.id
}