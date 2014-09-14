#!/usr/bin/tcl

package require Tcl 8.4
package require http 2.7

set HELP_MESSAGE "Usage: \
        \n  dreddme <source file> \
        \n\nNote: Source file name must match Dredd problem name (e.g., test_00_hello.py)"

source json.tcl

namespace eval dredd {

    variable url variable user
    variable token
    variable language
    variable problem_name
    variable source_file
    variable source_code

    variable LANGUAGES [dict create \
            c    C \
            cpp  C++ \
            cc   C++ \
            go   Go \
            java Java \
            hs   Haskell \
            lua  Lua \
            pl   Perl \
            py   Python \
            rb   Ruby]

    proc getVerdict { file_name } {

        loadConfiguration

        set ::dredd::source_file  $file_name
        set ::dredd::language     [getLanguageFromFileType]
        set ::dredd::problem_name [getProblemNameFromFile]
        set ::dredd::source_code  [getSourceCodeFromFile]

        set body [getFormattedBody]
        set url  [getFullUrl]
        puts "Posting: $body \nTo URL: $url"

        set json_response [postHttp $url $body]
        set response [parseJson $json_response]

        set verdict [dict get $response verdict]
        puts "Verdict: $verdict"

        return
    }

    proc loadConfiguration { } {

        source config.tcl

        return
    }

    proc postHttp { url body } {

        set token [::http::geturl $url -query $body]
        set response [::http::data $token]

        ::http::cleanup $token

        return $response
    }

    proc getFullUrl { } {

        return "$::dredd::url/$::dredd::problem_name"
    }

    proc getFormattedBody { } {

        return [::http::formatQuery user     $::dredd::user \
                                    token    $::dredd::token \
                                    language $::dredd::language \
                                    "source" $::dredd::source_code]
    }

    proc getLanguageFromFileType { } {

        regexp "\\.(.+)$" $::dredd::source_file -> file_extension

        return [dict get $::dredd::LANGUAGES $file_extension]
    }

    proc getProblemNameFromFile { } {

        regexp "^(.+)\\." $::dredd::source_file -> problem_name

        return $problem_name
    }

    proc getSourceCodeFromFile { } {

        set f [open $::dredd::source_file r]
        set source_code [read $f]
        close $f

        return $source_code
    }

    proc parseJson { json } {

        return [::json::json2dict $json]
    }
}

# Parse command line arguments
if { $argc != 1 } {

    puts stderr $help
    exit

} else {

    set arg0 [lindex $argv 0]

    # If user typed "help", show the help message. Otherwise run program.
    if { [string match "help" $arg0] } {

        puts $help

    } else {

        set source_file $arg0
        ::dredd::getVerdict $source_file
    }
}
