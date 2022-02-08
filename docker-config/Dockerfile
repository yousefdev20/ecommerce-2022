FROM ubuntu:21.04

LABEL maintainer="Posta Plus technical team (Yousef)"

ARG WWWGROUP

WORKDIR /var/www/html/Iron

ENV TZ=UTC
ENV NODE_VERSION=16

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install php (8.1) and all package dependance.
# node, composer, mysql server(client) postgres
RUN apt-get update \
    && apt-get install -y nano gnupg gosu curl ca-certificates zip unzip git supervisor sqlite3 libcap2-bin libpng-dev python2 \
    && mkdir -p ~/.gnupg \
    && chmod 600 ~/.gnupg \
    && echo "disable-ipv6" >> ~/.gnupg/dirmngr.conf \
    && apt-key adv --homedir ~/.gnupg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys E5267A6C \
    && apt-key adv --homedir ~/.gnupg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys C300EE8C \
    && echo "deb http://ppa.launchpad.net/ondrej/php/ubuntu hirsute main" > /etc/apt/sources.list.d/ppa_ondrej_php.list \
    && apt-get update \
        && apt-get install -y php8.1-cli php8.1-dev \
           apache2 php8.1 php8.1-mysql libapache2-mod-php8.1 \
           php8.1-pgsql php8.1-sqlite3 php8.1-gd \
           php8.1-curl \
           php8.1-imap php8.1-mysql php8.1-mbstring \
           php8.1-xml php8.1-zip php8.1-bcmath php8.1-soap \
           php8.1-intl php8.1-readline \
           php8.1-ldap \
           php8.1-msgpack php8.1-igbinary php8.1-redis php8.1-swoole \
           php8.1-memcached php8.1-pcov php8.1-xdebug \
        && php -r "readfile('http://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer \
        && curl -sL https://deb.nodesource.com/setup_$NODE_VERSION.x | bash - \
        && apt-get install -y nodejs \
        && npm install -g npm \
        && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
        && echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list \
        && apt-get update \
        && apt-get install -y yarn \
        && apt-get install -y mysql-client \
        && apt-get install -y postgresql-client \
        && apt-get -y autoremove \
        && apt-get clean \
        && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN a2enmod php8.1
RUN a2enmod ssl
RUN a2enmod rewrite

# Update the PHP.ini file, enable <? ?> tags and quieten logging.
RUN sed -i "s/short_open_tag = Off/short_open_tag = On/" /etc/php/8.1/cli/php.ini
RUN sed -i "s/short_open_tag = Off/short_open_tag = On/" /etc/php/8.1/apache2/php.ini
RUN sed -i "s/allow_url_include = Off/allow_url_include = On/" /etc/php/8.1/cli/php.ini
RUN sed -i "s/allow_url_include = Off/allow_url_include = On/" /etc/php/8.1/apache2/php.ini
RUN sed -i "s/error_reporting = .*$/error_reporting = E_ERROR | E_WARNING | E_PARSE/" /etc/php/8.1/cli/php.ini
RUN sed -i "s/error_reporting = .*$/error_reporting = E_ERROR | E_WARNING | E_PARSE/" /etc/php/8.1/apache2/php.ini

# Manually set up the apache environment variables
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid

RUN setcap "cap_net_bind_service=+ep" /usr/bin/php8.1

RUN groupadd --force $WWWGROUP iron
RUN useradd -ms /bin/bash --no-user-group $WWWGROUP -u 1337 iron

COPY start-container /usr/local/bin/start-container
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY php.ini /etc/php/8.1/cli/conf.d/99-iron.ini
COPY 000-default.conf /etc/apache2/sites-enabled/000-default.conf
COPY /ssl/wildcard_postaplus_net.crt /etc/apache2/wildcard_postaplus_net.crt
COPY /ssl/wildcard_postaplus_net.key /etc/apache2/wildcard_postaplus_net.key

# Development stage run the application using supervisord.
# Note we cant run this application on server unsing supervisord becouse that cant support SSL.
RUN chmod +x /usr/local/bin/start-container
EXPOSE 8003

# By default start up apache in the foreground, override with /bin/bash for interative.
ENTRYPOINT ["start-container"]
