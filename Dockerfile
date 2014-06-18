FROM ubuntu:14.04

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y build-essential g++ curl libssl-dev apache2-utils git libxml2-dev mercurial man strace tree lsof
RUN git clone https://github.com/creationix/nvm.git
RUN git clone https://github.com/ajaxorg/cloud9.git
RUN echo 'source /nvm/nvm.sh && nvm install v0.10.22 && npm install -g sm && /nvm/v0.10.22/lib/node_modules/sm/bin/sm install-command' | bash -l
RUN echo 'source /nvm/nvm.sh && nvm use v0.10.22 && cd /cloud9 && sm install && make ace && make worker' | bash -l
RUN apt-get autoremove -y
RUN apt-get autoclean -y
VOLUME /workspace
EXPOSE 3131
CMD echo 'source /nvm/nvm.sh && nvm use v0.10.22 && /cloud9/bin/cloud9.sh -w /workspace/ -l 0.0.0.0' | bash -l
