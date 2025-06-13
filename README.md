# New Dreamhost user account

This essentially spells out the tasks I do each time I set up a new user with shell access on Dreamhost.

It sets up `git`, `emacs`, and passwordless authentication, then essentially disables password logins by creating a random 432 character password and helpfully forgetting it.

In the steps below, replace `example.com` with your new domain.

## Point A Record to new domain

If the DNS Name Servers are not Dreamhost,

From DH Control panel -> Websites -> Manage Websites -> `example.com` -> Manage -> DNS

and put that IP address as the A Record for the domain you're launching.

## Set up the new domain

From Dreamhost Control Panel -> Websites -> Manage Websites -> [Add Website](https://panel.dreamhost.com/index.cgi?tree=domain.dashboard#/website-adding/domain)

Fill in the blanks, including create a new user.

Make note of the password created by Dreamhost.  We will need it where PASSWORD is written below.

## Give shell access to the user

From DH Control panel -> Websites -> Manage Websites -> `example.com` -> Manage -> Content -> Manage Files -> Login Info -> Secure Shell Access

## On local machine, create a new `ssh` key
    cd ~/.ssh
    ssh-keygen

Enter `example.com` as the key filename

## On local machine, set up ~/.ssh/config

Append something like the following to `~/.ssh/config`:

    Host example
        HostName example.com
        User example_user
        IdentityFile ~/.ssh/example.com
        IdentitiesOnly yes
        ControlMaster auto
        ControlPath ~/.ssh/cm-%r@%h:%p
        ControlPersist 1h

## scp the public key to the new account using PASSWORD:

    scp ~/.ssh/example.com.pub example:authorized_keys

## ssh to the new account using PASSWORD:

    ssh example

## While on the new account, clone this repo:

    git clone https://github.com/thunderrabbit/new-DH-user-account.git

## Set up the account with passwordless entry

    cd new-DH-user-account
    ./setup.sh
    exit

## On local machine, ssh to the new account without password

    ssh example

It's very very important you log in without password here!

## Basically destroy password logins

    cd ~/new-DH-user-account
    ./password_fix.sh

Enter the short PASSWORD created by Dreamhost when requested

Now your password is 432 random characters.
It can be reset in control panel (to a measly 31 characters) but
the point is to never use passwords to log in.

## If everything worked, then cleanup

    cd ~
    ~/new-DH-user-account/cleanup.sh

## Optional: set up Emacs with PHP-mode

https://github.com/thunderrabbit/new-DH-user-account/blob/master/emacs-PHP.md

## Optional: create key for new server to ssh out

    cd ~
    ssh-keygen

## Optional: Add key to something:

    cat ~/.ssh/id_rsa.pub

* https://github.com/settings/ssh/new
* https://bitbucket.org/account/settings/ssh-keys/

## Optional: Install Composer

https://getcomposer.org/download/

    cd ~
    mv composer.phar .php/composer
    echo '' >> ~/.bash_profile
    echo '# allow run composer' >> ~/.bash_profile
    echo 'PATH=$PATH:~/.php/' >> ~/.bash_profile

## Optional: update this repo

    emacs ~/new-DH-user-account/.git/config
    url = git@github.com:thunderrabbit/new-DH-user-account.git
