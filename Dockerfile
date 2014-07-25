FROM ubuntu:14.04

# install environment
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y build-essential g++ curl libssl-dev apache2-utils git libxml2-dev mercurial man tree lsof

# download git
RUN git clone https://github.com/creationix/nvm.git
RUN git clone https://github.com/ajaxorg/cloud9.git

# nvm
ENV NODE_VERSION v0.10.29
RUN echo 'source /nvm/nvm.sh && nvm install ${NODE_VERSION}' | bash -l
ENV PATH /nvm/${NODE_VERSION}/bin:${PATH}
RUN npm install -g sm && /nvm/${NODE_VERSION}/lib/node_modules/sm/bin/sm install
RUN npm install -g forever
RUN cd /cloud9 && sm install && make ace && make worker

# clean cache
RUN apt-get autoremove -y
RUN apt-get autoclean -y
RUN apt-get clean -y
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN npm cache clean

VOLUME /workspace
EXPOSE 3131

# copy from kennethkl/cloud9
ENTRYPOINT ["forever", "/cloud9/server.js", "-w", "/workspace", "-l", "0.0.0.0"]
