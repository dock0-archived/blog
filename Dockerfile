FROM akerl/nginx
MAINTAINER akerl <me@lesaker.org>

RUN pacman -S --noconfirm --needed ruby base-devel
RUN git clone git://github.com/akerl/blog.git /opt/blog
RUN gem install --no-user-install bundler
RUN bundle install --gemfile=/opt/blog/Gemfile
RUN jekyll build --source /opt/blog --destination /srv/blog

ADD blog.conf /etc/nginx/sites/blog.conf
