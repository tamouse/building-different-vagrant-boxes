# FAQ

### What's wrong with the old way of installing Ruby on Rails?

*  Manually installing RVM directly on the host machine is a slow and bureaucratic process.  I have done it in Linux 
and in OS X, and it takes a few hours.
*  Because manually installing RVM takes so long, it is not viable at events like Startup Weekend or 24-hour web 
site challenges.  In the time it would take you to install RVM manually on a teammate's computer, competitors who 
use Drupal, PHP, Django, or other technologies can leave you choking on their dust.
*  There's something wrong when JUST GETTING STARTED requires lots of time and effort.
*  You don't have access to a fresh Ruby on Rails installation.  There have been a few times when RVM gave me strange 
error messages.  I was able to rectify matters, but it's better to avoid being in this situation in the first place.
*  Installing Ruby on Rails in Windows would require jumping through even more hoops.  Very few Ruby on Rails 
developers use Windows (which is not based on Unix like OS X and Linux are), and this means there is much less help 
available for Windows users than is the case for OS X users and Linux users.

### Why do you insist on having access to a fresh installation of Ruby on Rails?

*  I find a fresh installation of Ruby on Rails to be necessary for making sure that my gemspec/Gemfile and my 
setup instructions for a given project are complete.
*  If RVM stops working properly or gives me strange error messages, I can quickly return to a known good state and 
not have to spend time troubleshooting the situation and searching the web for solutions.

### What's wrong with installing Ruby on Rails in VirtualBox but not using Vagrant?
I used Ruby on Rails in VirtualBox before I learned how to use Vagrant.  While this offered some of the benefits of 
using Vagrant (such as being cross-platform and offering on-demand access to a fresh version of Ruby on Rails), there 
were drawbacks:

*  This still required manually installing RVM.
*  Not having Vagrant meant that I couldn't copy and paste text from the host machine into the virtual machine.
While there are ways to enable this, it does take extra time and effort.
*  Not having Vagrant meant that I needed GUI tools installed in the virtual machine, such as an editor, KeePassX, 
a web browser, etc.  Installing these tools took extra time and effort.
*  I didn't like the experience of using Linux on a Mac.  Linux has always been designed with PC users rather than 
Mac users in mind.  I found it disorienting to have a Linux GUI but a Mac keyboard.  I prefer to stick with OS X on 
a Mac.  Because Vagrant doesn't use ANY GUI tools on the virtual machine, I don't face this cognitive dissonance 
when I use Vagrant on a Mac.

### Why use Vagrant?

*  My Vagrant solution allows you to set up Ruby on Rails on a teammate's computer in minutes instead of hours.  The 
process is nearly as quick and easy as getting started in Drupal, PHP, or Django.  This allows you and your team to 
spend more time working on the project instead of thrashing around.
*  Vagrant works for Linux, OS X, and Windows machines.  Because Ruby on Rails is used in the uniform virtual 
environment, Vagrant eliminates the potential conflicts of having team members on different platforms.  Furthermore, 
very few Rails developers use Windows, and this makes it difficult to find help.
*  You can have a fresh installation of Ruby on Rails available on demand at all times.  This enables you to 
easily and quickly make sure that your app's gemspec/Gemfile and setup instructions are complete.

### What's wrong with using a Ubuntu base box?

*  Outdated: Most Ubuntu boxes are out-of-date.  Refusing to update your Ubuntu base box means using outdated 
software, which is a violation of best practices.  
*  High maintenance: Ubuntu boxes require large, time-consuming, and frequent updates.  This is why Ubuntu boxes are 
so out of date.  These updates cut into the time available for working on your projects, ESPECIALLY when you boot up 
the base box in its original state.

### Why is your Debian Stable Vagrant box so much better?

*  Debian Stable is much easier to maintain and keep up-to-date than Ubuntu.  Debian Stable requires only a few 
occasional and modest updates.  Complying with best practices is NOT an undue burden.
*  Some Vagrant setups install software through provisioning scripts that run during the "vagrant up" stage.
In contrast, software is pre-installed in my base box, which saves you time during the "vagrant up" stage, especially 
the first time you use my base box after downloading or rebuilding it.  Software pre-installed in my Debian Stable 
Vagrant base box includes:

  1.  RVM, Ruby, and Rails
  2.  NVM and node.js
  3.  Puppet
  4.  Chef
  5.  Redis server
  6.  SQLite3
  7.  PostgreSQL
*  As an added bonus, my Vagrant repository on GitHub (https://github.com/jhsu802701/vagrant_debian_wheezy_rvm) 
includes Bash scripts that consolidate routine multi-step tasks into one step.

### What process do you use to create your Vagrant base boxes?

I use a tool called Packer to create my Vagrant base boxes.  The source code I use for creating my Debian base boxes 
is publicly available at https://github.com/jhsu802701/packer-debian-wheezy .  Running the ror.sh script begins 
the fully automated process of creating my Debian Stable base box for Ruby on Rails.
