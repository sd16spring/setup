# SoftDes 2016 Setup Script

This repository contains a script to install [Python](https://www.python.org) (programming langue), [Jupyter](http://jupyter.org) (Python notebooks), git (source control), and [Atom](https://atom.io) (text editor) on an Ubuntu [Linux](https://en.wikipedia.org/wiki/Linux) workstation.

## Usage

Type or paste the next line into a Terminal, and then press Enter.
```
curl https://raw.githubusercontent.com/sd16spring/setup/master/ubuntu.sh | bash
```

This takes a while to complete.

If the last line of terminal output is "Success!", you're set -- return to the [Get Set](https://sites.google.com/site/sd16spring/home/assignments-and-mini-projects/setup-your-environment) page for further instructions.

Otherwise, ask a NINJA for help.

## Optional Reading

### Under the Hood

Last year we gave students a longer set of commands to enter on the command line. Those instructions are [here](https://sites.google.com/site/sd16spring/home/assignments-and-mini-projects/setup-your-environment/manual-install-instructions-ubuntu). (You don't need them if you run the setup script.) Read them for more detail about what the script is doing, or read the [source](./ubuntu.sh) of the script itself.

Three of the pieces of software you'll be interacting with are the *operating system* (Ubuntu), a *programming language compiler* or *interpreter* (Python -- it's an interpreter), and an editor (this script installs two editors -- Atom, and Sublime Text 3). The operating system manages files and memory, and runs programs (such as the programming language, and the editor). It's the interface between programs and resources, such as files, memory, and input/output devices (screens, mice, and keyboards). The programming language interpreter turns text files into operating system and machine instructions, that the operating system can run. The editor is an interface between the input/output devices, and text files.

In modern systems, the operating system, programming language, and editor can each be extended with additonal components that provide additional functionality. In the case of the operating system, these components include programs, such as the Python interpreter and the Atom text editor themselves. In the case of Python, these components are *python packages*, and another program *pip*, is used to install these. In the case of Atom and Sublime Text 3, these components are *plug-ins*. Atom ships with its own package manager, *apm* (*a*tom *p*ackage *m*anager). Sublime Text 3 doesn't ship with a package manager; the instructions for installing one, and using that to install additional packages, are on the [Get Set](https://sites.google.com/site/sd16spring/home/assignments-and-mini-projects/setup-your-environment) page.

With this background, you know almost enough to read the script. `apt-get` and `apt-get-repository` relate to the Ubuntu package manager. `apt-get-repository` tells it where to look for Ubuntu packages, and `apt-get` tells it to install a package. The script uses `apt-get` to install git, Python, and the text editors.

One Python (and `pip`) are installed, the script uses `pip` to install Python packages.

And once Atom (and `apm`) are installed, the script uses `apm` to install Atom packages.

The missing piece is `sudo`. `sudo` before a command says to run that as the super-user. Normally in Linux (including Ubuntu), you can't write to some parts of the file system. This protects your operating system from typos you make on the command line (a typo can still delete a file you didn't mean to, but it's unlikely to modify your computer so it can't boot); and it protects your operating system (but not your personal files) from programs that you run.

### Automation and Provisioning

Provisioning a computer involves some or all of: installing and updating an operating system, installing and updating packages, and configuring the operating system and the programs that it runs. It's what you just did to create a development environment that you can use for SoftDev.

Provisioning a computer is something that comes up over and over again. You'll need to do it every time you get a new computer (unless you copy your files over); also when you configure an embedded system* for robotics or automation; also when you stand up a server.

Anything done a sufficient number of times is a candidate for automation, both for efficiency and for quality. (Once something has a few dozen steps, it's unlikely everyone who tries to follow them will hit them all every time, even in a high-functioning team.) But it's also a lot more work to automate something than just to do it. It's a judgement call when to automate something. Often the path is do it manually -> write English description -> turn pieces of the English description into code. That's what we've done here.

* Embedded microcomputers such as Beaglebone and Raspberry Pi are basically slow laptop computers without the built-in I/O. Provisioning them will look very familiar once you've gone through this. Micro*controllers* such as Arduino and PICs are sufficiently different that most of this doesn't apply.
