# Get Your Game On

Script to install and configure my Linux Mint environment.



## Table of Contents

- [Arquivo README em Português](README_PT.md)
- [Tasks](#Tasks)
- [Usage](#Usage)
- [About](#About)



## Tasks

- [ ] ask Cesar about License
- [ ] find out how to configure Mint and Firefox from CLI
- [ ] write motivation behind the script
- [ ] escrever README em português
- [ ] write the script in Python and add features
- [ ] run the script without downloading it previously (like ohmyzsh command)
- [ ] make script continue after system reboot
- [ ] add more softwares: Inkscape, Insomnia...



## Usage

It is needed to run `setup.sh` script two times. The first time, it will reboot the machine after installing and configuring what can be done without a system reboot. At the second time, it will install what missed in the first step.

Run the following commands in Linux's Terminal.

For the first time, run
```
bash ./setup.sh
```

For the second time, run
```
bash ./setup.sh draw
```
or with any argument.

After this, you can remove the script from your machine.



## about

Original work and idea from @csmaniottojr

The script will install and configure the following softwares:
<!-- - Linux Mint
- FireFox -->
- snap
- Zsh
- curl
- Docker
- Git
- OhMyZsh
- VS Code
- docker-compose
- Node.js
- pip

The theme of the script is based in **Yu-Gi-Oh! GX**, which I'm a fan of!
