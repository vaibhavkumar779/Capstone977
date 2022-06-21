FROM centos:latest
COPY app mail
WORKDIR mail
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum install net-tools -y
RUN yum install httpd -y
RUN yum install python3 -y
RUN set -ex \
	 	expat-dev 
COPY requirements.txt /home
RUN pip3 install -r /home/requirements.txt


EXPOSE 3000 5050

CMD ["python3", "app.py"]
                                        
