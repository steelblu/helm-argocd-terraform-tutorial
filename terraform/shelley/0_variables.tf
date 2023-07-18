variable "credentials" {
  description = "Path to the credentials file for the service account"
  default     = "~/.gcp-sa-private-key.json"
  type        = string
}

variable "project" {
  description = "The project ID to deploy to"
  default     = "mlops-357608"
  type        = string
}

variable "region" {
  description = "The region to deploy to"
  default     = "asia-northeast3"
  type        = string
}

variable "cluster" {
  description = "The name of the cluster to create"
  default     = "terraform-tutorial-gke"
  type        = string
}

variable "zone" {
  description = "Zone where the instances should be created. If not specified, instances will be spread across available zones in the region."
  default     = "asia-northeast3-a"
  type        = string
}

variable "namespace" {
  description = "The namespace to deploy to"
  type        = string
}

variable "label" {
  description = "The label to apply to all resources in this example"
  default     = "nginx"
  type        = string
}

variable "content" {
  description = "The content to display on the nginx page"
  type        = string
}