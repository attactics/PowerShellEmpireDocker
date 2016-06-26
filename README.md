# PowerShell Empire Docker Build
A docker build for PowerShell Empire

###Usage & Considerations
In order to build the docker container yourself, you will need to clone this repository
```sh
git clone https://github.com/attactics/PowerShellEmpireDocker
```
Once you have the repository cloned you will need to build the image from within the cloned directory.
```sh
cd PowerShellEmpireDocker
docker build -t PowerShellEmpire .
```
Once the image has been built, a container can be created and ran, for example
```sh
docker run -it --name PowerShellEmpireDocker -p 10.10.10.10:8080:8080 -v /tmp:/tmp PowerShellEmpire
```
Taking a look at the run command:
*  -it instructs docker to let us interact with the container (input & output)
*  -p instructs docker to forward communication received on the host IP on port 8080 to the container on port 8080. This can be modified as desired, however it is important to specify the host interface you intend stagers to communicate with.
*  -v create a volume linking the host /tmp directory to the containers /tmp directory. This exists to conveniently write stager output files to the host for use. By default, PowerShell Empire writes generated stager files to /tmp. The host location is arbitrary.
  
  
