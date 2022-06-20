# vpc 
data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket = "onekloud-swagwatch-infra"
    key    = "onekloud-swagwatch-infra/dev/tf.state"
    region = "us-east-2"
  }
}