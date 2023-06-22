Erik Kitchen

Homework 1 

Part 1 - Class Website:
Class Website link: http://swe645-erik-kitchen.com.s3-website-us-east-1.amazonaws.com/

1. Create static web application
2. Go to Amazon S3 site: https://s3.console.aws.amazon.com/s3/get-started?region=us-east-1&region=us-east-1
3. Create Bucket
4. Upload web application files

Part 2 - Student Survey
Student survey link: https://ec2-3-20-221-132.us-east-2.compute.amazonaws.com/Student_Survey/

1. Create web application
2. Go to EC3 page: https://us-east-2.console.aws.amazon.com/ec2/home?region=us-east-2#Home:
3. Launch instance
    a. Name instance
    b. Select "Apache Tomcat packaged by Bitnami" AMI
    c. Set up Key Pair (.pem for mac...Save somewhere on computer)
    d. Launch the instance
4. Click on Public IPv4 address or Public IPv4 DNS which will take you to Apache Tomcat
5. Click on Management app (Require Username and password... If pop up doesn't show up see instructions below to fix)
6. Acquire Username and password
    a. Open terminal (type the following)
    b. chmod 600 {Path to Key}
        ba. ex. chmod 600 /Users/erikkitchen/Desktop/SWE645_Key.pem (This is for mine)
    c. ssh -i  {Path to Key} bitnami@{IPv4 address or Public IPv4 DNS}
        ca.  ssh -i /Users/erikkitchen/Desktop/SWE645_Key.pem bitnami@ec2-3-20-221-132.us-east-2.compute.amazonaws.com
    d. This will open Apache Tomca on terminal
    e. ubtain pasword by typing:
        ea. cat bitnami_credentials
7. Use those credentials to login
8. Deploy War file in management page 




Additional notes:

Update username and password
1. Open Apache Tomcat on terminal (See above)
2. Type the following:
    a. cd stack
    b. cd tomcat
    c. cd conf
    d. Nano tomcat-users.xml
        da. This will allow you to edit file in terminal. Update username and password here.
    e. save
3. Close terminal



If login popup isn't showing up
1. Open Apache Tomcat on terminal (See above)
2. Type the following:
    a. sudo su root
        aa. This will make you the root user. Allow you to edit certain files
    b. cd stack
    c. cd tomcat
    d. cd webapps
    e. cd manager
    f. cd META-INF
    g. nano web.xml
        ga. This will allow you to edit file in terminal.
        gb. Comment out the following code:
            <Valve className="org.apache.catalina.valves.RemoteAddrValve"
            allow="127\.\d+\.\d+\.\d+|::1|0:0:0:0:0:0:0:1" />
    h. Save
    i. cd ../
    j. cd ../
    k. cd host-manager
    l. cd META-INF
    m. nano web.xml
        ma. This will allow you to edit file in terminal.
        mb. Comment out the following code:
            <Valve className="org.apache.catalina.valves.RemoteAddrValve"
            allow="127\.\d+\.\d+\.\d+|::1|0:0:0:0:0:0:0:1" />
    n. Save

        
            



# SWE_645_HW2
