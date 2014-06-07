apt_repository 'octave-ppa' do
    uri 'http://ppa.launchpad.net/octave/stable/ubuntu'
    components ['main']
    distribution 'precise'
    keyserver    'keyserver.ubuntu.com'
    key          'DCB1CB6E'
end

package 'octave' do
    action :install
end

