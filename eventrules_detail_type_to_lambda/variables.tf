variable "application" {
  type        = string
  description = "Application Name"
}

variable "account" {
  type        = string
  description = "AWS account id"
}

variable "region" {
  type        = string
  description = "AWS region"
}

variable "name" {
  type = string
}

variable "detail_type" {
  type = string
}

variable "eventbus_name" {
  type = string
}

variable "lambda" {
}