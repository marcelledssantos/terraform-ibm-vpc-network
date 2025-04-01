terraform {
  required_providers {
    ibm = {
      source  = "IBM-Cloud/ibm"
      version = "~> 1.56.0"
    }
  }
}

provider "ibm" {
  region = var.region
}

resource "ibm_is_vpc" "vpc" {
  name = var.vpc_name
}

resource "ibm_is_subnet" "subnet1" {
  name           = "${var.vpc_name}-subnet-1"
  vpc            = ibm_is_vpc.vpc.id
  zone           = var.zone1
  ipv4_cidr_block = "10.10.10.0/24"
}

resource "ibm_is_subnet" "subnet2" {
  name           = "${var.vpc_name}-subnet-2"
  vpc            = ibm_is_vpc.vpc.id
  zone           = var.zone2
  ipv4_cidr_block = "10.10.20.0/24"
}
