# PowerShell Empire Docker Build
A docker build for PowerShell Empire by evasiv3 [ x <at> attactics.org | PGP 2AB3FA6FCA75105F]

###Usage & Considerations
In order to build the docker container yourself, you will need to clone this repository:
```sh
git clone https://github.com/attactics/PowerShellEmpireDocker
```
Once you have the repository cloned you will need to build the image from within the cloned directory:
```sh
cd PowerShellEmpireDocker
docker build -t PowerShellEmpire .
```
Once the image has been built, a container can be created and ran. For example:
```sh
docker run -it --name PowerShellEmpireDocker -p 10.10.10.10:8080:8080 -v /tmp:/tmp PowerShellEmpire
```
Taking a look at the run command:
*  -it instructs docker to let us interact with the container (input & output)
*  -p instructs docker to forward communication received on the host IP on port 8080 to the container on port 8080. This can be modified as desired, however it is important to specify the host interface you intend stagers to communicate with.
*  -v create a volume linking the host /tmp directory to the containers /tmp directory. This exists to conveniently write stager output files to the host for use. By default, PowerShell Empire writes generated stager files to /tmp. The host location is arbitrary.

#####Important Note
Bear in mind that when configuring listeners you must specify the IP address of the _host_ interface you intend to receive connections on. PowerShell Empire will bind a listener to 0.0.0.0, as such even if you specify an IP that does not exist within the container, it will bind without issue. Specifying the host interface when configuring the listener ensures that the stager is built with this same host interface, allowing it to connect back to the host as opposed to a local network interface that exists within docker networking.

###I'm lazy!
If the above build process consists of more keys than you can bring yourself to type, the pre-built image can be found on docker hub. I intend to update them regulary. You can pull the image to your local device by executing the following
```sh
docker pull attactics/powershellempire
```
