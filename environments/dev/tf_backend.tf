# tf_backend.tf
terraform {
  backend "s3" {
    bucket         = "onekloud-swagwatch-infra"
    key            = "onekloud-swagwatch-infra/dev/tf.state"
    region         = "us-east-2"
    dynamodb_table = "onekloud-swagwatch-infra"
  }
}