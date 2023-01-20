# Set the variable value in *.tfvars file
# or using -var="do_token=..." CLI option
variable "do_token" {}


variable "droplets_id" {
    type = any
}

variable "provision_lb" {
    type = bool
    default = false
}
