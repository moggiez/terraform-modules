variable "name" {
  type = string
}

variable "api" {

}

variable "parent_api_resource" {
  default = null
}

variable "path_part" {
  type = string
}

variable "bucket" {
}

variable "dist_dir" {
  type    = string
  default = "../../dist"
}

variable "http_methods" {
  type = set(string)
}

variable "dynamodb_table" {
  type = string
}

variable "authorizer" {
  default = null
}

variable "layers" {
  default = null
}

variable "policies" {
  type    = list(any)
  default = []
}