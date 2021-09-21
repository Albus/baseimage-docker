FROM phusion/baseimage:master
ENV TZ="Europe/Moscow"
RUN install_clean tzdata
RUN echo $TZ > /etc/timezone && ln -sf /usr/share/zoneinfo/$TZ /etc/localtime

RUN install_clean language-pack-ru-base language-pack-en-base
ENV LANG="ru_RU.UTF-8" LC_ALL="ru_RU.UTF-8" LANGUAGE="ru_RU:en"
RUN locale-gen --purge en_US.UTF-8 ru_RU.UTF-8 \
 && update-locale --reset LANG=ru_RU.UTF-8 LC_ALL=ru_RU.UTF-8 LANGUAGE=ru_RU:en

RUN install_clean ssh-import-id python-is-python3 bash-completion mc
#RUN rm -f /etc/service/sshd/down
RUN ssh-import-id gh:albus
