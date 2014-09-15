DreddMe
=======

This is a command line utility to submit source code files to <b>Dredd</b>. Using the simple command `dreddme <filename>` from the console, a source code file can be submitted to Dredd for judging. When the verdict is returned, it is printed to the console. See below for details.

Installation
------------

To use this utility, clone the repo and add the directory to your `$PATH` variable.

Clone the repository:

    git clone https://github.com/thecodesmith/dreddme ~/tools/dreddme
    
Edit your `~/.bash_profile` and add the following line:

    export PATH=~/tools/dreddme:$PATH
    
Save changes and exit. Load the new settings:

    source ~/.bash_profile
    
Configure your Dredd configuration by adding your username and authorization token to `~/tools/dreddme/config.tcl`.

Usage
-----

If the `dreddme/` directory was added to your `PATH`, DreddMe can be called like this:

    dreddme <source code file>

Example of submitting a file to Dredd:

    dreddme test_00_hello.py
    
Output:

    Posting:  
    File:  test_00_hello.c  
    User:  stewarbc  
    Token: 9863b147d355b32786aabc84e3e0914  
    URL:   http://dpl.cs.uwec.edu/operations/dredd/problem/test_00_hello

    Verdict: Success

Issues
------

If you run into any issues using the script, please let me know! Post an issue here on GitHub and I'll be happy to look into it. 
