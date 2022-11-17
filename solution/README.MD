# The csvserver assignment documentation
##PART 1
Cloning from the repository  
I have created one directory called assignment “~/ mkdir assignment ”
copied repository ZIP link address from infrcloudio/csvserver 
cd into  assignment and downloaded the github repository zip file  using this command``` “~/ wget https://github.com/infracloudio/csvserver/archive/refs/heads/master.zip```
Then we get zip file and unzipped the file file ~/ unzip < file name >
When we unzipped the file it will created a directory called csvserver-master and cd in it and again it will created a “solution” directory and “README.MD”,how it will created is we have already downloaded github repository zip file,what are the files it has it wiil created automatically in local machine 
We created a our new public repository in github and 
*`”git init”` for intializing the git into the directory 
*`”git add README.MD”` to track the file
*`”git remote add origin` https://github.com/spalavelli/docker-assign.git”` to add a local to github repository 
*”git commit -m”<commit msg>” ” to commit 
*”git push origin <branch name>”  to push changes in to github
Run the Docker commands  
 I have RUN this command to run a container in machine
$ Sudo docker run infracloudio/csvserver:latest
-d for detach mode it will run in background mode
We should check the container is created or not ~/ sudo docker 
ps this command shows the running container 
It is not showing the running container and we should check the all containers in our machine ~sudo docker ps -a ,it will shows the all containers details such  as CONTIANER ID,IMAGE NAME, COMMAND,CREATED, STATUS,PORTS, in status section we can see the exited(1) 3 mins ago it means container is created,run and exited at the same time  
We should check docker logs ~sudo docker logs <con id>or <image name>
In docker logs we can see the error “ 2022/11/16 13:30:14 error while reading the file "/csvserver/inputdata": open /csvserver/inputdata: no such file or directory “ we should find the reason to got error
Inspect  
We should inspect the container ~/sudo docker inspect <cont id> or <image name>
When we inspect the container it will shows the json formate in that formate VOLUME BLOCK{} nothing in it 
volumes(-v)
We should give volumes flags when we run a container ~/sudo docker run -v source:destination infracloudio/csvserver:latest
It will run by saving the image in source and destination host machine
We should write a bash script gencsv.sh in script is 
 Shell sript 
 #!/bin/bash
RANDOM=$$
for i in `seq 9`
d
        echo $i,$RANDOM
done >> inputFile
In script it will create RANDOM num in 1 to 10 with “,” separated values
When we run the script it will create inputfile to run shell script ~sh gencsv.sh it will print the random num from 1 to 10
Detach mode (-d)
 Now agin run the command with volumes  ~/sudo docker run -d -v /home/srinivas/assignment/csvserver-master/solution/inputFile:/csvserver/inputdata infracloudio/csvserver:latest now the container is running 
Now we should login into the running container ~/sudo docker exec -it container id /bin/bash 
It will logged in into the root user and now we can see the port numbers of running container and listening state of running container and type of protocol to see the port num of running container and state of container ~/netstat -nltp  
Now the container accessing port num localhost:9300 and the state is listening state now if you want any changes in container we should stop the container ~sudo docker stop container id
If the applicant is required environment variable in docker container we should run -env CSVSERVER_BORDER=Orange if its run in web it will print the server border of csvserver is in orange coloure 
exec
to interact with already running containers on the Docker host. 

```~/sudo docker run -env CSVSERVER_BORDER=Orange -d -v /home/srinivas/assignment/csvserver-master/solution/inputFile:/csvserver/inputdata infracloudio/csvserver:latest```
Port mapping(-p)
Now the port mapping the container with flag -p 
The command is  ```~/sudo docker run -env CSVSERVER_BORDER=Orange -d -p 9393:9300 -v /home/srinivas/assignment/csvserver-master/solution/inputFile:/csvserver/inputdata``` infracloudio/csvserver:latest , it will run the web server to access public.
Save the solution 

We should save the all the commands what we have used in the earlier in part 1 section.
Part -1-cmd
We  have created a file part-1-cmd, in file what are the commands we have used like                                                                       ```~/sudo docker run -env CSVSERVER_BORDER=Orange -d -p 9393:9300 -v /home/srinivas/assignment/csvserver-master/solution/inputFile:/csvserver/inputdata``` infracloudio/csvserver:latest .
Part-1-output
If we run this command curl -o ./part-1-output http://localhost:9393/raw it will create one file part-1-output in that file what we got output if we run the above cmd run it will print it, “~/ curl”  it will download the content of url.
Part-1-logs
If we run the command docker logs [container_id] >& part-1-logs it will one file part-1-logs in that file what are the logs we have used to check the details of container.

Then finally we should check gencsv.sh,inputFile,part-1-cmd,part-1-output,part-1-logs pls make sure the all files are present are not in solution directory.

Now we should push in to github.

