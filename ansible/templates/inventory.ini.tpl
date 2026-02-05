[webservers]
web1 ansible_host=${vm_1_ip}
web2 ansible_host=${vm_2_ip} 

[webservers:vars]
ansible_user=ilrosch