With a CentOS host up and running, edit your hosts file to use the correct IP, then run the following:
```sh
eval `ssh-agent -s`
ssh-agent bash
ssh-add /var/lib/jenkins/workspace/amida-dev-17.pem
cd $WORKSPACE/deploy/ansible
export ANSIBLE_HOST_KEY_CHECKING=false
ansible-playbook playbook.yml -i hosts/dev.ini -u centos -vvvv -e "NODE_ENV=production"
```
For CentOS, remember to modify the `nginx.conf` to include `conf.d`.
Also, remember to set SELinux to Permissive mode:
```sh
$ setenforce Permissive
$ getenforce
Permissive
$ systemctl restart nginx
```