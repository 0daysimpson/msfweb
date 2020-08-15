FROM golang
MAINTAINER  0daySimpson <@0daySimpson>
ENV DEBIAN_FRONTEND=noninteractive
#Write-only key for analytics
ENV GOTTY_SEGMENT_WRITE_KEY=24kmikU3956jFu89gFcEslnAXClxFSA8
LABEL Metasploit web shell interface
RUN useradd -m skiddy -s /bin/bash
RUN apt update
RUN apt upgrade -y
RUN apt install build-essential patch ruby ruby-dev libsqlite3-dev -y
RUN apt install libpcap-dev libpq-dev zlib1g-dev libz-dev liblzma-dev tor -y
RUN gem install bundler -v 1.16.1
USER skiddy
WORKDIR /tmp
RUN git clone --depth=1 https://github.com/cqsd/gotty && cd gotty && GO11MODULE=on go install . && cd - && rm -fr /tmp/gotty
RUN cd ~ && git clone https://github.com/rapid7/metasploit-framework.git
USER root
RUN cd  /home/skiddy/metasploit-framework && bundle install
RUN apt remove golang git -y && rm /usr/local/bin/irb && rm /usr/bin/irb && rm /usr/local/go/bin/go && rm -rf /usr/lib/ruby/2.5.0/irb
ENV TERM xterm
RUN mkdir loot
EXPOSE 8080/tcp
WORKDIR  loot
ENTRYPOINT service tor start && su skiddy -c "torsocks /go/bin/gotty --title-format Metasploit -w /usr/bin/ruby /home/skiddy/metasploit-framework/msfconsole"
