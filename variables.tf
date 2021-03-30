variable "location" {
  type                      = string
  description               = "The Azure Region used"
}

variable "project-rg" {
  type                      = string
  description               = "Resource group for project"
}

variable "prefix" {
  type                      = string
  description               = "String to use for uniqueness"
}
