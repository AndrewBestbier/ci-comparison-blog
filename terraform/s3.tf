resource "aws_s3_bucket" "my_app_ebs" {
  bucket = "expressjs-ci-comparisn-bucket"
  acl    = "private"

  tags = {
    Name = "My APP EBS"
  }
}

resource "aws_s3_bucket_object" "my_app_deployment" {
  bucket = aws_s3_bucket.my_app_ebs.id
  key    = "Dockerrun.aws.json"
  source = "Dockerrun.aws.json"
}


resource "aws_s3_bucket" "codepipeline_bucket" {
  bucket = "codepipeline-bucket-ci-comparism"
}
