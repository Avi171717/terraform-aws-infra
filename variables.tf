variable "aws_region" {
  description = "AWS region to deploy resources"
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "S3 bucket name"
  default     = "avi-terraform-bucket-171756717"
}

variable "kms_key_alias" {
  description = "Alias for KMS CMK"
  default     = "alias/avi-kms-key"
}

variable "sg_name" {
  description = "Security group name"
  default     = "avi-sg"
}
