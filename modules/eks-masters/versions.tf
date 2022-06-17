terraform {
  required_version = ">= 0.15.0"

  required_providers {
    aws   = ">= 3.57.0"
    local = ">= 2.0"
    http = {
      source  = "terraform-aws-modules/http"
      version = ">= 2.4.1"
    }
    template   = ">= 2.2"
    random     = ">= 3.1"
    kubernetes = ">= 2.1"
    helm       = ">= 2.1"
    datadog = {
      source  = "DataDog/datadog"
      version = "3.2.0"
    }
  }
}