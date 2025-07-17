# Install
```
su -
usermod -aG sudo grig
reboot
```

```
sudo apt update && sudo apt upgrade -y
sudo apt install ansible git just
cd ~/.config
git clone https://github.com/grig-iv/dotfiles.git
cd dotfiles/ansible 

ansible-playbook shell_packages.yml --ask-become-pass  
ansible-playbook desktop_packages.yml --ask-become-pass  
ansible-playbook secrets/playbook.yml --ask-become-pass  
ansible-playbook xkb/playbook.yml --ask-become-pass  
ansible-playbook cursor_setup.yml --ask-become-pass  
ansible-playbook gnome_setup.yml --ask-become-pass  

```
