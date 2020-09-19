REDIS SERVER INSTALL WITH ANSIBLE

The following steps will be followed to install redis server

Step1:
    Enter to the ansible machine and run below command.

    - git clone https://github.com/hafifbilgiler/ANSIBLE.git
    - cd ANSIBLE/Redis/Redis5/

Step2:
    Open inventory file and variable/vars.yml file to edit and customization to installation. Vars file can stay the default setting but you must add ip address in inventory file. Then after should run below command to installation redis server.

    - ansible-playbook install.yml -i inventort.txt

    Then after you must see installation with succes...

    Thanks.