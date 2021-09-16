FROM ampersandtarski/prototype-framework:v1

COPY src /usr/local/project/
COPY templates /usr/local/project/templates/

# Generate prototype application from folder
RUN ampersand proto /usr/local/project/ProjectAdministration.adl \
  --proto-dir /var/www \
  --crud-defaults cRud \
  --verbose

COPY customizations /var/www/

RUN chown -R www-data:www-data /var/www/data /var/www/log /var/www/generics \
  && cd /var/www \
  # && composer install --prefer-dist --no-dev --profile \
  # && npm install \
  # && gulp build-ampersand \
  # && gulp build-project