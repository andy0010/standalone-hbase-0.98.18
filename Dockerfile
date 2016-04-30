FROM ubuntu:12.04
MAINTAINER andy0010 

RUN echo "deb http://mirrors.163.com/ubuntu/ precise main universe restricted multiverse" >> /etc/apt/sources.list

RUN apt-get update && apt-get install -y  openssh-server vim 

#将sshd的UsePAM参数设置成no,并启动sshd
RUN sed -i 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config 
RUN mkdir /var/run/sshd 
RUN /usr/sbin/sshd &

#安装jdk,hbase
#:todo 环境变量
COPY jdk-6u45-linux-x64.bin /
COPY hbase-0.98.18-hadoop1-bin.tar.gz /
RUN /jdk-6u45-linux-x64.bin && tar -zvxf /hbase-0.98.18-hadoop1-bin.tar.gz
RUN rm /jdk-6u45-linux-x64.bin && rm /hbase-0.98.18-hadoop1-bin.tar.gz

#复制hbase配置
COPY conf/hbase-env.sh /hbase-0.98.18-hadoop1/conf/
COPY conf/hbase-site.xml /hbase-0.98.18-hadoop1/conf/


CMD ["/bin/bash"]

EXPOSE 2181 60000 60010 60020 60030

