cd ~/rpmbuild/BUILD/slurm-18.08.3/
./configure
make
make install

cd ~

useradd slurm
usermod -aG wheel slurm

mkdir /var/log/slurm
chown slurm /var/log/slurm

mkdir /var/spool/slurm
chown slurm /var/spool/slurm

mkdir /var/spool/slurmd
chown slurm /var/spool/slurmd

echo "CgroupAutomount=yes
ConstrainCores=yes" > /etc/slurm/cgroup.config

echo "ArchiveEvents=yes
ArchiveJobs=yes
ArchiveSteps=no
ArchiveSuspend=no
#ArchiveScript=/usr/sbin/slurm.dbd.archive
AuthInfo=/var/run/munge/munge.socket.2
AuthType=auth/munge
DbdHost=slurm-master
DebugLevel=4
PurgeEventAfter=1month
PurgeJobAfter=12month
PurgeStepAfter=1month
PurgeSuspendAfter=1month
LogFile=/var/spool/slurm/slurmdbd.log
PidFile=/var/spool/slurm/slurmdbd.pid
SlurmUser=slurm
StoragePass=''
StorageType=accounting_storage/mysql
StorageUser=slurm" > /etc/slurm/slurmdbd.conf

echo "
SlurmctldHost=head
MpiDefault=none
ProctrackType=proctrack/
ReturnToService=
SlurmctldPidFile=/var/run/slurmctld.pid
SlurmctldPort=6817
SlurmdPidFile=/var/run/slurmd.pid
SlurmdPort=6818
SlurmdSpoolDir=/var/spool/slurmd
SlurmUser=slurm
StateSaveLocation=/var/spool
SwitchType=switch/none
TaskPlugin=task/affinity
TaskPluginParam=Sched
InactiveLimit=0
KillWait=30
MinJobAge=300
SlurmctldTimeout=120
SlurmdTimeout=300
Waittime=0
FastSchedule=1
SchedulerType=sched/backfill
SelectType=select/cons_res
SelectTypeParameters=CR_Core
AccountingStorageType=accounting_storage/none
AccountingStoreJobComment=YES
ClusterName=cluster
JobCompType=jobcomp/none
JobAcctGatherFrequency=30
JobAcctGatherType=jobacct_gather/none
SlurmctldDebug=3
SlurmdDebug=3
NodeName=compute-[1-12] CPUs=1 State=UNKNOWN
PartitionName=debug Nodes=compute[1-12] Default=YES MaxTime=INFINITE State=UP" | tee /etc/slurm/slurm.conf /usr/local/etc/slurm.conf
