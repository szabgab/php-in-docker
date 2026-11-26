FROM php:8.2-cli
RUN apt update                              && \
    apt -y upgrade                          && \
    apt install -y gpg-agent                && \
    apt install -y vim                      && \
    apt install -y tree                     && \
    apt install -y less                     && \
    apt install -y gawk                     && \
    apt install -y unzip                    && \
    echo done


# RUN echo start                                      && \
#     echo added                                                && \
#     echo done

RUN adduser --disabled-password --gecos "" ubuntu

WORKDIR /home/ubuntu
USER ubuntu

COPY bashrc /home/ubuntu/.bashrc


RUN echo Install composer                                                        && \
    mkdir /home/ubuntu/bin                                                       && \
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"    && \
    php -r "if (hash_file('sha384', 'composer-setup.php') === 'c8b085408188070d5f52bcfe4ecfbee5f727afa458b2573b8eaaf77b3419b0bf2768dc67c86944da1544f06fa544fd47') { echo 'Installer verified'.PHP_EOL; } else { echo 'Installer corrupt'.PHP_EOL; unlink('composer-setup.php'); exit(1); }" && \
    php composer-setup.php                             && \
    php -r "unlink('composer-setup.php');"             && \
    mv /home/ubuntu/composer.phar /home/ubuntu/bin/    && \
    echo done

#RUN echo Install sculpin                                           && \
#    /home/ubuntu/bin/composer.phar -V                        && \
#    /home/ubuntu/bin/composer.phar config --no-plugins allow-plugins.sculpin/sculpin-theme-composer-plugin true && \
#    /home/ubuntu/bin/composer.phar --no-interaction require sculpin/sculpin   && \
#    echo done


USER root
WORKDIR /opt

