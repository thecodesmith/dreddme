DreddMe
=======

This is a simple command line utility to submit source code files to Dredd.

Usage
-----

Example of submitting a file to Dredd:

    dreddme test_00_hello.py
    
Output:

    Posting:  
    File:  test_00_hello.c  
    User:  stewarbc  
    Token: 9863b147d355b32786aabc84e3e0914  
    URL:   http://dpl.cs.uwec.edu/operations/dredd/problem/test_00_hello

    Verdict: Success

Installation
------------

To use this utility, clone the repo and add the directory to your `$PATH` variable.

Clone the repository:

    git clone git@github.com:thecodesmith/DreddMe ~/tools/dreddme
    
Edit your `~/.bash_profile`:

    export PATH=~/tools/dreddme:$PATH
