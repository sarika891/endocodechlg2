FROM centos:7
MAINTAINER Sarika
ENV gitcommit unspecified
RUN yum install -y git ruby ruby-devel curl python rpm-build wget
RUN git clone https://github.com/sarika891/nginx-chlng.git
RUN curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
RUN python get-pip.py
RUN pip install flask 
RUN mkdir chlng2
WORKDIR /chlng2
RUN pwd
ADD endocode.py /chlng2/
RUN ls -l
EXPOSE 8090
CMD [ "python", "/chlng2/endocode.py &"]
