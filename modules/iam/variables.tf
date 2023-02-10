variable "config" {
  type = object({
    environment = string
    region      = string
    projectName = string
  })
  description = "Configuration object containing environment name, region name and the project name"
}
