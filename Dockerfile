# Use Ubuntu as base
FROM ubuntu:latest

# Set environment variables to avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install Apache, PHP 8.3, and required dependencies
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:ondrej/php && \
    apt-get update && \
    apt-get install -y apache2 php8.3 libapache2-mod-php8.3 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install additional PHP extensions
RUN apt-get update && \
    apt-get install -y php8.3-mysql php8.3-gd php8.3-xml php8.3-mbstring && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Expose HTTP port
EXPOSE 80

# Start Apache in foreground
CMD ["apachectl", "-D", "FOREGROUND"]

