variable "vpc_id" {
  type = string
}

variable "alb_subnets" {
  type = list(string)
}

variable "tg_arn" {
  type = string
}
