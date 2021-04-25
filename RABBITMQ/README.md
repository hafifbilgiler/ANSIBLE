RABBITMQ SERVER INSTALL WITH ANSIBLE

I WILL EXPLAIN THE INSTALLATION OF RABBITMQ SERVER CLSUTER ON LINUX MACHINE WITH ANSIBLE

You can follow command bwlow to installation of rabbitmq cluster

Step1:
    Enter to the ansible machine and run below command.

    - git clone https://github.com/hafifbilgiler/ANSIBLE.git
    - cd ANSIBLE/Redis/RABBITMQ/

Step2:
    Open inventory file and variables/vars.yml file to edit and customization to installation. Vars file can stay the default setting but you must add ip address in inventory file. Also you can choose RabbitMQ version if you want. I choosen 3.8.14 version. Then after you should run below command to installation of rabbitmq server cluster on linux OS.

    - ansible-playbook install.yml -i inventort.txt

    Then after you must see installation complated with succes...

    Thanks.