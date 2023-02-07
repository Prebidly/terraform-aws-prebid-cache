variable "config" {
  type = object({
    environment = string
    region      = string
    projectName = string
  })
}
