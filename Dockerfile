FROM akerl/nginx
MAINTAINER akerl <me@lesaker.org>

RUN pacman -S --noconfirm --needed ruby
RUN gem install --no-user-install --no-rdoc --no-ri jekyll

RUN git clone git://github.com/akerl/blog.git /opt/blog
RUN jekyll build --source /opt/blog --destination /srv/blog

ADD blog.conf /etc/nginx/sites/blog.conf
