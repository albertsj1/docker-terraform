FROM alpine:3.21
ARG TERRAFORM_VERSION=1.11.4
ENV TERRAFORM_VERSION=${TERRAFORM_VERSION}
ARG TARGETARCH

LABEL name="terraform" version=${TERRAFORM_VERSION} description="Run Terraform in a container for your CI jobs"
LABEL org.opencontainers.image.description="Run Terraform in a container for your CI jobs"
LABEL org.opencontainers.image.title="Terraform"
LABEL org.opencontainers.image.version=${TERRAFORM_VERSION}
LABEL org.opencontainers.image.licenses="MIT"
LABEL org.opencontainers.image.source="https://github.com/albertsj1/docker-terraform"
LABEL org.opencontainers.image.url="https://github.com/albertsj1/docker-terraform"


# Update everything
RUN apk update && apk upgrade

# Install dependencies
RUN apk add curl unzip bash git jq

# Clean up
RUN apk cache clean && rm -rf /var/cache/apk/*

# Install Terraform
RUN curl -fsSL https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_${TARGETARCH}.zip -o terraform.zip && \
    unzip terraform.zip && \
    mv terraform /usr/local/bin/ && \
    chmod +x /usr/local/bin/terraform && \
    rm terraform.zip

CMD ["terraform", "--version"]
ENTRYPOINT ["/usr/local/bin/terraform"]
