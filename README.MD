# What is this Project for
This project contains files for integrating gradle, cucumber for exisiting WSO2 integratior project. After integration you can build and deploy wso2 car apps to WSO2 integrator.

# How to use it
Clone `migration-config` repository to one level above to your wso2 integration and composite application project. Folder structure should be as following.
```
├── deployment_config
└── test-project-1
    ├── test-project-1
    └── test-project-1CompositeApplication
```
In the above example `test-project-1` should be the root folder which contains wso2 synapse configs and wso2 composite application.

Now run  `./init_gradle.sh <project_name>`. <project name> should be replaced with your project name you want to add gradle and cucumber. in the above example `test-project-1` should be used with `/init_gradle.sh ` command.

after running `./init_gradle.sh <project_name>` command verify wso2 project contains initial gradle skeltan.

# Deploying
To deploy projects locally follow the below steps.
1. copy `wso2carbon.jks` from your `wso2ei-6.5.0/repository/resources/security` to your composite application project. In this example `test-project-1CompositeApplication/src/main/resources/security`. alternatively you can change `<trustStorePath>` element in the pom.xml in the composite application.
2. finally run the `./gradlew deployWSO2` command from your project root directory
# Executing cucumber tests
1. Execute the `/gradlew cucumber` command from your project root directory. This will execute the cucumber tests implemented.
