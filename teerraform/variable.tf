## Required-------------------------

#Input access key
variable "aws_access_key" {
  default = "input_access_key_here"
}
#Input secret key
variable "aws_secret_key" {
  default = "input_secret_key_here"
}

#set default region
variable "aws_region" {
  default = "us-east-1"
}

#AMI to be used to launch instance // Here RHEL-7.6 community AMI was used
variable "ami" {
  default = "ami-000db10762d0c4c05"
}

## Optional-----------------------

#EC2 instance name
variable "aws_instance_name" {
  default = "TF_EC2"
}

#pem key pair name to be used to SSH into the instance // and if you want to use a pem key, be sure to uncomment "key_name" resource in main.tf
variable "key_name" {
  default = "input_key_name"
}
