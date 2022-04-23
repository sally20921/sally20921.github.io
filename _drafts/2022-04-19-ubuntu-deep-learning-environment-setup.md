
<h2> Our Final Goal </h2>

- x86_64 ubuntu 20.04 
- kernel version 5.4.0 
- gcc 9.3.0 glibc 2.31
- NVIDIA linux x86_64 driver verison 510.47.03
- CUDA 11.6.1
- cuDNN 8.3.3.40
- python 3.8 pytorch release 22.03
- docker higher than 19.03
- nvidia-docker2 nvidia-container-toolkit


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

<h3> Disable UEFI Secure Boot </h3>

Although the official documentation (http://us.download.nvidia.com/XFree86/Linux-x86_64/510.60.02/README) explains ways to use the installer's signing support to load the NVIDIA kernel module on a system, I find it more useful (although less secure) to just turn off my desktop UEFI Secure Boot than going through all the hassle. 

Because I use HP 40L desktop, I can do this by turning off the computer and then turn it on while pressing the `F10` key repeatedly until I enter the BIOS setup. There's a option for disabling the secure boot in the security menu. Then reboot. If you don't know how to enter the BIOS setup for your computer, contact the manufacturer!


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

To verify that the installation was successful type in `nvidia-smi` and you will able to see your driver version changed to 
510.60.02. 

<span class="sidenote"> We just installed the NVIDIA Linux Graphics Driver. Let's quickly go through the components of what actually got installed. 

<ul><li> `/usr/lib/xorg/modules/drivers/nvidia_drv.so`: X driver needed by the X server to use your NVIDIA hardware. </li>
<li> `/usr/lib/libcuda.so.510.60.02`: The CUDA library which provides runtime support for CUDA applications. </li>
<li> `/lib/modules/5.13.0-39-generic/kernel/drivers/video/nvidia-modeset.ko`: Kernel module responsible for programming the display engine of the GPU. </li>
<li> `lib/modules/5.13.0-39-generic/kernel/drivers/video/nvidia.ko`: Kernel module providing low-level access to your NVIDIA hardware. </li>
<li> `/usr/bin/nvidia-installer`: NVIDIA's tool for installing and updating NVIDIA drivers. </li>
<li> `/usr/bin/nvidia-xconfig`: NVIDIA's tool for manipulating X server configuration files. </li>
<li> `/usr/bin/nvidia-smi`: NVIDIA System Management Interface for management and monitoring functionality. </li></ul>
</span>


<h2> Step 3: Install NVIDIA CUDA Development Tool </h2>

<h3> Overview </h3>

CUDA is a parallel computing platform and programming model by NVIDIA. It enables dramatic increase in computing performance by harnessing the power of the graphics processing unit (GPU). 


<h3> Uninstall Any Previous Installations </h3>

```bash
sudo /usr/local/cuda-11.6/bin/cuda-uninstaller
sudo /usr/bin/nvidia-uninstall
```

<h3> Download the Distribution-Specific Packages </h3>

NVIDIA recommends using the distribution-specific packages which interface with the distribution's native package management system. To do this, head over to the nvidia developer site and download the deb file (http://developer.nvidia.com/cuda-downloads).

When you choose the right OS, architecture, and distribution, a set of commands will appear like this:

```bash
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
sudo mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600
wget https://developer.download.nvidia.com/compute/cuda/11.6.2/local_installers/cuda-repo-ubuntu2004-11-6-local_1.6.2-510.47.03-1_amd64.deb
sudo dpkg -i cudo-repo-ubuntu2004-11-6-local_11.6.2-510.47.03-1_amd64.deb
sudo apt-key add /var/cuda-repo-ubuntu2004-11-6-local/7fa2af80.pub
sudo apt-get update
sudo apt-get -y install cuda\
sudo reboot
```

<h3> Post-Installation Actions </h3>

<h4> Environment Setup </h4>

The `PATH` variable needs to include `export PATH=/usr/local/cuda-11.6/bin${PATH:+::${PATH}}`. Add this line in your `~/.bashrc` file and perform `source ~/.bashrc`. 

<h4> POWER9 Setup </h4>

Because of the addition of new features specific to the NVIDIA POWER9 CUDA driver, there are some additional setup requirements in order for the driver to function properly. These additional steps are not handled by the installation of CUDA packages, and failure to ensure these extra requirements will result in a non-functional CUDA driver installation. 

First, check the NVIDIA Persistence Daemon is running. 

```bash 
systemctl status nvidia-persistenced 
# if not active 
# sudo systemctl enable nvidia-persistenced
```

Disable a udev rule installed by default that cause hot-pluggable memory to be automatically onlined when it is physically probed. This behavior prevents NVIDIA software from bringing NVIDIA device memory online with non-default settings. This rule can be found in `/lib/udev/rules.d/40-vm-hotadd.rules`. 

<h4> Install Third-Party Libraries </h4>

```bash
sudo apt-get install g++ freeglut3-dev build-essential libx11-dev libxmu-dev libxi-dev libglu1-mesa libglu1-mesa-dev libfreeimage-dev
```
<span class="sidenote"> How to remove CUDA

```bash
# remove CUDA Toolkit
sudo apt-get --purge remove "*cuda*" "*cublas*" "*cufft*" "*cufile*" "*curand*" "*cusolver*" "*cusparse*" "*gds-tools*" "*npp*" "*nvjpeg*" "nsight*"
# remove NVIDIA Drivers 
sudo apt-get --purge remove "*nvidia*"
# clean up the uninstall 
sudo apt-get autoremove
```
</span>


<h2> Step 4: Install Docker Desktop for Linux (Beta) </h2>


```bash
sudo apt remove docker-desktop 
curl https://desktop-stage.docker.com/linux/main/amd64/77103/docker-desktop.deb --output docker-desktop.deb
sudo apt install ./docker-desktop.deb
```

Post-installation scripts are contained in the deb pakage. The post-install script sets the capability on the Docker Desktop binary to map priviledged ports and set resouce limit, adds a DNS name for Kubernetes to `/etc/hosts`, creates a link from `/usr/bin/docker` to `/usr/local/bin/com.docker.cli`, and installs systemd units for each user. 

<h3> Launch Docker Desktop </h3>


```bash
systemctl --user start docker-desktop
docker compose version
docker --version
docker version
systemctl --user enable docker-desktop
```

<h2> Step 6: Install NVIDIA Container for Docker </h2>

Over the last few years there have been a dramatic rise in the use of software containers for simplifying deployment of data center applications at scale. Containers encapsulate an application along with its libraries and other dependencies to provide reproducible and reliable execution of applications and services without the overhead of a full virtual machine. 

The NVIDIA Container Runtime for Docker, also known as `nvidia-docker2` enables GPU-based applications that are portable across multiple machines, in a similar way to how Docker enables CPU-based applications to be deployed across multiple machines. It accomplishes this through the use of Docker containers. 

<span class="sidenote"> A Docker image is simply the software (including the filesystem and parameters) that you run with a Docker container. </span>

<span class="sidenote"> A Docker container is an instance of a Docker image. A Docker container deploys a single application or service per container. </span>

<h3> What is A Docker Container? </h3>

A Docker container is a mechanism for bundling a Linux application with all of its libraries, data files, and environment variables so that the execution environment is always the same, on whatever Linux system it runs and between instances on the same host. 

Unlike a VM which has its own isolated kernel, containers use the host system kernel. Therefore, all kernel calls from the container are handled by the host system kernel. DGX systems use Docker containers as the mechanism for deploying deep learning frameworks. 

A Docker container is composed of layers. The layers are combined to create the container. You can think of layers as intermediate images that add some capability to the overall container. If you make a change to a layer through a DockerFile, than Docker rebuilds that layer and all subsequent layers but not the layers that are not affected by the build. This reduces the time to create containers and also allows you to keep them modular. 

Docker is also very good about keeping one copy of the layers on a system. This saves space and also greatly reduces the possibility of "version skew" so that layers should be the same are not duplicated. 

<h3> Why Use A Container? </h3>

One of the many benefits to using containers is that you can install your application, dependencies and environment variables one time into the container image; rather than on each system you run on. the key benefits to using containers also include:

<ul><li> Install your application, dependencies and environment variables one time into the container image; rather than on each system you run on. </li>
<li> There is no risk of conflict with libraries that are installed by others. </li>
<li> Containers allow use of multiple different deep learning frameworks, which may have conflicting software dependencies, on the same server. </li>
<li> After you build your application into a container, you can run it on lots of other places, especially servers, without having to install any software. </li>
<li> Legacy accelerated compute applications can be containerized and deployed on newer systems, on premise, or in the cloud. </li></ul>

<h3> Example: Running A Container </h3>

As a user, run the container interactively:

```bash
docker run --gpus all -it --rm -v local_dir:container_dir nvcr.io/nvidia/<repository>:<xx.xx>
```

The base command `docker run --gpus all` assumes that your system has Docker 19.03-CE installed. 

```bash
docker run --gpus all --rm -ti nvcr.io/nvidia/pytorch:21.02-py3
```

From within the container, start the job that you want to run. The precise command to run depends on the deep learning framework in the container that you are running and the job that you want to run. For details, see the `/workspace/README.md` file for the container. 

<h3> Specifying A User </h3>

Unless otherwise specified, the user inside the container is the root user. 

When running within the container, files created on the host operating system or network volumes can be accessed by the root user. This is unacceptable for some users and they will want to set the ID of the user in the container. For example, to set the user in the container to be the currently running user, issue the following:

```bash
docker run --gpus all -ti --rm -u $(id -u):$(id -g) nvcr.io/nvidia/<repository>:<container version>
```

Typically, this results in warnings due to the fact that the specified user and group do not exist in the container. The warning can be ignored. 

<h3> Setting The Remove Flag </h3>

By default, Docker containers remain on the system after being run. Repeated pull or run operations use up more and more space on the local disk, even after exiting the container. Therefore, it is important to clean up containers after exiting. 

Do not use the `--rm` flag if you have made changes to the container that you want to save, or if you want to access job logs after the run finishes. To automatically remove a container when exiting, add the `--rm` flag to the run command. 

```bash
docker run --gpus all --rm nvcr.io/nvidia/<repository>:<container version>
```





















































