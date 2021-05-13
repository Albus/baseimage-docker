FROM phusion/baseimage:master
ENV HOME="/root" TZ="Europe/Moscow" LANG="ru_RU.UTF-8" LC_ALL="ru_RU.UTF-8" LANGUAGE="ru_RU:en"
RUN echo $TZ > /etc/timezone && ln -sf /usr/share/zoneinfo/$TZ /etc/localtime \
 && locale-gen --purge en_US.UTF-8 ru_RU.UTF-8 \
 && update-locale --reset LANG=ru_RU.UTF-8 LC_ALL=ru_RU.UTF-8 LANGUAGE=ru_RU:en
RUN install_clean language-pack-ru tzdata ssh-import-id
RUN rm -f /etc/service/sshd/down & ssh-import-id gh:albus