This Terraform module will provision an AWS environment with a static page that displays "Automation for the poeple"

Setup

- Clone this project to your /terraform directory.

- Make changes to variable.tf to input your keys or any other optional changes.

- Once you have done that, go ahead and run terraform apply.

- If everythings's ok, Login to your AWS consule to get the public IP of the provisioned EC2 ('TF_EC2' in my case) to test the static page.

- Copy and paste the public IP address on a web browser and it should display "Automation for the people"

Goodluck!

Note: This module requires terraform installed on your server!!

Einz
