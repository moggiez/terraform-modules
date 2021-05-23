variable "s3_bucket" {
}

variable "dist_dir" {
  type = string
}

variable "function_name" {
  type = string
}

variable "key" {
  type = string
}

variable "policies" {
  type = list(any)
}

variable "timeout" {
  type    = number
  default = 3
}