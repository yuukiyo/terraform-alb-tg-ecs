variable "app_name" {
  type = string
}

variable "subnets" {
  type = list(string)
}
variable "tg_arn" {
  type = string
}
variable "lb_sg_id" {
  type = string
}
