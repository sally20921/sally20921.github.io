---
layout: post
title:  "Ruby on Mac Setting"
author: seri
categories: [ Operating System Setting ]
image: assets/images/depth/1.jpg
tags: featured
---

<!--more-->

<h2> Introduction </h2>

Ruby on Mac is the easiest way to set up a working Ruby development environment on your Mac. You can easily customize the script to install additional tools, gems, and Mac apps. 

You can safely run it over and over on the same computer. And because it only installs what's not already there, it runs quickly once everything is installed. The best part is that it will automatically check for new versions and upgrades. 

That's why I recommend running the script about once a week, which is what I do to keep my development environment up-to-date and secure. 

<h2> Supported Shells </h2>

<ul><li> bash </li><li> zsh </li><li> fish </li></ul>

<h2> What it installs by default </h2>

<ul><li> bundler </li><li> chruby </li><li> git </li><li> github-cli</li><li>brew</li><li>ruby-install</li></ul>

<ul><li> Heroku CLI </li><li> Homebrew Services </li><li> Jekyll </li><li> Nodenv </li><li> Postgres </li><li> Rails </li><li> Redis </li><li> Yarn </li></ul>

See the customizing section for additional things you can install. 

<h2> Install </h2>

Please check all of the items below before and after running the script. 

If you are on an M1 mac, do not use Rosetta. Make sure that whatever terminal app you use is not in Rosetta mode. Launch Terminal, or whatever app you're using to interact with the command line, and run this command:

```bash
uname -m 
```
If it says `x86_64`, you're using Rosetta. If it says `arm64`, you're good to go. 


<h3> How to Turn Off Rosetta Mode </h3>

<ul><li> Quit Terminal and any other app thjat uses the terminal. </li>
<li> Open a new Finder window. </li>
<li> Go to Applications > Utilities </li>
<li> Click once on the Terminal app to select it. </li>
<li> Press the `command-i` keyboard shortcut to open the info window. </li>
<li> Make sure the "Open using Rosetta" checkbox is unchecked. </li>
<li> Close the info window. </li>
<li> Launch Terminal. </li>
<li> Verify that `uname -m` shows `arm64` </li></ul>

<h3> Quit and Relaunch Terminal after running the script </h3>

For changes to take effect, you have to refresh your terminal. The best way is to quit and relaunch it. 

<h3> Installation Guide </h3>

If it's not already there, put the `rubyonmac-prime` folder in your Downloads folder. 

Open the Terminal application on Mac. 

Go to your Mac's System Preferences > Security & Privacy > Files and Folders. Find Terminal in the list of apps on the right, and make sure Downloads folder checkbox is checked. 

Quit and restart the Terminal, then try running the commands below. 

```bash
cd ~/Downloads/rubyonmac-prime
/usr/bin/env bash ~/Downloads/rubyonmac-prime/install
```

The script itself is available for you to review and if you what to see what it does and how it works. Every time you run the script using one of the commands above, it will ask you if you want to run it in normal or reset mode. For most people, I recommend trying the normal mode first. However, if you have an M1 mac and you installed dev tools with Rosetta or with `arch -x86_64`, then you should use reset mode, unless you know what you're doing. 

If the script fails in normal mode, or if things are still not working after running the script in normal mode, or if things are not working after running the script in normal mode, and you can't figure out the errors on your own, then try reset mode, which will back up your development environment, clean it up, and install everything from scratch. 


<h3> Important Notes about Reset Mode </h3>

Reset mode will uninstall Homebrew, so if you normally use a shell that was installed by homebrew, you'll need to make sure to switch to the `zsh` that came with your mac, before running the script in reset mode. 

To verify whether you're using the default `zsh`, run this command:

```bash
echo $SHELL
```
It should say `/bin/zsh`. If not, run this command to change it:
```bash
chsh -s /bin/zsh
```
Then quit and restart your Terminal, and verify:

```bash
echo $SHELL
```

Also, make sure to run the script using the Terminal app that came with your mac. When you select reset mode, it will first explain what it will do. Please read it through carefully. You might need to scroll up a bit to see where it starts. You can then choose to proceed or quit the script. 

Run the script again if removing homebrew fails. In some cases, the homebrew uninstallation script might fail. Ignore what homebrew saysm and just rerun Ruby on Mac. 


<h3> Continuing in Normal Mode after Reset Mode </h3>

Once reset mode is done, it will ask you if you want to continue in normal mode. Before you do that, you might want to customize your `~/Brewfile-rom-custom` and `~/rom-custom` so you can restore any tools or apps you installed with Homebrew. They will be backed up to `~/rubyonmac-backups/Brewfile`. This is optional, and mainly for advanced users. You can also do this after the script finishes running, and then run the script again with the `rom` shortcut. 

If you used homebrew cask to install Mac apps, note that when homebrew gets uinstalled in reset mode, it will lose track of the casks, but your mac apps will not be deleted, which is a good thing. 

However, when you try to install them again from your `~/Brewfile-rom-custom`, it will fail, saying that the app already exists in `/Applications`. 

Once your system is in good shape, I would recommend removing all the `*.rubyonmac-backup` and `~/rubyonmac-backups/Brewfile` files so that if you ever need to run reset mode again in the future, it will back things up based on the latest clean system. Otherwise, if Ruby on Mac sees there is an existing backup file, it won't create a new one. 


<h2> Post-Installation Guides </h2>

<h3> How to Switch between Ruby versions and install different versions </h3>

The first time you run the script, it will install both the latest Ruby (currently 3.1.1) as well as Ruby 2.7.5, which is the version that is compatible with most gems at the moment. If you run the script again, it will check for newer 3.x versions, and if it finds one, it will install it. 

You will still have Ruby 2.7.5, that's the advantage of using version managers like `chruby`. You can have many different versions installed at the same time and you can switch between them. To install an additional version, run `ruby-install` followed by `ruby-` and the desired version. 

```bash
ruby-install ruby-3.0.3
```

You should run `chruby` followed by the desired version before you start any new project to make sure you're using the correct version of ruby. 

<h4> Recommended Way to Automatically Switch to the Correct Version </h4>

Another highly-recommended way to automatically switch between versions is to add a `.ruby-version` file in your Ruby project with the verison number prefixed with `ruby-`. To test that this works:

<ul><li> `cd` into your Ruby project, such as your Rails app or Jekyll site </li>
<li> Check to see if the file already exists: `cat .ruby-version`. If not, then create it in the next step. </li>
<li> Create a file called `.ruby-version` with `ruby-2.7.5` in it. </li></ul>

```bash
echo 'ruby-2.7.5' >> .ruby-version
```

<li> `cd` into a folder outside of your project, such as your home folder. </li>
<li> Run `ruby -v`. It will probably say `2.6.8` which is the Ruby that came preinstalled on Monterey.</li>
<li> `cd` into your project. </li>
<li> Verify that `ruby -v` shows `2.7.5`. </li></ul>

<h4> Optional: Check the Node Installation </h4>

If you ran the default installation that includes web dev tools, verify if Node was installed and configured.

```bash
nodenv versions
nodenv help
```


<h4> How to Manage Background Services </h4>

If you ran the default installation that includes web dev tools, note that the script does not automatically launch Postgres and Redis after installation because you might not need or want them to be running. 

With homebrew services, starting, stopping, and restarting these services is a seasy as 

```bash 
brew services start|stop|restart [name of the service]
# to start or stop all services at once 
brew services start|stop --all
```

<h4> BREWFILE </h4>

```bash
# required for ruby installation 
brew install automake
brew install bison
brew install gdbm
brew install libffi
brew install libyaml
brew install openssl@1.1
brew install readline
brew install chruby
brew install ruby-install
brew install git 
brew install gh 
# github CLI

# for Rails, Jekyll and other web dev projects
brew tap homebrew/services
brew install postgresql
brew install redis
brew tap heroku/brew
brew install heroku
brew install nodenv
brew install yarn
```
```bash
/usr/bin/env bash ~/Downloads/rubyonmac-prime/rom-prime
```








































<picture><img src="{{site.baseurl}}/assets/images/disparity.png"></picture>

<h2> References </h2>
<ul><li><a=href=""> TheAILearner </a></li>
</ul>

