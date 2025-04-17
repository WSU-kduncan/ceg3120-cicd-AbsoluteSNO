# Project 4, Step 1

## Docker Setup for Windows
1. Visit the [Docker desktop site](https://www.docker.com/products/docker-desktop/) and scroll until you see "Download Docker Desktop."
2. Hover over the aformentioned button and click "Download for Windows - AMD64."
  2a. You will get a file named "Docker Desktop Installer.exe"
3. Install WSL 2 by running this command in Powershell: `wsl --install`.
  3a. For more information about installing WSL 2, visit [the official Microsoft website on installing WSL.](https://learn.microsoft.com/en-us/windows/wsl/install)
4. Double click the executable and allow the file to make changes.
5. Follow the installer's instructions and when the installer is done, click "close" to finish.
To confirm installation, start Docker Desktop and run this command in Powershell: `docker`.
   By itself, this command will show you the help page for Docker.

## Manually Setting up a Container
* The base command `docker run imageName` can be used to run a container.
### Useful flags:
| Flag | Use |
| --- | --- |
| -p xxxx:yyyy | Maps the host's port xxxx to the container's port yyyy. Useful for checking hosted content on http, for example. |
| --name | Assigns a name to the container. Useful for managing multiple containers. |
| -d | Run detached (in the background.) |
| -l | Add a label to the container. |

### Commands inside the container
* To install additional packages in the container (as a dependency), run this command: `npm install --save packageName`.
* To run the application in the container, first run this command: `ng serve --host 0.0.0.0 --port 3000`,
* then rebuild the application using this command: `npm run build`.

### Verify the comtainer is serving the Angular application
* There are multiple ways:
  * In the container:
    * Checking the container logs: `docker logs containerName`
    * Checking the running processes: `docker exec containerName ps aux`
    * Verifying a response from the web server: `docker exec containerName wget -q0- localhost:3000`
    * Checking the directory structure: `docker exec containerName ls -al /app/dist`
  * On the host machine:
    * Checking the exposed port: `curl -I http://localhost:8080`
    * Checking in the browser (powershell): `Start-Process "http://localhost:8080"`
    * Verifying the container status: `docker ps -f name=containerName`

## Working with DockerHub
* To create a repo, go to [your repositories](https://hub.docker.com/repositories/).
* Next, click the "Create a repository" button and enter the relevant information.
  * Make sure not to click "Private" when on the "Create repository" menu.
* To authenticate to a DockerHub repo, it is recommended to use a Personal access token (PAT) instead of a password.
* To create a PAT, [go to DockerHub](https://hub.docker.com/) and click your profile picture in the top right.
* Next, click "Account settings" and click "Personal access tokens."
* Click "generate new token" and add the relevant information.
  * NOTE: The Personal access token will NEVER expire if you do not change the Expiration date.
  * NOTE: You cannot read any of your private repos, write to any of you repos, nor delete any repos without changing the Access permissions.
* To authenticate into DockerHub, login with `docker login`. Enter your username, but NOT your password! This is what we made the PAT for.
* Instead, paste your PAT into the password slot.
* To push your container image to your DockerHub repo, we must first tag the image: `docker tag imageName yourDockerHubUsername/yourRepoName:tagName`
  * NOTE: Replace the example information with your actual information.
* Next, push the image: `docker push yourDockerHubUsername/yourRepoName:tagName`
  * NOTE: Replace the example information with your actual information.
* This will link your image to your repo.
