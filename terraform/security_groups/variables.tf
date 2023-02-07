variable "config" {
  type = object({
    environment = string
    region      = string
    projectName = string
  })
}

variable "vpc_id" {
  type = string
}

variable "tags" {
  type = map(string)
}
