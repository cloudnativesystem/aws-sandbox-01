# tf_backend.tf
terraform {
  backend "s3" {
    bucket         = "BUCKET-NAME"
    key            = "BUCKET-NAME/dev/tf.state"
    region         = "us-east-2"
    dynamodb_table = "BUCKET-NAME"
  }
}