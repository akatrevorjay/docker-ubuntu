FROM ubuntu:trusty
MAINTAINER Trevor Joynson "docker@skywww.net"

# Add files
ADD ./files /opt/base

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

# Add multiverse repos
#ADD ./multiverse.list /etc/apt/sources.list.d/multiverse.list
#RUN sed -i "s/\$codename/$(lsb_release -cs)/g" /etc/apt/sources.list.d/multiverse.list

# Update repos, upgrade possible
#RUN apt-get update -qq \
#    && apt-get dist-upgrade -qqy \
#    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
#    && :

# Fix locale
ENV LANGUAGE en_US.UTF-8
ENV LANG $LANGUAGE
RUN /opt/base/set-locale

# Timezone
#ENV TZ "US/Eastern"
#RUN /opt/base/set-timezone

# Add in entrypoint
ENTRYPOINT ["/opt/base/entrypoint"]
