resource "aws_s3_bucket" "mybucket" {
  bucket = "avi-terraform-bucket-171756717"
tags = {
  CreatedBy = "Avi"
}
}

