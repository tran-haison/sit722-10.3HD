variable "prefix" {
  description = "Prefix for all resource names"
  type        = string
  default     = "s224252426"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "australiaeast"
}

variable "kubernetes_version" {
  default = "1.31.7"
}
