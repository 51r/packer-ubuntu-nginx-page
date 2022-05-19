# Packer template for AMI with nginx.

This repo contains packer template that creates instance for AWS that contains the following:
* Latest version of Nginx
* Latest release of the current index.html.
* latest version of Unzip

## How to use the template
This guide applies to Mac, for other OS it may vary. 
* You need to have packer  installed on you workstation
   *  for MacOS you can install it using [homebrew](https://brew.sh/)
   
    ```
    brew install packer
    ```
  
   *  for any other OS click [here](https://packer.io/downloads.html) 

* Clone this repo locally to a folder of your choice
```
git clone https://github.com/51r/packer_ubuntu_aws.git
```
* Make sure you are in the main directory of the repo:

```
cd packer-ubuntu-nginx-page
```
* Make sure you have allowed Packer to access your IAM user credentials, set your AWS access key ID as an environment variable
```
export AWS_ACCESS_KEY_ID="<YOUR_AWS_ACCESS_KEY_ID>"
```
* Then set your secret key:
```
export AWS_SECRET_ACCESS_KEY="<YOUR_AWS_SECRET_ACCESS_KEY>"
```
* Then set your AWS region:
```
export AWS_DEFAULT_REGION="<YOUR_AWS_REGION>"
```
If you don't have access to IAM user credentials, you can authenticate AWS using different methods described [here](https://www.packer.io/plugins/builders/amazon#authentication)
* Initialize Packer:
```
packer init .
```
If you initialize Packer for the first time, you should get the following message:
```
Installed plugin github.com/hashicorp/amazon v0.0.2 in "/Users/youruser/.packer.d/plugins/github.com/hashicorp/amazon/packer-plugin-amazon_v0.0.2_x5.0_darwin_amd64"
```
It will download Amazon Plugin which is required for the following instance to be build. Keep in mind that if you initialise the packer again, it will not show you any input, as the plugins needed for the instance are already downloaded.
* Build your environment:
```
packer build template.hcl
```
The installation log will be printed to the screen.In the end you should get the following output: 
```
==> Builds finished. The artifacts of successful builds are:
--> learn-packer.amazon-ebs.ubuntu: AMIs were created:
<YOUR_AWS_REGION: ami-ID
```
* Visit the AWS AMI page to verify that Packer successfully built your AMI. **learn-packer-ubuntu-aws**

* Select your AMI and click the button on the top right "Launch instance from AMI".

* Now you can enter your Public IPv4 address in any browser and it will show index.html. (keep in mind that it doesn't have SSL certificate and it won't work over port 443 or https://.

## What does the script.sh do
1. Update the package lists
2. Install nginx & unzip
3. Download latest release оf the code to the instance
4. Unzip release.zip
5. Allow nginx in firewall
6. Clean-up 
