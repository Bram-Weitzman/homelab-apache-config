FROM php:8.2-apache
RUN apt-get update && apt-get install -y \
    curl \
    gnupg \
    && curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Enable Rewrite and the Proxy modules needed for Next.js
RUN a2enmod rewrite proxy proxy_http

WORKDIR /var/www/html
