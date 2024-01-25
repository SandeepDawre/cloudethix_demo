variable "ami_id" {
  type = string
}
variable "instance_type" {
  type        = string
  description = "Please Provide Instance Type."
  validation {
    condition     = contains(["t2.micro", "t2.small", "t2.medium", "t2.large"], var.instance_type)
    error_message = "Please provide correct instance type either of t2.micro, t2.small, t2.medium, t2.large."
  }

}