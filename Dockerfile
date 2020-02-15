FROM node:10
EXPOSE 8888
RUN cat /etc/os-release \
    # 阿里源
    && cp /etc/apt/sources.list /etc/apt/sources.list.bak \
    && echo "deb http://mirrors.aliyun.com/debian/ stretch main non-free contrib\
    \ndeb-src http://mirrors.aliyun.com/debian/ stretch main non-free contrib\
    \ndeb http://mirrors.aliyun.com/debian-security stretch/updates main\
    \ndeb-src http://mirrors.aliyun.com/debian-security stretch/updates main\
    \ndeb http://mirrors.aliyun.com/debian/ stretch-updates main non-free contrib\
    \ndeb-src http://mirrors.aliyun.com/debian/ stretch-updates main non-free contrib\
    \ndeb http://mirrors.aliyun.com/debian/ stretch-backports main non-free contrib\
    \ndeb-src http://mirrors.aliyun.com/debian/ stretch-backports main non-free contrib\
    \n" > /etc/apt/sources.list \
    # PHP
    && apt-get update \
    && apt-get install apt-transport-https lsb-release ca-certificates -y \
    && wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg \
    && echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list \
    && apt-get update \
    && apt-get install php5.6 php5.6-fpm php5.6-cgi php5.6-mysql php5.6-xsl php5.6-xml php5.6-tidy php5.6-recode php5.6-mcrypt php5.6-mbstring php5.6-intl php5.6-gd php5.6-curl php5.6-json php5.6-imagick php5.6-bcmath php5.6-readline php5.6-sqlite3 -y\
    && update-alternatives --config php \
    && php -v \
    # Java
    && apt install default-jdk -y \
    && java -version \
    # fis-plus
    && npm install -g fis-plus -registry https://registry.npm.taobao.org \
    && fisp -v
CMD [ "fisp", "server", "init" ]