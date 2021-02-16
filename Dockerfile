FROM fedora 

RUN dnf update -y 
RUN dnf install -y python3-pip git openssh-server python3-devel gcc which iproute bind-utils net-tools iputils mlocate diffutils findutils tree
RUN pip3 install boto boto3 cdpcli openstacksdk python-openstackclient 
RUN pip3 install ansible
RUN pip3 install pywinrm

# copy default ansible configuration files
COPY .ansible.cfg /root/.ansible.cfg
COPY hosts /etc/ansible/hosts

COPY .bashrc /root/.bashrc

CMD [“echo”,”Image created”]
