# Install

1. Add user to sudoers
```
su -
usermod -aG sudo grig
reboot
```

2. Clone dotfiles repo
```
sudo apt update && sudo apt upgrade -y
sudo apt install git
cd ~/.config
git clone https://github.com/grig-iv/dotfiles.git -b debian
cd dotfiles
```

4. Install Homebrew
```
sudo apt install curl
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

3. Stow
```
/home/linuxbrew/.linuxbrew/bin/brew install stow
/home/linuxbrew/.linuxbrew/bin/stow --dotfiles --no-folding -t $HOME -S stow
```

5. Ansible 
```
/home/linuxbrew/.linuxbrew/bin/brew install ansible
cd ansible

vi secrets.yml

ansible-playbook setup_xtal.yml --ask-become-pass

git remote set-url origin git@github.com:grig-iv/dotfiles.git
```
