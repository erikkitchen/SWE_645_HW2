HW 2
Erik Kitchen

See PDF with images

Class Home Page: http://swe645-erik-kitchen.com.s3-website-us-east-1.amazonaws.com/
HW 2 Cluster web app url: 34.139.240.116:8080/Student_Survey
HW 2 Demo Cluster web app url: 35.232.19.54:8080/Student_Survey

Prerequisites:
Git downloaded on computer
Github account
Must have Docker installed on local computer. Set up account here: https://hub.docker.com/

Set up git repository:
-	Create a GitHub repository, name it ‘SWE_645_HW2’ and make it public.
-	Open terminal and navigate to working files (take files in this repository if you do not have working files)
-	Run the following
o	git init
o	git add .
o	git commit -m “First commit”
o	git remote add origin < repository_url>
o	git push -u origin main

Start Learning Lab in AWS Academy Learner
-	Login to AWS Academy Learner (Dashboard (instructure.com))
-	Go to Courses and select “All Courses”
 
-	Select your course 
 
-	Click on Modules then “Learning Lab”
 
-	Agree to the terms and conditions, then open lab
-	Now you can start lab
 
-	Now you can utilize AWS services within $100

Set up Rancher:
-	Go to Learning Lab 
-	Create an EC2 instance (Make sure you are within the AWS Learning Lab above)
-	Select US-east-1 as your region
-	Name it, and select Ubuntu AMI (Ubuntu Server 22.04 LTS (HVM), SSD Volume Type)
-	Select instance type “t2.large”
-	Create key (Save key)
-	Click on allow HTTP requests and HTTPS requests under security
-	Create instance
-	Update read permissions to .pem file to just you
o	chmod 400 <Path/To/Key>
-	SSH into new instance with following command (If required update key permissions to read only through terminal: chmod 400 Rancher_Key.pem):
o	ssh -i "<Path/To/Key>" ubuntu@<DNS IP>
-	This takes you to the server. Now it is time to download Rancher on the server:
o	sudo apt-get update
o	sudo apt install docker.io
-	Run the following Docker command to run a rancher container:
o	sudo docker run --privileged=true -d --restart=unless-stopped -p 80:80 -p 443:443 rancher/rancher
-	Open your browser to your DNS address (Proceed through warning)
-	This will take you to Rancher login. Input the following to get password
 
o	sudo docker ps
	Take Container ID from this command to be used for the next command
	 
o	sudo docker logs  <container-id>  2>&1 | grep "Bootstrap Password:"
	 
-	Take Password from response and put it in the password field in docker
-	Keep or set new password
-	Accept terms and conditions and click “Continue”

Create Docker Image
-	In your preferred IDE create a file named “Dockerfile”
-	Save this file in the same folder as your HW1 Part 2. This should be saved inside of the same folder the .war file
-	In the Docker file input the following (Update LABEL to your name and email):
o	 
-	Now we need to build, push and run the docker image in the terminal
-	First navigate to the directory where the new docker file is located
-	 To build and push the docker image input the following (You can update the tag name):
o	docker build --tag <image_name>:<version> .
o	docker tag <source_image>:<source_version> <target_repository>/<target_image>:<target_version>
o	docker push erikkitchen/gmustudentsurvey:1
o	See example below:
o	 
o	 
-	Now we can test if it worked by running it:
o	docker run -it -p <host_port>:<container_port> <image_name>:<version>
o	 

Set up Kubernetes Cluster on GKE
-	Go to cloud.google.com and sign in. Either start the free trial or pay for service
-	Create a project (click on “My first project”, then click “New Project”)
 
-	Name your project, and leave location how it is
-	Click on your project name
 
-	Go to menu and click on Kubernetes Engine
 
-	Enable Kubernetes Engine API if asked (Usually only asks first time using)
-	Click on “Create”
 
-	Switch to Standard Cluster
 
-	Name cluster,  choose zonal, and update zone to “us-east4-c”
-	You will know the cluster is created when the green check shows up under status
 
-	Get google credentials
o	Go to IAM & Admin
o	 
o	Under the IAM & Admin menu select “Service Accounts”
o	On this page click on “Create Service Account”
o	Make a service account name and click “Create and Continue”
o	In the next section choose the role of “Owner” then click continue
o	You can leave the next section blank and click “Done” 
o	Now you will see the service account has been created
o	 
o	Click on the ellipsis next to the service account you created and click “Manage Keys”
o	This will take you to a new page, Click on “Add Key”, then “Create new key”
o	This will download a json file with the key (Save somewhere on computer as this will be used in the next section)

Import GKE Cluster into Rancher 
-	Click on “Import existing” 
 
-	Click on “Google GKE”
 
-	Update cluster name (All lowercase), and description
-	Now we have to get the “Google Project ID”, follow these steps
o	Open https://console.cloud.google.com/welcome/new?walkthrough_id=assistant_webhosting_index&project=swe645hw2-392201
o	Click on the dropdown next to “Google Cloud” and find your project
o	Once in your project find “ID” and copy the ID
o	 
-	Go back to Rancher and insert the ID to the “Google Project ID”
-	Click on the “Read from me” button locate your key json file and insert it then click on “Create”
-	Find your region and click “Load Cluster”
-	Under “Choose Cluster” find the cluster you created in the last section and click “Register Cluster”
-	Your new cluster will provision for several minutes, and once ready it will read “Active”
-	 


Install Jenkins 
-	Create an EC2 instance (Make sure you are within the AWS Learning Lab above)
-	Select US-east-1 as your region
-	Name it, and select Ubuntu AMI (Ubuntu Server 22.04 LTS (HVM), SSD Volume Type)
-	Select instance type “t2.large”
-	Create key (Save key)
-	Click on allow HTTP requests and HTTPS requests under security
-	Create instance
-	Click on the newly created Jenkins instance ID
-	Click on “Security”
-	Click on “Security Groups”
-	Click on “Edit inbond rule”, then click “Add rule”
-	In the new row of rules, do the following then save
o	Type: Custom TCP 
o	Port Range: 8080
o	Source: AnywhereIPV4
-	Update read permissions to .pem file to just you
o	chmod 400 <Path/To/Key>
-	SSH into new instance with following command (If required update key permissions to read only through terminal: chmod 400 Rancher_Key.pem):
o	ssh -i "<Path/To/Key>" ubuntu@<DNS IP>
-	Run update
o	sudo apt-get update
-	Install JDK
o	sudo apt install default-jdk 
-	Run to add Jenkins to repository
o	curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee   /usr/share/keyrings/jenkins-keyring.asc > /dev/null
o	echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]   https://pkg.jenkins.io/debian-stable binary/ | sudo tee   /etc/apt/sources.list.d/jenkins.list > /dev/null
-	Run to install docker
o	sudo apt-get update
o	sudo apt install docker.io
-	Run to install Jenkins
o	sudo apt-get update
o	sudo apt-get install jenkins
-	Run to install Kubectl
o	sudo apt install snapd
o	sudo snap install kubectl –classic
-	Add user to docker user group
o	sudo usermod -a -G docker jenkins
-	Go back to EC2 instance for Jenkins, his “instance state” dropdown then click “reboot instance”
-	Open up Rancher Dashboard
-	Click on “Manage” button
-	Check the cluster you created in the last section
-	Click “Download KubeConfig” button and save the yaml file
-	Go back to terminal and SSH back into the Jenkins EC2 instance 
-	Run to switch to Jenkins user
o	sudo su jenkins
-	Run to navigate to var/lib/jenkins and make directory .kube, then create config file inside then open it to edit
o	cd ..
o	cd ..
o	cd var/lib/jenkins
o	mkdir .kube
o	cd .kube
o	touch config
o	vi config
-	Copy and paste yaml file downloaded inside file (type :wq to save and quit) 
-	Quit session, then SSH back in through ubuntu
-	Run to get Jenkins password
o	sudo cat /var/lib/jenkins/secrets/initialAdminPassword
-	Go to Jenkins and input login password
o	http://<Public DNS>:8080
 
-	Install the suggested plugins
-	Now you can create an admin user for Jenkins, submit, then click on “Start using jenkins”
-	You are in Jenkins now (Set up Jenkins credentials for Jenkinsfile…Watch video 6)
 
-	To create a pipeline click on “New Item” 
-	Name your pipeline and click “Pipeline”
-	Check off “GitHub hook trigger for GITScm polling”
-	Go down to Pipeline section and do the following:
o	Definition: Pipeline script from SCM
o	SCM: Git
o	Repository URL: Copy your Github repository url (Click “code” drop dawn and copy github repository http url)
o	Lightweight checkout: Uncheck
o	Hit Save
-	Open your GitHub repository, and click on “Settings”
-	Go to “Webhooks”, then click on “Add Webhooks”
-	Input the following:
o	Payload URL: http://<Public DNS>:8080/github-webhook/
o	Click “Add Webhook”

Add Pods and expose webapp
-	Go to Rancher
-	Click on “Manage”
-	Click on “Explore” next to your cluster
-	Click on “Workloads” on navigation
-	Click on the name of your deployment
-	Go to “Scale” and update to 3
-	Now go to Google Cloud to “Kubernetes Engine”
-	Go to the side nav to “Workload”
-	Click on your deployment name with your cluster
-	Scroll all the way down and click expose
-	Input name and port
