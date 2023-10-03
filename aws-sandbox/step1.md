This sandbox provides a temporary generated username and password to work with Amazon Web Services (AWS). When starting this sandbox, it takes a moment to create these credentials.

Once the credentials have been created, the AWS CLI will be already configured and ready to use. From the CLI, you can create and manage your AWS resources.

You can log into the AWS Management Console using the unique URL and login credentials provided in the terminal window at the beginning of the sandbox. 

NOTE: We recommend using an incognito or private browsing window, especially if you have an existing AWS account. 

If you need to be reminded of the username and password, run the following commands:

`echo "Log in URL: $console" \
"Username: $username" \
"Password: $password"`{{execute}}

**NOTE**: The credentials will automatically expire after one hour, and the system will remove any resources you have created.

**NOTE**: Some commands in this sandbox may take several minutes to run.

**NOTE**: While we strive to provide the most comprehensive access necessary with these accounts, there are some limitations. You will be alerted in the sandbox if you do not have access. For complete details, visit our [interactive support center](https://www.oreilly.com/online-learning/support/cloud-lab-specifications.html#aws).


# When You're Done
When you're finished exploring the sandbox, click "Finish" to end this session.
