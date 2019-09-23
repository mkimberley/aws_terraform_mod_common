locals {
    vpc_primary_subnet_map  = "${data.terraform_remote_state.generic_vpc.primary_subnets_map}"
    frontend_subnet         = "${data.terraform_remote_state.vpc.primary_subnets_map}"
    backend_subnet          = "${data.terraform_remote_state.backend_subnet_id}"
    allzone_subnet          = "${merge(frontend_subnet, backend_subnet)}"
}