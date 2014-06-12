FROM dockerfile/ubuntu
MAINTAINER David Gageot <david@gageot.net>

ENV DEBIAN_FRONTEND noninteractive

# From instructions here: https://github.com/pagespeed/ngx_pagespeed

# Install dependencies
RUN sudo apt-get install -y build-essential zlib1g-dev libpcre3 libpcre3-dev

# Download ngx_pagespeed
RUN cd /tmp \
	&& wget https://github.com/pagespeed/ngx_pagespeed/archive/v1.8.31.2-beta.zip \
	&& unzip v1.8.31.2-beta.zip
RUN cd /tmp/ngx_pagespeed-1.8.31.2-beta/ \
	&& wget https://dl.google.com/dl/page-speed/psol/1.8.31.2.tar.gz \
	&& tar -xzvf 1.8.31.2.tar.gz

# Download and build nginx
RUN cd /tmp \
	&& wget http://nginx.org/download/nginx-1.4.6.tar.gz \
	&& tar -xvzf nginx-1.4.6.tar.gz
RUN cd /tmp/nginx-1.4.6 \
	&& ./configure --add-module=/tmp/ngx_pagespeed-1.8.31.2-beta \
	&& make \
	&& sudo make install

# Comfigure nginx
RUN echo "\ndaemon off;" >> /usr/local/nginx/conf/nginx.conf

WORKDIR /usr/local/nginx

ENTRYPOINT ["/usr/local/nginx/sbin/nginx"]

EXPOSE 80
EXPOSE 8080
EXPOSE 443