FROM centos:7

MAINTAINER YANA Docker Maintainers "yibitx@126.com"

ENV YANA_VERSION "0.0.1" 

RUN yum install -y openssh-server sudo

RUN echo "UseDNS no" >> /etc/ssh/sshd_config 
RUN echo "AddressFamily inet" >> /etc/ssh/sshd_config 
RUN echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
RUN echo "SyslogFacility AUTHPRIV" >> /etc/ssh/sshd_config 
RUN echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config 

RUN echo "root:_mlc_08u_@#_" |chpasswd

RUN ssh-keygen -q -N "" -t dsa -f /etc/ssh/ssh_host_dsa_key
RUN ssh-keygen -q -N "" -t rsa -b 2048 -f /etc/ssh/ssh_host_rsa_key
RUN ssh-keygen -q -N "" -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key
RUN ssh-keygen -q -N "" -t ed25519 -f /etc/ssh/ssh_host_ed25519_key

RUN mkdir /var/run/sshd

# Install gcc, g++ and or all tools and dependenct libraries
RUN set -ex \
	&& yum install -q -y gcc gcc-c++ gdb \
	clang clang-devel clang-analyzer \
	make cmake automake autoconf autohead libtool \
	libstdc++-docs \
	libuuid-devel \
	libzip-devel \
	libiconv-devel \
	openssl-devel \
	pcre-devel \
	ncurses-devel \
	curl jq file wget uuid vim tree \
	man-pages git-core \
	lsof mlocate tcpdump \
	crontab

RUN set -ex \
    && wget -O get-pip.py https://bootstrap.pypa.io/get-pip.py \
    && python get-pip.py

COPY . /yana

WORKDIR /yana

RUN set -ex \
    && make \
    && make test

EXPOSE 19221 8765

CMD ["/usr/sbin/sshd", "-p 19221", "-D"]
