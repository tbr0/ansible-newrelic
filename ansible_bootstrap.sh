if [ -f /etc/redhat-release ]; then
  sleep 60
  yum install -y git python-pip python-devel gcc
  pip install paramiko PyYAML jinja2 httplib2 ansible
fi
if [ -f /etc/debian_version ]; then
  sleep 60
  apt-get update && apt-get install python-apt python-pip build-essential python-dev git -y
  pip install paramiko PyYAML jinja2 httplib2 ansible
fi 
