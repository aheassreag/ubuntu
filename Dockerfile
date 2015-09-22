# 继承的镜像
FROM ubuntu:14.04
# 作者信息
MAINTAINER sariel QQ1663641886 website:http://blog.eitsafe.pw
# 安装SSH服务和VIM服务
RUN apt-get install -y openssh-server vim
RUN mkdir -p /var/run/sshd
RUN mkdir -p /root/.ssh
RUN echo 'root:123qwer' |chpasswd
RUN sed -i "s/#UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config
RUN sed -i "s/UsePAM.*/UsePAM no/g" /etc/ssh/sshd_config
RUN sed -i 's/^PermitRootLogin without-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
# 取消PAM限制
RUN sed -i '/pam_loginuid.so/c session    optional     pam_loginuid.so'  /etc/pam.d/sshd
# 复制文件，给脚本可执行权限
# 设置开放端口
EXPOSE 21 22 80
