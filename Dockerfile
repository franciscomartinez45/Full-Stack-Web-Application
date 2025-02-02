# Use official PHP Apache image
FROM php:8.1-apache

# Install required PHP extensions
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Enable Apache mod_rewrite (for friendly URLs)
RUN a2enmod rewrite

# Copy project files to the Apache server directory
COPY . /var/www/html/

# Set correct permissions
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Expose port 8080 (required for Cloud Run)
EXPOSE 8080

# Start Apache in the foreground
CMD ["apache2-foreground"]
