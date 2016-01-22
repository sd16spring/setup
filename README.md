# SoftDes 2016 Setup Script

This repository contains a script to install [Python](https://www.python.org) (programming langue), [Jupyter](http://jupyter.org) (Python notebooks), git (source control), [Sublime Text 3](http://www.sublimetext.com/3) (text editor), and [Atom](https://atom.io) (text editor) on an Ubuntu [Linux](https://en.wikipedia.org/wiki/Linux) workstation.

## Usage

Type or paste the following line into a Terminal, and then press Enter.
```
curl https://raw.githubusercontent.com/sd16spring/setup/master/ubuntu.sh | bash
```

This takes a while to complete.

If the last line of terminal output is "Success!", you're set -- return to the [Get Set](https://sites.google.com/site/sd16spring/home/assignments-and-mini-projects/setup-your-environment) page for further instructions.

Otherwise, ask a NINJA for help.

## Optional Reading

You don't need to know this for SoftDev! But if you're curious about what just happened when you ran the startup script...

### Under the Hood

The startup script installs Python, Sublime Text 3, the Jupyter notebook program, and a handful of packages that extend each of these.
The commands in the startup script are the same commands you could type on the command line (just like you typed `apt-get` commands
to configure Linux); putting them in a script packages the commands together, and automates running them.

```
curl https://raw.githubusercontent.com/sd16spring/setup/master/ubuntu.sh | ...
```

`curl` is a tiny subset of a web browser, for non-interactive command-line use.
Given an URL, it retrieves the contents of that URL.

```
curl ... | bash
```

`bash` is a program that implements the command line. When you type program names and file names at it, it runs those programs and opens or operates on those files.
Here, we're running another `bash` inside the `bash` you're typing at.
This inner `bash` reads its commands from the startup script instead of the keyboard, because:

`|` (pipe) separates two commands, and connects the output of the first to the input of the second.
In this case, the first command is `curl` (read a document from the web), and the second is `bash` (execute the incoming commands),
so `curl ... | bash` reads the document, and sends its commands to `bash` to execute.

Last year we gave students a longer set of commands to enter on the command line. Those instructions are [here](https://sites.google.com/site/sd16spring/home/assignments-and-mini-projects/setup-your-environment/manual-install-instructions-ubuntu).
(You don't need them if you run the setup script.)
Read them for more detail about what the script is doing, or read the [source](./ubuntu.sh) of the script itself.

Three of the pieces of software that you'll be interacting with, and that the script installs and/or configures, are the **operating system** (Ubuntu), a **programming language compiler** or **interpreter** (Python -- it's an interpreter), and an *editor* (this script installs two editors -- Atom, and Sublime Text 3).
The *operating system* manages files and memory, and runs programs (such as the programming language, and the editor).
It's the interface between programs and resources, such as files, memory, and input/output devices (screens, mice, and keyboards).
The *programming language* turns text files into operating system and machine instructions, that the operating system can run.
The *editor* is just what you think.
Formally, it's an interface between the input/output devices, and text files.

In many modern systems, the operating system, programming language, and editor can each be extended with additional **packages** that provide additional functionality.
Each of the operating system, programming language, and editor has its own **package manager**, which can download packages from the internet and install them on your development machine.
The Ubuntu package manager, `apt-get`, is included in its distribution.
Python's package manager is `pip`, and the script installs it.
Atom's package ships with Atom; there's a user interface in the GUI, and a command-line tool `apm` (*a*tom *p*ackage *m*anager).

With this background, you know almost enough to read the script.
`apt-get` and `apt-get-repository` relate to the Ubuntu package manager.
`apt-get-repository` tells it where to look for Ubuntu packages, and `apt-get` tells it to install a package.
The script uses `apt-get` to install git, Python, and the text editors.

`apt-get install python-pip` installs Python and `pip`.
Once `pip` is installed, the script uses it to install Python packages.

`apt-get instal atom` installs Atom and `apm`.
Once `apm` is installed, the script uses it to install Atom packages.

The missing piece is `sudo`.
`sudo` before a command says to run that as the super-user.
Normally in Linux (including Ubuntu), you can't write to some parts of the file system.
This protects your operating system from typos you make on the command line (a typo can still delete a file you didn't mean to, but it's unlikely to modify your computer so it can't boot); and it protects your operating system (but not your personal files) from programs that you run.
`sudo` runs a command without this protection.

### Automation and Provisioning

Provisioning a computer involves some or all of: installing and updating an operating system, installing and updating packages, and configuring the operating system and the programs that it runs.
It's what you just did to create a development environment that you can use for SoftDev.

Provisioning a computer is something that comes up over and over again.
You'll need to do it every time you get a new computer (unless you copy your files over); also when you configure an embedded system* for robotics or automation;
also when you stand up a server.

Anything done a sufficient number of times is a candidate for automation, both for efficiency and for quality.
(Once something has a few dozen steps, it's unlikely everyone who tries to follow them will hit them all every time, even in a high-functioning team.)
But it's also a lot more work to automate something than just to do it.
It's a judgement call when to automate something. Often the path is do it manually -> write English description -> turn pieces of the English description into code.
That's what we've done here.

<sup>1</sup> Embedded microcomputers such as Beaglebone and Raspberry Pi are basically slow laptop computers without the built-in I/O.
Provisioning them will look very familiar once you've gone through this.
Micro*controllers* such as Arduino and PICs are sufficiently different that most of this doesn't apply.
