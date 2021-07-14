variable "api" {

}

variable "lambda" {

}

variable "resource_path_part" {
  type = string
}

variable "parent_resource" {
}

variable "http_methods" {
  type = set(string)
}

variable "authorizer" {
  default = null
}