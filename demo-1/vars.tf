variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {
    default = "us-east-1"

}

variable "AMIS" {
   type = map
   default = {
    us-east-1 = "ami-0574da719dca65348"
    us-east-2 = "ami-0a606d8395a538502"
   }

}