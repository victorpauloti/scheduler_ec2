variable "region" {
  type    = string
  default = "us-east-1"
}

variable "env" {
  type = string
}

variable "layer_name" {
  description = "layer da lambda"
  type        = string

}

variable "lambda_name" {
  type = string
}

variable "lambda_runtime" {
  type = string
}

variable "lambda_handler" {
  type = string
}

variable "lambda_source_path" {
  type = string
}

variable "lambda_timeout" {
  type = number
}

variable "lambda_memory_size" {
  type = number
}
variable "lambda_environment_variables" {
  type = map(string)

}

variable "tags" {
  type = map(string)

  default = {
    "Project" = "SABERPLAY"
    "Contato" = "contato@vpaulo.com"
    "Empresa" = "VPAULO.COM"
  }

}