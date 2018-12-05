#!/usr/bin/env bash

sudo su

cd ~

rpm -Uvh http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

yum install -y munge-devel munge-libs readline-devel perl-ExtUtils-MakeMaker openssl-devel pam-devel rpm-build perl-DBI perl-Switch munge mariadb-devel

wget https://download.schedmd.com/slurm/slurm-18.08.3.tar.bz2

tar -xjf slurm-18.08.3.tar.bz2 -C /etc/

mv /etc/slurm-18.08.3 ./slurm

rpm -Uvh ./rpmbuild/RPMS/x86_64/*.rpm

echo "Installations are done!"
