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

For Jason's box, I made the following changes:

In order to use the stock `rails new <app> -d postgresql`
configuration, which does not specify host, username, or password, you
need to make a few changes in the postgres configuration.

Without these fields, the rails app defaults to using the login name,
aka `vagrant`.

Postgresql 9.1 comes out of the box requiring `md5` level passwords on
local socket connections that aren't the `postgres` user. Instead, set
it to `peer`. This is in `/etc/postgresql/9.1/main/pg_hba.conf`.

Once changed, restart the postgres server:

    $ sudo service postgresql restart

You also need to create the postgres vagrant profile:

    $ sudo su - postgres -c 'createuser -s vagrant'

This creates the vagrant user as a superuser, like the postgres
user. If you don't feel quite comfortable with that, you can just give
the vagrant user database creation priviledges:

    $ sudo su - postgres -c 'createuser -d vagrant'

The vagrant user can now create it's default user database:

    $ createdb vagrant
