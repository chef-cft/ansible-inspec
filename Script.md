Hello everyone. My name is Colin and today we're going to demonstrate how to use test driven development with Chef InSpec and Ansible. We'll use Test Kitchen to execute our code on the platform or platforms of our choice.

Today's scenario will see us install Apache on CentOS 7.

Let's start by taking a look at the .kitchen.yml file. The .kitchen.yml file defines what is required to run Test Kitchen, including drivers, provisioners, platforms, and test suites. Test Kitchen can execute infrastructure code on various cloud providers and virtualization technologies such as Vagrant, Amazon EC2, Microsoft Azure, Google Compute Engine, Docker, and more. Test Kitchen also supports many testing frameworks out of the box, including Chef InSpec, Serverspec, and Bats. 

If we work our way through the kitchen.yml file we'll see several important sections. 

First, we'll be provisioning our systems with Vagrant which in turn is using VirtualBox.

Next, we see that our infrastructure code will be an Ansible playbook named "site.yml" In this section we can also see a few other options such as max_ssh_sessions. 

Later, on line seventeen, you can see I will be using Chef InSpec as my testing framework. Below that I define exactly which tests I would like Chef InSpec to run.

Test kitchen has four basic commands to provision platforms and test infrastructure code. 

Create - to create the target infrastructure (which is our CentOS node)
Converge - to run the infrastructure code (in our case the playbook)
Verify - to run the tests (in our case Chef InSpec tests)
Destroy - to destroy the target infrastructure (our CentOS node)

We're going to use test driven development which means our first step to automating the installation of Apache on our CentOS box is to write our tests.

I'll use three simple tests. First, the httpd (apache) package should be installed, second the httpd service should be enabled and running, third the system should be listening on port 80.

Now we'll run a kitchen create to bring up our test infrastructure, CentOS.

`kitchen create`

Now that our test environment is up, let's run our tests against it.

`kitchen verify`

As expected, the test fails. So now we write the code to pass the tests.  Currently, my site.yml contains a very simple beginning, instructions to update the yum cache. I'm going to work one by one through my failed tests and add the necessary instructions.

First, we'll install the package.

```
    - name: Install necessary packages  
      yum:  
        pkg: httpd  
        state: latest  
```

And we'll hit save, run our new instruction against the node.

`kitchen converge`

Then we'll rerun the test.

`kitchen verify`

And we see that our first test now passes but the second two still fail. Let's add instructions to pass the next two tests.

```
    - name: ensure httpd is running
      service:
        name: httpd 
        state: started
    - name: ensure httpd is enabled
      service:
        name: httpd
        enabled: yes
```

And again we'll hit save, run our new instruction against the node.

`kitchen converge`

And again we'll rerun the test.

`kitchen verify`

Now we see that all our tests passed. So far, we've been stacking our instructions and tests without destroying the infrastructure inbetween. It's a good idea at the end to run

`kitchen test`

Which will run,

```
kitchen destroy
kitchen create
kitchen converge
kitchen verify
kitchen destroy
```

testing the infrastructure from start to finish. Now that `kitchen test` has run from start to finish we know that if our playbook is applied our system will have the package installed, running and enabled, and listening on port 80.

Thanks for watching this demonstration. The related code can be found at:
https://github.com/colinedwardwood/ansible-inspec


