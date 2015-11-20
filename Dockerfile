FROM ubuntu:trusty
MAINTAINER Trevor Joynson "docker@skywww.net"

ENV DEBIAN_FRONTEND=noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN=true

ENV LANG=en_US.UTF-8
ENV LANGUAGE=$LANG
ENV TZ=Etc/UTC

#RUN apt-get update -qq \
#    && apt-get install -qqy software-properties-common \
#    && apt-add-repository multiverse \  # Add multiverse repos
#    && apt-get dist-upgrade -qqy \      # Upgrade possible
#    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
#    && :

# Add files
#ADD sbin /sbin/

RUN echo "Setting locale to $LANG" \
    && locale-gen "$LANG" \
    && dpkg-reconfigure --frontend noninteractive locales \
    && :
#    && echo "Setting timezone to $TZ" \
#    && echo "$TZ" > /etc/timezone \
#    && dpkg-reconfigure --frontend noninteractive tzdata \
#    && :
