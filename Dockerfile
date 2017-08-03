FROM php:7.1.7-alpine

ENV APP_DIR="/root/laravel" \
    APP_PORT="80"

COPY . $APP_DIR

RUN curl -sS https://getcomposer.org/installer | php -- \
  --install-dir=/usr/bin --filename=composer

RUN cd $APP_DIR && composer install

WORKDIR $APP_DIR

EXPOSE 8000

ENTRYPOINT ["php","artisan","serve","--host=0.0.0.0","--port=8000"]
