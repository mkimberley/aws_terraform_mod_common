Locals {
    frontend_subnet         = "${data.terraform_remote_state.}"
    backend_subnet          = "${data.terraform_remote_state.}"
    allzone_subnet          = "${merge(frontend_subnet, backend_subnet)}"
}