module "vpc" {
  source = "../modules/vpc"
}

module "alb" {
  source = "../modules/alb"
  vpc_id = module.vpc.vpc_id
  alb_subnets = [
    module.vpc.example-a-public-subnet_id,
    module.vpc.example-c-public-subnet_id,
  ]
  tg_arn = module.tg.arn
}

module "tg" {
  source = "../modules/tg"
  vpc_id = module.vpc.vpc_id
  lb     = module.alb.lb
}
