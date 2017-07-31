# SSH-Starter-Interface
This is a newer version of my SSH Starter script.

A small Expect script which will start SSH sessions with automatically entered password.<br>
You can specify <b>hostname</b>, <b>password</b>, <b>port</b> and <b>username</b> inside the script for **4** different servers. 

<sup>"ssh.sh" - When 97% of your keyboard is broken...</sup>

This script also features CLI arguments so you can connect to your server instantly without getting prompted to choose a server.

usage:<br>
$ `./ssh.sh 1`<br>
$ `./ssh.sh 2`<br>
$ `./ssh.sh 3`<br>
$ `./ssh.sh 4`

This repository is an advanced version of my previous script "SSH Starter".<br>
There is also an code explanation:<br>
https://github.com/NLDev/SSH-Starter

## HOW TO INSTALL

1. Install expect script <br>
&nbsp;&nbsp;&nbsp;$ `sudo apt-get update` <br>
&nbsp;&nbsp;&nbsp;$ `sudo apt-get install expect` <br>

2. Clone and navigate to this repository <br>
&nbsp;&nbsp;&nbsp;$ `git clone https://github.com/NLDev/SSH-Starter-Interface.git && cd SSH-Starter-Interface` <br>

3. Move the script wherever you want <br>
&nbsp;&nbsp;&nbsp;$ `mv ssh.sh ..`<br>

4. Edit the script as you need it <br>
&nbsp;&nbsp;&nbsp;$ `cd .. && nano ssh.sh` <br>

5. Make the script executable <br>
&nbsp;&nbsp;&nbsp;$ `chmod +x ssh.sh` <br>

6. Thats it! You can either start in from the terminal with <br>
&nbsp;&nbsp;&nbsp;$ `./ssh.sh` <br>
Or by doubleclicking it!
