REDIS SERVER INSTALL WITH ANSIBLE

INSTALL THE REDIS WITH FOLLOWING STEPS

Step1:
    Go to the your ansible machine and run below command.

    - git clone https://github.com/hafifbilgiler/ANSIBLE.git
    - cd ANSIBLE/Redis/Redis5/

Step2:
    Edit the inventory file with ip address of  machines that redis cluster will be installed.
    NOT(Important): Do not forget to edit cluster.yml file with your machine ip address. 

    - ansible-playbook install.yml -i inventory.txt

    Then you can use the redis cluster after the complete of redis cluster installation.
    Thanks.