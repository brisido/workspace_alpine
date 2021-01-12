# Pull base image
FROM alpine:3.12

# Install apps
RUN \
  apk update && \ 
  apk add py-pip vim htop zip less groff tree jq openssl bash shadow neofetch git curl openssh gnupg coreutils && \
  pip install awscli && \
  wget https://releases.hashicorp.com/terraform/0.12.21/terraform_0.12.21_linux_amd64.zip && \
  unzip terraform_0.12.21_linux_amd64.zip -d /bin && \
  rm terraform_0.12.21_linux_amd64.zip && \
  echo $'#!/bin/bash\nclear\nneofetch'> /etc/profile.d/bash_completion.sh && \
  usermod --shell /bin/bash root

# Copy bash settings
COPY .bashrc /root

# Define working directory
WORKDIR /home

# Define default command
CMD ["bash"]
