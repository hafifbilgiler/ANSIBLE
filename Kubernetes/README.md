This Document Tell The Kubernetes Cluster Installation With Ansible Automation Platform                                                                                                              
If you want install the kubernetes cluster, you should follow below steps; 
NOTE: This code is only valid for systems with a master and a worker node

==============================================================================
1) You should create ssh key and copy remote machine or machines:
   
 -   ssh-keygen
 -   ssh-copy-id root@"your_target_master_machine_ip_adress"
 -   ssh-copy-id root@"your_target_worker_machine_ip_adress"
2) Then after you just run command and you should looks installation:
 -  ansible-playbook install.yml -i inventory.txt

3) You can go remote machine and control the kubernetes cluster...
 -  kubectl get nodes

===============================================================================