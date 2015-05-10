# Building different vagrant boxes

Different methods used during writing of [blog post][blog_post].

* debian-jessie-8 -- new Debian 8 stable, using manual provisioning (ugh)
* debian-jessie-8-ansible -- new Debian 8 stable, using Ansible
  provisioning (yay)
* jason-hsu-wheezy -- Debian 7 + RVM pre-built box
* ubuntu-anisble -- Ubuntu Trusty provisioned with Ansible


[blog_post]: http://swaac.tamouse.org "future blog post on provisioning"

Ansible provisioning from my vagrant ubuntu development starter kit:
<https://github.com/tamouse/vagrant-with-ansible-starter-kit/releases/tag/v1.3.0>

For Debian 8, the following tweaks needed to be made in the
provisioning:

* postgresql-9.4 instead of -9.3
* the ansible modules for postgres user didn't work, so fell back to
using the command line for creating the vagrant profile and database
* using rvm-ruby, added rails install
* added $HOME/.gemrc file to eliminate documentation install/build
* added nvm stuff to set default to iojs
