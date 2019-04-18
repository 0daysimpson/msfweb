# msfWeb

A simple container for building Metasploit framework and making it available via a web TTY

   The purpose behind this project was to make metasploit quickly available during an engagement without the need for ssh or a full workstation. 
   
   Utilizing the framework in this way offers several advantages
   
   * Easy to deploy
   * Accessible via any web client (mobile, smart tv, etc)
   * Native proxy support / bypass firewalls
   

    
## Components

* Metasploit -  software platform for developing, testing, and executing exploits -`https://github.com/rapid7/metasploit-framework.git`
* GoTTY - Share your terminal via the browser `https://github.com/yudai/gotty`

## Usage

Pull the container image
>>`docker pull 0daysimpson/msfweb`

Run the container
>>`docker run -d -p 8080:8080 0daysimpson/msfweb`

Access the web app
>`http://localhost:8080`
><img src=".\msfweb.gif">
