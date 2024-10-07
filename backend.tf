# Comment out the below if you are working on local

terraform {
  backend "s3" {
    bucket = "sctp-ce7-tfstate"
    key    = "ce7-TanYuan-node-app.tfstate" #Change the value of this to <your suggested name>.tfstate for  example
    region = "us-east-1"
  }
}