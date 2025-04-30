# Continuous Deployment Project Overview
## Part 1
### Generating Tags
* To see tags in a Git repo, you can run this command while inside the repo directory: ```git tag --list```
* You can also go to the repo's home page and click the ```Tags``` button under the Releases category on the right.
* To generate a tag, run ```git tag -a vX.X.X```.
* To push the tag, you can run ```git push vX.X.X```.
### Semantic Versioning Container Images with GitHub Actitaons
* My workflow file is [build-and-push.yml](./.github/workflows/build-and-pushmyml).
* In order, the workflow file will do the following:
  * Create an Ubuntu image to run code on,
  * Pull from my repo to work on its content,
  * Authenticate to Dockerhub,
  * Build the Docker image based on the Dockerfile in the pulled repo,
  * Push the Docker image three times, one to Latest, one to vX, and one to vX.X,
  * Log out of Dockerhub,
  * Remove used files,
  * and Stop all processes.
* If the workflow file is used in a different repo, you must do the following:
  * Add DOCKER_USERNAME and DOCKER_TOKEN to GitHub secrets,
  * Either change line 46 to correctly identify the Dockerfile or put it in ./angular-site/,
  * and Change line 25 to your Dockerhub repo name.
### Testing & Validating
* To test that your workflow did its tasking, go over to your repo and select the Actions button above the content that is currently loaded.
* Next, click on the topmost item.
* If there is a red circle with an x in it, the workflow file has failed to complete its tasking.
  * There should be an "Annotations" section with the error inside.
* If there is a yellow spinning circle, the workflow file hasn't finished running yet.
* If there is a green circle with a check mark in it, the workflow file has completed its tasking.
* To verify that it did what you wanted it to, go to Dockerhub and check that your repo has multiple tagged versions.
* The next step is to check that the Docker image works correctly when pulled from the Dockerhub repo.
* You can run a command like this to run the Docker image: ```docker run -d -p 8080:80 --name exampleName DockerhubUsername/repoName:latest```
* Going to [http://localhost:8080](http://localhost:8080) will send you to the website content from the Docker image.
## Part 2
### EC2 Instance Details
* AMI Information: ami-0e449927258d45bc4
* Instance Type: t2.medium
* Volume size: 30 GiB
* Security Group Config:
 * Inbound: All traffic from my home IP (184.57.29.80/32)
 * Outbound: All traffic
* Justification:
 * Only I need to ssh into my instance and serve content to myself.
* SSH Command: ssh -i ./keys/labsuserP5.pem ubuntu@3.82.44.79
