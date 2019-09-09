Locals {
    vpc_primary_subnet_map  = "${zipmap(data.terraform_remote_state.vpc.primary_cidr_subnets_vpc_details)}"
    frontend_subnet         = "${data.terraform_remote_state.vpc.prim}"
    backend_subnet          = "${data.terraform_remote_state.backend_subnet_id}"
    allzone_subnet          = "${merge(frontend_subnet, backend_subnet)}"
}