# WeThinkCode_ Bootcamp Cleanup Playbook

This playbook cleans a bootcamper's home directory by removing it entirely, recreating it, and then filling it with the expected bash dot files from /etc/skel and recreating the XDG user's home directories(.i.e folders such as Music, Videos, Pictures, e.t.c).

## Installation

 1. [Install Ansible](https://docs.ansible.com/ansible/latest/installation_guide/index.html) 
 2. Clone or download this repository to your local drive

## Explaination

Lets explain the important files this repo houses:

<dl>
 <dt><a href="https://docs.ansible.com/ansible/latest/reference_appendices/config.html#ansible-configuration-settings">ansible.cfg</a><dt>
 <dd>ansible configuration file. Tells ansible where to find the inventory file, amongst other things.<dd>
 
 <dt><a href="https://docs.ansible.com/ansible/latest/intro_inventory.html">inventory</a><dt>
 <dd>this is an ini-file listing all the servers we control. All the student iMacs on campus that have the ssh server installed would be listed in this file. It is possible to automate the generation of this file.<dd>
 
 <dt><a href="https://blog.ruanbekker.com/blog/2020/10/26/upload-public-ssh-keys-using-ansible/">public_keys/</a><dt>
 <dd>Houses all the ssh public keys we want to use to connect to the iMacs. The <a href="playbook.yml">playbook</a> puts all the keys in the <a href="https://www.ssh.com/academy/ssh/authorized-keys-file">authorized_keys file</a> belonging to the user on the iMac(all iMacs have a user with username wtc or wethinkcode_). The public key of the machine from which we will be running ansible should be in this directory.<dd>
 
 <dt><a href="https://docs.ansible.com/ansible/latest/user_guide/playbooks_intro.html">playbook.yml</a><dt>
 <dd>This is where the ansible tasks are listed. The tasks run in order and if a task fails the next one in sequence is not ran. Each task has a description.<dd>
 
 <dt><a href="create_invenory_scripts">create_inventory_scripts</a><dt>
 <dd>Scripts attempting to get all iMacs on campus that are listening for ssh connections and append them to the inventory file.<dd>
</dl>

## Usage

### Dry Run

Ansible has an option to do a dry run, it will tell you what it would have done if it was actually being ran in full. Not all ansible modules support dry running but this good to test the connection to all servers in the inventory.

```sh
ansible-playbook playbook.yml --check --ask-become-pass --ask-pass --extra-vars "user=wtc"
```

1. `--check`: This is for a dry-run, remove when ready to run
2. `--ask-become-pass`: Prompts for the password used to do sudo commands on the remote machine
3. `--ask-pass`: Prompts for the password to use for ssh-ing to the remote machine
4. `--extra-vars`: change `user=wtc` to the user you want to run this playbook for on the remote machine

### Actual run

```sh
ansible-playbook playbook.yml --ask-become-pass --ask-pass --extra-vars "user=wtc"
```

**NOTE**: Ansible defaults to using ssh keys for connection to the remote/target server. If you already uploaded your public key to the remote server/target you can remove `--ask-pass` to connect via your key.

 
## FAQ

**Q**: Why completely remove the bootcamper's home directory?

**A**: This ensures that anything left behind by the previous bootcamper is fully removed, such as browser session files.

**Q**: Why ansible?

**A**: It's very simple for non-developers to understand compared to scripting languages. This is because it uses a human-friendly syntax for playbook files called yaml. Ansible is also a very popular tool in the DevOps space so this is also a learning opportunity for anyone interested in DevOps. I also asked the question "Why ansible" to ansible users in their [chat room](https://app.element.io/#/room/#users:ansible.com) and I got:

<blockquote>
  ...auditability, logging and built in reliability and paralelization make ansible a lot more useful and scalable than just scripts (also ansible can leverage existing scripts to ease transition)
<blockquote>

