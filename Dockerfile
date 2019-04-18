FROM ubuntu
MAINTAINER  0daySimpson <@0daySimpson>
LABEL Metasploit web shell interface
RUN useradd -m skiddy -s /bin/bash
RUN apt update 
RUN apt upgrade -y
RUN apt install golang git build-essential patch ruby ruby-dev libsqlite3-dev -y 
RUN apt install libpcap-dev libpq-dev zlib1g-dev libz-dev liblzma-dev -y
RUN gem install bundler -v 1.16.1
USER skiddy
RUN cd ~ && git clone https://github.com/rapid7/metasploit-framework.git
USER root
RUN cd  /home/skiddy/metasploit-framework && bundle install
USER skiddy
ENV TERM xterm
RUN go get github.com/yudai/gotty
RUN mkdir ~/loot
EXPOSE 8080/tcp
WORKDIR  ~/loot
ENTRYPOINT ~/go/bin/gotty --title-format Metasploit -w /usr/bin/ruby /home/skiddy/metasploit-framework/msfconsole
