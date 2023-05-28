# ci-comparison-blog

The Infrastructure as code is written with Terraform to provision AWS Codepipeline, Codebuild, and Codedeploy. The code also deploys the Elastic beanstalk application and the Elasticbeanstalk enviroment with a linux machine running docker to run the Docker container and deploy the Express js application using a node js container. This porcess is built in the pipeline using the Dockerfile.

To provision the infrastructure, first navigate to the  terraform directory `cd terraform` this is after you are in the project's directory on your local machine or enviroment.

Next, run the following commands

`terraform init`
`terraform fmt`
`terraform validate`
`terraform apply`

when you run terraform apply, you will be promted with the password and username to your docker hub account. This is to pull the image that has been created by you following the tutorial that follows this github repo.

You will also be promted for the link to your forked repo put it in this manner `<username>/ci-comparison-blog`

Thanks :) enjoy...


here is the link to the [blog post](https://medium.com/avmconsulting-blog/how-to-build-your-first-aws-codepipeline-ci-cd-pipeline-c4127dab6394)




