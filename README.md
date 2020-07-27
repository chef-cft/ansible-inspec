# Test Kitchen, Ansible and InSpec
This repo lets you demonstrate test driven development using Ansible and Test Kitchen

# Prerequisites
Install test kitchen, inspec, and ansible. Install the kitchen-ansible gem (Chef gem install kitchen-ansible)

# Description here
`kitchen create`  <-- create our test VM  
`kitchen verify`  <-- look doesn't pass first test  
Let's write some code to let it pass the test!  
`kitchen converge` <-- this will run our ansible playbook  
`kitchen verify` <-- this will run the test again  

