# Configure the Azure Provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# Resource Group
resource "azurerm_resource_group" "main" {
  name     = "ashes-gm-002-rg"
  location = "East US"
}

# Azure Container Instance with Time API
resource "azurerm_container_group" "main" {
  name                = "ashes-gm-002-time-api"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  os_type             = "Linux"
  dns_name_label      = "ashesgm002timeapi"
  ip_address_type     = "Public"

  container {
    name   = "time-api"
    image  = "mcr.microsoft.com/mirror/docker/library/python:3.11-slim"
    cpu    = "0.5"
    memory = "1.0"

    ports {
      port     = 80
      protocol = "TCP"
    }

    commands = [
      "/bin/bash",
      "-c",
      <<-EOT
        pip install flask && python -c '
from flask import Flask, jsonify
from datetime import datetime
app = Flask(__name__)

@app.route("/")
@app.route("/api/GetCurrentTime")
def get_current_time():
    return jsonify({"time": datetime.utcnow().isoformat()})

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=80)
'
      EOT
    ]
  }

  restart_policy = "Always"
}
