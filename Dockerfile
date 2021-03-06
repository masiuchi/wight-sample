FROM centos:6

RUN yum -y install epel-release
RUN yum -y install npm tar bzip2 openssl-devel freetype-devel fontconfig-devel libicu-devel sqlite-devel libpng-devel libjpeg-devel
RUN npm install -g phantomjs

RUN yum -y install perl perl-core wget
RUN wget -O - https://cpanmin.us | perl - App::cpanminus
WORKDIR /work
COPY cpanfile /work/cpanfile
RUN cpanm --installdeps .

