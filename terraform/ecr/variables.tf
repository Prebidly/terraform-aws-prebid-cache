variable "config" {
  type = object({
    environment = string
    region      = string
    projectName = string
  })
}

variable "tags" {
  type = map(string)
}
