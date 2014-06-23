docker-cloud9
=============
From: [https://github.com/gai00/docker-cloud9][1]
#Usage

    docker run -d -v $(pwd):/workspace -p 3131:3131 gai00/cloud9

#Usage2 (with username and password)

    docker run -d -v $(pwd):/workspace -p 3131:3131 gai00/cloud9 --username test --password testpass

#Usage3(with custom port)

    docker run -d -v $(pwd):/workspace -p 13131:13131 gai00/cloud9 -p 13131

PS: host and guest port must be same, cloud9 web-server response content include port information.

Fail EX:

    # fail
    docker run -d -v $(pwd):/workspace -p 13131:3131 gai00/cloud9 


Browser websocket will connect to host:3131, cannot running and excute console commands

Image Size: 907.5 MB

#How to install something by ppa

EX: (cloud9 console)

    echo 'apt-get update; apt-get install -y libsqlite3-dev' | bash -l


#How to support ruby on rails

Go to my github, enter the /ruby/ folder, save Dockerfile to your computer, and build.

    docker build -t yourname/cloud9:ruby .

And then, run yourname/cloud9:ruby and add -p 3000:3000 for rails, use "rbenv" in cloud9 console to install ruby.

cloud9 console:

    rbenv install -l
    rbenv install 2.1.2
    rbenv global 2.1.2
    rbenv rehash
    ruby -v
    gem -v
    gem install rails
    rails -v
    echo 'apt-get update; apt-get install -y libsqlite3-dev' | bash -l
    rails new demo
    cd demo
    rails s -p 3000

Remember commit your container after you install ruby and rails, or you will lost these change.

  [1]: https://github.com/gai00/docker-cloud9
