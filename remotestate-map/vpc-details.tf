locals {
    vpc_primary_subnet_map  = "${data.terraform_remote_state.vpc.primary_subnets_map}"
    vpc_secondary_subnet_map  = "${data.terraform_remote_state.vpc.secondary_subnets_map}"
    frontend_subnet         = "${data.terraform_remote_state.vpc.primary_subnets_map}"
    backend_subnet          = "${data.terraform_remote_state.vpc.backend_subnet_id}"
    allzone_subnet          = "${merge(frontend_subnet, backend_subnet)}"
}