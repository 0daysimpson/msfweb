# MSFWEB

`A simple container for building Metasploit framework and making it available via a web TTY`

## Components

* Metasploit -  software platform for developing, testing, and executing exploits -`https://github.com/rapid7/metasploit-framework.git`
* GoTTY - Share your terminal via the browser `https://github.com/yudai/gotty`

## Usage

Pull the container image
>>`docker pull 0daysimpson/msfweb`

Run the container
>>`docker run -d -p 8080:8080 0daysimpson/msfweb`
