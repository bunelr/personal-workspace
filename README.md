To use:
Install [Virtual Box](https://www.virtualbox.org/wiki/Downloads)
Install [Vagant 1.4.3](https://www.vagrantup.com/download-archive/v1.4.3.html)

Install Ruby and the Dev-Kit available [here](http://rubyinstaller.org/downloads/) version 1.9.3
Install Bundle and run bundle install

(Using berkshelf 2.0 and vagrant-berkshelf 1.3.7 due to not being able to build libgecode necessary for berkshelf v3)

Install the vagrant plugin berkshelf and omnibus

     vagrant plugin install vagrant-berkshelf --plugin-version 1.3.7
     vagrant plugin install vagrant-omnibus

