DreddMe
=======

_University of Wisconsin - Eau Claire_

_CS 491: Programming Challenges_

_Author: Brian Stewart_

DreddMe is a command line utility to submit source code files to
[Dredd]("http://dpl.cs.uwec.edu/operations/dredd/"), the automated judge for
**CS 491: Programming Challenges**. Using the simple command
`dreddme <filename>` from the console, a source code file can be submitted to
Dredd for judging. When the verdict is returned, it is printed to the console.
See below for details.

Installation
------------

To use this utility, clone the repo and add the directory to your `$PATH`
variable.

Clone the repository:

    git clone https://github.com/thecodesmith/dreddme ~/tools/dreddme

Edit your `~/.bash_profile` and add the following line:

    export PATH=~/tools/dreddme:$PATH

Save changes and exit. Load the new settings:

    source ~/.bash_profile

Configure your Dredd settings by adding your **username** and
**authorization token** to `~/tools/dreddme/config.tcl`.

Usage
-----

If the `dreddme/` directory was added to your `PATH`, DreddMe can be called
like this:

    dreddme <source code file>

Example of submitting a file to Dredd:

    dreddme test_00_hello.py

Output:

    Posting:
    File:  test_00_hello.py
    User:  stewarbc
    Token: 9863b147d355b32786aabc84e3e0914
    Lang:  Python
    URL:   http://dpl.cs.uwec.edu/operations/dredd/problem/test_00_hello

    Verdict: Success

Important Notes
---------------

**File Names:** The source code file must be named the same as the problem it
is solving. For example, for problem "test_00_hello", the source file must be
named "test_00_hello.py" or "test_00_hello.java", depending on the language you
are using.

**Language:** The language you are using to solve the problem is deduced based
on the file extension.

Issues
------

If you run into any issues using `dreddme`, please let me know! Post an issue
here on GitHub and I'll be happy to look into it.
