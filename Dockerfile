FROM docker.pkg.github.com/ampersandtarski/prototype/prototype-framework:latest

COPY . /usr/local/project

# Generate prototype application from folder
RUN ampersand proto /usr/local/project/ProjectAdministration.adl \
  --proto-dir /var/www \
  --crud-defaults cRud \
  --customizations customizations \
  --verbose

RUN chown -R www-data:www-data /var/www/data /var/www/log /var/www/generics \
  && cd /var/www \
  # && composer install --prefer-dist --no-dev --profile \
  # && npm install \
  # && gulp build-ampersand \
  # && gulp build-project