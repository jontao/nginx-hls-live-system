#########################################################################
# File Name: setup.sh
# Author: jonta
# mail: jonta@foxmail.com
# Created Time: Mon 20 Mar 2017 11:13:32 AM EDT
#########################################################################
#!/bin/bash
cd openssl-0.9.8e
./config
cd ../nginx-1.8.1
./configure --prefix=/usr/local --conf-path=/etc/nginx/nginx.conf --error-log-path=/var/log/nginx/error.log --http-log-path=/var/log/nginx/access.log --pid-path=/var/run/nginx.pid --lock-path=/var/run/nginx.lock --http-client-body-temp-path=/var/cache/nginx/client_temp --http-proxy-temp-path=/var/cache/nginx/proxy_temp --http-fastcgi-temp-path=/var/cache/nginx/fastcgi_temp --http-uwsgi-temp-path=/var/cache/nginx/uwsgi_temp --http-scgi-temp-path=/var/cache/nginx/scgi_temp --user=nginx --group=nginx --with-http_ssl_module --with-http_realip_module --with-http_addition_module --with-http_sub_module --with-http_dav_module --with-http_flv_module --with-http_mp4_module --with-http_gunzip_module --with-http_gzip_static_module --with-http_random_index_module --with-http_secure_link_module --with-http_stub_status_module --with-mail --with-mail_ssl_module --with-ipv6 --with-cc-opt='-O2 -g -pipe -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector' --add-module=/usr/local/src/nginx-hls-live-system/nginx-rtmp-module-master --add-module=/usr/local/src/nginx-hls-live-system/nginx_mod_h264_streaming-2.2.7 --with-openssl=/usr/local/src/nginx-hls-live-system/openssl-0.9.8e --add-module=/usr/local/src/nginx-hls-live-system/nginx_tcp_proxy_module;
exit
if [ $? -eq 0 ]
then
    echo "configure successed!!"
	make
	if [ $? -eq 0 ]
	then
		make install
		echo "nginx has been installed!!"
	else 
		echo "make failed!!"
		exit
	fi
else
    echo "configure failed!!"
	exit
fi
rm -rf /var/log/nginx /var/cache/nginx
echo "mkdir /var/log/nginx /var/cache/nginx "
mkdir /var/log/nginx /var/cache/nginx
echo "cp config files nginx to /etc/"
rm -rf /etc/nginx
tar xf ../nginx.tar.bz2 -C /etc/
cd ../
adduser --system --no-create-home --disabled-password --user-group nginx
exit

