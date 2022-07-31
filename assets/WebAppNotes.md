 Basic terms:
 Broken Authentication - Defects in login mechanism that can be bypassed or broken into
 Broken Access Controls - Improper protection of data and functionality
 SQL Injection - Submitting crafted input to mess with SQL logic
 Cross-Site Scripting - Targetting other users on an app
 Information Leakage - Defective error handling and such
 Cross-Site Request Forgery - Hijacking a user session
 
 New tech stuff:
 Web 2.0 - Asynchronous HTTP requests and cross-domain integration 
 Cloud Computing - Virtualization technologies in a hosting environment
 
 Three Core Components:
 Authentication - make sure you are you
 Session Management - you do your OWN stuff, ONLY your stuff, and only YOU do your stuff
 Access Control - you only see YOUR stuff and change YOUR stuff
 
 ### pg  23, 59 

 User Input Handling

 Reject Known Bad - blacklist `SELECT`, `1=1`, and `alert`
 Bypass - `selECt`, `2=2`, and `prompt`
 Other methods - adding comments and null bytes `%00`

 Accept Known Good - whitelist alphanumerics or other keywords/add character limit, effective but troublesome
 Bypass - basically impossible
 
 Sanitization - Deleting potentially dangerous text or HTML encoding them
 Safe Data Handling - Ensuring the process is safe: using parameterized SQL queries
 Semantic Checks - Checking circumstances: one bank user cannot see another bank account
 Boundary Validation - Keeping validating input at all endpoints
 When data is passed through many layers and each have different requirements this becomes a problem
 
 ### pg  28, 64 

 Exploiting The Sanitization - Multistep Validation and Canonicalization
 If <script> is removed just use <sc<script>ript>
 If ../ and ..\ are removed just use ....\/
 Canonicalization - conforming to a rule, HTML encoding
 If HTML %27, the apostrophe, is BLOCKED, use %2527, slap a space in front
 If HTML %27, the apostrophe, is STRIPPED, use %%2727, slap it in itself
 Exploiting “Best Fit”
 `é` is fitted to `e` and `ñ` to `n`
 Instead of recursively sanitizing input, just reject it; you might hit an infinite loop
 Bypass is use Burpsuite to skip browser and JavaScript
 To protect, copy validation from client side to server side
 
 ### pg  30, 66 

 Handling Attacks - something will go wrong evantually so how to limit the impact?
 Error Handling - no system generated error messages, limit verbose, oe debug info
 Audit Logs - Auditing is important,  but make sure it is internal and protected
 Alerting Admins - Actively block ips or get a generic firewall, but implement it correctly, watch for sus stuff
 Reacting to Attacks - Frustate the hacker with slower responses or terminate session, reCAPTCHA, buys time 
 
 ### pg  39, 75 

 GET and POST headers
 GET uses cookies, URL, Referer, User-Agent, and Host
 GET Response uses Status Code, Reason Phrase, Server, Set-Cookie, Pragma, and Content-Length
 
 ### pg  45, 81 

 Weird Headers
 
 ### pg  47, 83 

 Cookies - Expiration, Domain, Path, Secure, HttpOnly (no client side JavaScript)
 
 HTTP Proxys
 If using HTTP, proxy server relays it to the server
 If using HTTPS. proxy server SSLs to the server and sets a TCP connection to client
 
 HTTP Auth
 Basic - user creds in base64 encoded string
 NTLM - uses Windows protocol, CRAM
 Digest -  uses MD5 hash, CRAM
 
 Not Included vvv
 CRAM - Challenge Response Mechanism
 Server asks a user to authenticate themselve with challenges
 Static - forget password question
 Dynamic - CAPTCHA
 
 ### pg  51, 87 

 Web App Tech Server Side
 Transition of static to dynamic web servers using URL queries, cookies, POST, and REST-style filepaths
 Languages -  PHP, VBScript, Perl
 Platforms - ASP.NET, Java
 Servers - Apache, IIS, Netscape Enterprise
 Databases - MS-SQL, MySQL, Oracle
 
 Java - Java is now owned by Oracle and is widespread
 Enterprise Java Bean (EJB) - heavyweight software for technical challenges and app devs
 Plain Old Java Object (POJO) - lightweight Java object, usually user-defined
 Java Servlet - Object that receives and returns HTTP requests  
 Web Container - platform or engine providing Java environment: Apache Tomcat, JBoss, BEA WebLogic 
 
 ASP.NET - Microsoft competing against Oracle
 .NET environment - can run on any .NET language: C#, VB.NET
 Protects against common vulns easily but that means a lot of script kiddies/non-security devs programming
 
 PHP - Personal Home Project
 Historically insecure and has a lot of vulns in implementation of code and the code itself
 
 Ruby on rails - Super fast roll out of code to website with feature autogeneration but also not too secure
 
 SQL - Structured Query Language
 
 XML - eXetensible Markup Language, uses tags and attributes
 
 SOAP (Simple Object Access Protocol) - built off of XML
 Mostly used for servers to communicate with backend services
 How data is transmitted through HTTP, JSON or XML
 
 ### pg  57, 93 

 Web App Tech Client Side
 HTML forms - hidden parameters `redir` and `submit`
 JavaScript - dynamic HTTP using DOMs (Document Object Model)
 VBScript - only supported on IE, JavaScript but worse
 Ajax - programming techniques that update parts of UI without reloading entire pages
 JSON - used as an alternative to XML by AJAX because it works directly with JavaScript
 Same Origin Policy - if a user's page gets hacked it won't flow over to the site
 HTML5 - New exploits and techniques
 Browser Extensions - Java Applets, ActiveX Controls, Flash, Silverlight Objects
 
 ### pg  67, 130 

 Encoding - safely transmit data
 URL - %ASCII
 Unicode - %uCodePoint
 UTF-8 - %hex for each byte (OF INTEREST can be overlooked or bypassed)
 HTML - &literal; OR &#ASCII;
 Base64 - binary data over ASCII, alphanumerics and +/  also uses padding with `=` character
 Hex - 0-9a-f
 
 Remoting and Serialization Frameworks
 Flex and AMF, Silverlight and WCF, Java Serialized Objects
 
 ### pg  74 

 Spidering on the Web 
 Be careful when using spiders because they can break stuff, they are quite dumb
 For spidering through logins, give them tokens or something, though they still might not work properly
 Even advanced spiders may not click on everything in the ever evolving browser/webspace
 Doing it manually is more sophisticated but time consuming
 Hidden files:
 Backups, archives, staging site, default configs/misconfigurations, database stuff, logs, comments, and source files
 There's a lot of juicy stuff in hidden files, remember check robots.txt
 
 Bruteforcing with Burp Intruder or gobuster or wfuzz
 Nikto and Wikto are ok but tend to give false positives and false negatives
 Burp Intruder is better because they give raw data, not positive or negative
 If server uses a nonstandard location, `/cig/cgi-bin` and not `/cgi-bin`, -root /cgi
 
 Hidden Parameters:
 common debug parameters - debug, test, hide, source
 set these to true/1/on/yes
 