# WeThinkCode_ Bootcamp Cleanup Playbook

This playbook creates anew a bootcamper's home directory by removing it entirely, recreating it, and then filling it with the expected bash dot files from /etc/skel and recreating the XDG user's home directories(.i.e folders such as Music, Videos, Pictures, e.t.c).

## Installation

 1. [Install Ansible](https://docs.ansible.com/ansible/latest/installation_guide/index.html) 
 2. Clone or download this repository to your local drive

## Usage


```sh
ansible-playbook playbook.yml --check --ask-become-pass --ask-pass --extra-vars "user=wtc"
```

1. `--check`: This is for a dry-run, remove when ready to run
2. `--ask-become-pass`: Prompts for the password used to do sudo commands on the remote machine
3. `--ask-pass`: Prompts for the password to use for ssh-ing to the remote machine
4. `--extra-vars`: change `user=wtc` to the user you want to run this playbook for on the remote machine

## FAQ

**Q**: Why completely remove the bootcamper's home directory?

**A**: This ensures anything left behind by the previous bootcamper is fully removed, such as web logins in the browser.
