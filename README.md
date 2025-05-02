[![CI](https://github.com/albertsj1/docker-terraform/actions/workflows/docker-multiplatform.yml/badge.svg?branch=main)](https://github.com/albertsj1/docker-terraform/actions/workflows/docker-multiplatform.yml)

# Docker Terraform Image

A minimal Docker image for running [Terraform](https://www.terraform.io/) and related tools, designed for use in CI/CD pipelines. This image is based on Alpine Linux and includes Terraform, curl, unzip, bash, git, and jq.

## Features
- **Lightweight**: Based on Alpine for a small footprint
- **Multi-platform**: Built for multiple architectures using Docker Buildx
- **Automated CI**: GitHub Actions workflow for automated builds and Docker Hub publishing
- **Customizable**: Easily override the Terraform version via build arguments

## Image Contents
- **Base**: `alpine:3.21`
- **Terraform**: Version specified by `TERRAFORM_VERSION` (default: 1.11.4, can be overridden)
- **Utilities**: curl, unzip, bash, git, jq

## Usage
### Pull from Docker Hub
```
docker pull albertsj1/terraform:<tag>
```

### Run Terraform
```
docker run --rm -it albertsj1/terraform:latest --version
```

### Example: Running a Terraform command
```
docker run --rm -v $(pwd):/workspace -w /workspace albertsj1/terraform:latest init
```

## Building the Image
To build locally:
```
docker build --build-arg TERRAFORM_VERSION=1.11.4 -t terraform:local .
```

## Continuous Integration
This repository includes a [GitHub Actions workflow](.github/workflows/docker-multiplatform.yml) to:
- Fetch the latest Terraform version
- Build and push a multi-platform Docker image
- Publish to Docker Hub

### Environment Variables
- `DOCKERHUB_USERNAME`: Docker Hub username (GitHub Actions variable)
- `DOCKERHUB_TOKEN`: Docker Hub token (GitHub Actions secret)

## License
This project is licensed under the MIT License. See [LICENSE](LICENSE) for details.

## Author
John Alberts
