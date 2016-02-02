require 'fileutils'
module AMIKickstart
  class Centos
  
    KERNEL_PATH = "/boot/vmlinuz"
    INITRD_PATH = "/boot/initrd.img"

    def initialize(vncpassword, ks_url)
      @vncpassword = vncpassword
      @ks_url = ks_url
    end

    def kickstart
      download_kernel
      download_initrd
      remove_kernel_from_grub
      add_kernel_to_grub
      reboot
    end

    def system!(command)
      ok = system command
      raise "Error running command #{command}" if not ok
    end

    def download(url, outfile)
      return if File.exist? outfile
      system! "curl '#{url}' > /tmp/amif"
      FileUtils.mv "/tmp/amif", outfile
    end

    def download_kernel
      url = "http://mirror.centos.org/centos/7/os/x86_64/isolinux/vmlinuz"
      download url, KERNEL_PATH
    end

    def download_initrd
      url = "http://mirror.centos.org/centos/7/os/x86_64/isolinux/initrd.img"
      download url, INITRD_PATH
    end

    def remove_kernel_from_grub
      system! "grubby --remove-kernel #{KERNEL_PATH}"
    end

    def add_kernel_to_grub
      args = "vnc vncpassword=#{@vncpassword} ip=dhcp ks=#{@ks_url} method=http://mirror.centos.org/centos/7/os/x86_64/"
      system! %(grubby --make-default --add-kernel #{KERNEL_PATH} --initrd #{INITRD_PATH}  --title="Centos Kickstart" --args="#{args}")
    end

    def reboot
      print "Reboot(y/n): "
      answer = gets.chomp.strip.downcase
      if answer == "y"
        system "/sbin/reboot"
      end
    end
  end
end
