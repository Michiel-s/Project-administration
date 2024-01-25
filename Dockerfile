FROM ampersandtarski/prototype-framework:v1

COPY src /usr/local/project/
COPY templates /usr/local/project/templates/

COPY ./ampersand /usr/local/bin/ampersand
RUN chmod +x /usr/local/bin/ampersand

# Generate prototype application from folder
RUN ampersand proto /usr/local/project/ProjectAdministration.adl \
  --proto-dir /var/www \
  --crud-defaults cRud \
  --verbose

COPY customizations /var/www/

RUN chown -R www-data:www-data /var/www/data
  # && cd /var/www \
  # && composer install --prefer-dist --no-dev --profile \
  # && npm install \
  # && gulp build-ampersand \
  # && gulp build-project