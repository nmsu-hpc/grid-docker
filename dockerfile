# Use Offical Centos 7
FROM centos:7

# Set the working dir to /tmp
WORKDIR /tmp

# Install HTCONDOR repo and install condor and vim
RUN curl -O https://research.cs.wisc.edu/htcondor/yum/RPM-GPG-KEY-HTCondor
RUN rpm --import RPM-GPG-KEY-HTCondor
RUN cd /etc/yum.repos.d
RUN curl -O https://research.cs.wisc.edu/htcondor/yum/repo.d/htcondor-stable-rhel7.repo
RUN yum install -y condor-all vim

# Make port 9618 availble to the outside world
EXPOSE 9618

