variable "s3_bucket" {
}

variable "dist_dir" {
  type = string
}

variable "name" {
  type = string
}

variable "dynamodb_table" {
  type = string
}

variable "policies" {
  type = list(string)
}

variable "layers" {
  default = null
}