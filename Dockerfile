FROM php:8.2-cli

# RUN echo start                                      && \
#     echo added                                                && \
#     echo done

RUN adduser --disabled-password --gecos "" ubuntu

WORKDIR /home/ubuntu
USER ubuntu

COPY bashrc /home/ubuntu/.bashrc

USER root
WORKDIR /opt

