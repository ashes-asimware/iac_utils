# Azure Container Instance - Time API

This Terraform configuration creates an Azure Container Instance running a Python Flask application that returns the current UTC time via HTTP API.

## Prerequisites

1. Azure CLI installed and authenticated (`az login`)
2. Terraform installed

## Resources Created

- Resource Group (`ashes-gm-002-rg`)
- Azure Container Instance with Python Flask app (`ashes-gm-002-time-api`)

## Application Details

The application is a simple Flask web service that provides a REST API endpoint to retrieve the current UTC time.

**Endpoints:**
- `/` - Returns current UTC time in JSON format
- `/api/GetCurrentTime` - Returns current UTC time in JSON format

**Response Format:**
```json
{
  "time": "2025-11-26T04:29:56.904358"
}
```

## Usage

1. **Initialize Terraform:**
   ```bash
   terraform init
   ```

2. **Review the execution plan:**
   ```bash
   terraform plan
   ```

3. **Apply the configuration:**
   ```bash
   terraform apply
   ```

4. **Access the API:**
   After deployment completes, the API will be available at the URL shown in the outputs:
   ```bash
   curl http://ashesgm002timeapi.eastus.azurecontainer.io/api/GetCurrentTime
   ```

## Clean Up

To destroy all resources:
```bash
terraform destroy
```

## Configuration

The Python Flask application is embedded directly in the Terraform configuration as an inline script. The container:
- Uses the `python:3.11-slim` base image
- Installs Flask at runtime
- Runs the Flask application on port 80
- Automatically restarts on failure

## Outputs

- `container_instance_fqdn`: Fully qualified domain name of the container instance
- `container_instance_url`: Full HTTP URL to access the API
