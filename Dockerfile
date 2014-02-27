FROM akerl/arch
MAINTAINER akerl <me@lesaker.org>
EXPOSE 80

RUN pacman -S --noconfirm --needed ruby base-devel nginx
RUN gem install --no-user-install --no-rdoc --no-ri jekyll

RUN git clone git://github.com/akerl/blog.git /opt/blog
RUN jekyll build --source /opt/blog --destination /srv/blog

ADD nginx.conf /etc/nginx/nginx.conf
ADD run /etc/sv/nginx/run
RUN ln -s /etc/sv/nginx /service/
