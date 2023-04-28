terraform {
  cloud {
    #hostname = "my-tfe-hostname" # Optional for TFC 
    organization = "petya-business-org"

    workspaces {
      name = "state-test"
    }
  }
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.4.3"
    }
  }
}


provider "random" {
}
resource "random_pet" "server" {
  keepers = {
    # Generates a new pet name on each apply
  }
}

/*
variable "midcheck"{
    default = "testname"
}
*/

output "value" {
  value = "MyNewPetTypeIs-${random_pet.server.id}"
}



