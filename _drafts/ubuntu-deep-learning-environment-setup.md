
<h2> Step 1: Getting Hardware/Software Information </h2>

- GeForce RTX 3080
- x86_64 Ubuntu 20.04.4 LTS focal 
- Linux kernel version 5.13.0-39-generic 
- X.Org X Server 1.20.13
- Kernel modutil version 27

You can check your hardware/software elements with the following command. 

```bash
lspci | grep -i nvidia
uname -m && cat /etc/*release
cat /proc/version
sudo Xorg -version
insmod --version
```
In case you do not see any settings, update the PCI hardware database by entering `sudo update-pciids`. `x86_64` indicates that you are running on a 64-bit system. Now let's install all the necessary packages required to proceed. 

```bash
sudo apt-get update 
sudo apt-get upgrade
```
```bash
# check your kernel version 
uname -r 
# download kernel headers
sudo apt-get install linux-headers-$(uname -r)
# install other compilation dependencies
sudo apt-get install build-essential software-properties-common libglvnd-dev pkg-config dkms -y

```
Check your gcc, make version. If it's higher than 2.91.66 (gcc) and 3.77 (GNU make) then you are good to go!

```bash
gcc --version
make --version
```

Note that the package `build-essential` includes all the required packages we need for development such as `binutils`, `gcc`, `g++`, `dpkg-dev`, `libc6-dev` (glibc), `make` etc. 

<h2> Step 2: Install NVIDIA Accelerated Linux Graphics Driver </h2>

The NVIDIA Accelerated Linux Graphics Driver brings accelerated 2D functionality and high-performance OpenGL support to Linux x86_64 with the use of NVIDIA graphics processing units (GPUs). These drivers provide optimized hardware acceleration for OpenGL and X applications and *support nearly all recent NVIDIA GPU products*. 

NVIDIA drivers can be downloaded from the NVIDIA website (https://www.nvidia.com). Mine is a self-extracting package named `NVIDIA-x86_64-510.60.02.run`. This file contains both 64-bit drivers as ewll as 32-bit compatibility adriver binaries. 


<h3> Disable Nouveau Driver </h3>

Nouveau is a display driver for NVIDIA GPUs, developed as an open-source project through reverse-engineering of the NVIDIA driver. Only one drive can control a GPU at a time, so Nouveau must be disabled before installing the NVIDIA driver. Specifically, make sure that Nouveau's kernel modesetting is disabled before installing NVIDIA driver. 

We can do this by creating a blacklist file. With the command `sudo nano /etc/modprobe.d/blacklist-nouveau.conf`, open the blacklist file and add the following two lines:

```bash
blacklist nouveau
options nouveau modeset=0
```
Save the file, then regenerate the kernel initramfs by running the command `sudo update-initramfs -u`. 

<h3> Exit the X server and Reboot to Different Runlevel </h3>

You should exit the X server and set the default run level on your system such that it will boot to a VGA console, and not directly to X. The runlevel typically range from 0 to 6, with runlevel 5 typically starting the X window system as part of the service (runlevel 0 is a system halt, and 6 is a  system reboot). It is a good idea to prevent X from starting on reboot in case there are problems with the installation. 

If your system typically boots to the X window system with a GUI, you have to reboot to different run level; We are going to reboot our system in terminal mode entirely by typing the command line 

```bash 
sudo systemctl set-default multi-user.target
sudo reboot now 
```

<h4> Installing 510.60.02 Driver </h4>

When you reboot your system, you will come to the terminal UI. From this terminal, navigate to the directory where you downloaded the 510.60.02 driver run file and run it!

```bash
# make the run file executable 
sudo chmod +x NVIDIA-Linux-x86_64-510.60.02.run
sudo sh NVIDIA-Linux-x86_64-510.60.02.run
```
When executed, the run file extracts the contents of the archive and runs the contained `nvidia-installer` utility, which provides an interactive interface to walk you through the installation. `nvidia-installer` will also install itself to `/usr/bin/nvidia-installer`, which could be used to uninstall drivers, auto-download updated drivers, etc. 

When the first installation message pops up asking to allow DKMS to automatically build a new module, yes is recommended for most users. You can also have 32-bit compatibility feature added. Finally, you will receive a prompt asking to keep the default settings for the `nvidia-xconfig` utility or if you would like the utility to configure the files for you automatically. Yes is also recommended for unsure users. 

<h4> Reboot Back to Graphical User Interface </h4>

Hooray! The drivers are installed, so set the default runlevel back to GUI and reboot once again. 

```bash
sudo systemctl set-default graphical.target
sudo reboot now
```












