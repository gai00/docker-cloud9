FROM gai00/cloud9:latest

# ruby
RUN git clone git://github.com/sstephenson/rbenv.git /.rbenv/
ENV PATH /.rbenv/bin:/.rbenv/shims:${PATH}
RUN cd /.rbenv && mkdir plugins && cd plugins && git clone git://github.com/sstephenson/ruby-build.git

# copy from kennethkl/cloud9
ENTRYPOINT ["forever", "/cloud9/server.js", "-w", "/workspace", "-l", "0.0.0.0"]
