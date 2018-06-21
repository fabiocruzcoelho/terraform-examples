### Provider terraform-libvirt

## Steps to install golang in CentOS7/Fedora27/RH7
1 - sudo dnf install libvirt-devel # Example install Fedora

2 - wget https://dl.google.com/go/go1.10.1.linux-amd64.tar.gz

3 - sudo tar -xvf go1.10.1.linux-amd64.tar.gz -C /usr/local

4 - export GOROOT=/usr/local/go

5 - export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

6 - go get github.com/dmacvicar/terraform-provider-libvirt

7 - go install github.com/dmacvicar/terraform-provider-libvirt

8 - mkdir .terraform.d/plugins && cd .terraform.d/plugins && cp    ~/go/bin/terraform-provider-libvirt .

9 - go get github.com/dmacvicar/terraform-provider-libvirt

10 - go install github.com/dmacvicar/terraform-provider-libvirt

