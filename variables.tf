variable "function_name" {
    type = string
}

variable "path_part" {
    type = string
}

variable "request_parameters" {
    type = map
}

variable "invoke_arn" {
    type = string
}

variable "uri_path" {
    type = string
}

  variable "rest_api_id" {
    type = string
  }
  variable "rest_api_root_id" {
     type = string
  }
  variable "execution_arn" {
    type = string
  }
  variable "request_parameters_validator_id" {
    type = string
  }

variable "region" {
  type = string
}