FROM alpine:3.21
ARG TERRAFORM_VERSION=1.11.4
ENV TERRAFORM_VERSION=${TERRAFORM_VERSION}
ARG TARGETARCH

LABEL Name=terraform Version=${TERRAFORM_VERSION} Description="Run Terraform in a container for your CI jobs"

# Install dependencies
RUN apk add --no-cache curl unzip bash git jq

# Install Terraform
RUN curl -fsSL https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_${TARGETARCH}.zip -o terraform.zip && \
    unzip terraform.zip && \
    mv terraform /usr/local/bin/ && \
    chmod +x /usr/local/bin/terraform && \
    rm terraform.zip

CMD ["terraform", "--version"]
ENTRYPOINT ["/usr/local/bin/terraform"]
