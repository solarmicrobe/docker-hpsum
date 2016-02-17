FROM million12/centos-supervisor:latest
USER root
RUN yum -y install wget getopt util-linux-ng redhat-lsb-core pciutils dmidecode
ADD http://downloads.linux.hpe.com/SDR/add_repo.sh /root/add_repo.sh
RUN chmod +x /root/add_repo.sh; /root/add_repo.sh -d RedHat -r 6 hpsum
RUN yum -y install hpsum; yum clean all
COPY hpsum.conf /etc/supervisor.d/
EXPOSE 63001 63002 9111
