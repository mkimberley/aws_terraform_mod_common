locals {
    vpc_primary_subnet_map  = "${data.terraform_remote_state.vpc.outputs.primary_subnets_map}"
    vpc_secondary_subnet_map  = "${data.terraform_remote_state.vpc.outputs.secondary_subnets_map}"
    frontend_subnet         = "${data.terraform_remote_state.vpc.outputs.primary_subnets_map}"
    backend_subnet          = "${data.terraform_remote_state.vpc.outputs.backend_subnet_id}"
    allzone_subnet          = "${merge(local.frontend_subnet, local.backend_subnet)}"
}