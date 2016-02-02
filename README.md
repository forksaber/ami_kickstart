# AmiKickstart
## Installation

    $ gem install ami_kickstart

## Usage

1. Your kickstart file should have "halt" as part of the %post snippet
2. Host your kickstart file at some public url
3. Launch a centos instance with the same disk size as specified in your kickstart file
4. Install this gem on that centos instance
5. Execute the following command as root to start the installation

    $ ami-ks <vncpassword> <kickstart url>
6. Connect using the vncpassword to monitor progress
7. The instance will halt once the install completes
8. Register an ami using this instance.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

