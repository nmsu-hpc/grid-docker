# Use Offical Centos 7
FROM centos:7

# Set the working dir to /tmp
WORKDIR /tmp

# Install HTCONDOR repo and install condor and vim
RUN set -ex \
        && mkdir -p /var/run/lock \
        && yum makecache fast \
        && yum -y install wget vim \
        && wget -qO /etc/yum.repos.d/htcondor-stable-rhel7.repo https://research.cs.wisc.edu/htcondor/yum/repo.d/htcondor-stable-rhel7.repo \
        && wget -qO /etc/pki/rpm-gpg/RPM-GPG-KEY-HTCondor http://research.cs.wisc.edu/htcondor/yum/RPM-GPG-KEY-HTCondor \
        && rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-HTCondor \
        && yum -y remove wget \
        && yum -y install condor python-devel python-pip \
        && yum clean all
CMD ["/tmp/ip_script.sh"]
COPY condor_config /etc/condor/condor_config
COPY condor-wrapper.sh /tmp/condor-wrapper.sh

ENTRYPOINT "./condor-wrapper.sh"  && /bin/bash

# Make port 9618 availble to the outside world
EXPOSE 9618


