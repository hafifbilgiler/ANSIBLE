This Document Tell The Nginx Web Server Installation With Ansible Automation Platform                                                                                                              
If you want install the nginx, you should follow below steps; 

==============================================================================
1) You should create ssh key and copy remote machine or machines:
   
 -   ssh-keygen
 -   ssh-copy-id root@"your_target_machine_ip_adress"

2) Then after you just run command and you should looks installation:
 -  ansible-palybook install.yml -i inventory.txt

3) You can go remote machine and control the nginx web server.
 -  systemctl status nginx


===============================================================================