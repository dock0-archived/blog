FROM akerl/arch
MAINTAINER akerl <me@lesaker.org>
VOLUME ["/srv/blog"]
RUN git clone git://github.com/akerl/blog.git /opt/blog
RUN pacman -S --noconfirm --needed ruby base-devel
RUN gem install --no-user-install jekyll
RUN jekyll build --source /opt/blog --destination /srv/blog
