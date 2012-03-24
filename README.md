# Bash-Bunyan

This tool is based off trentms excellent node-bunyan utility. It's used for
creating structured logs using the JSON format. The output is JSON which can be
piped to either the 'bunyan' tool itself, or to another JSON parser or to a
file.

## Usage

To use bash-bunyan in your bash script, source the 'bunyan' script
ex:

    $ cat example.sh
    #!/usr/bin/bash
    
    . includes/bunyan

    info "this is an info message"
    $
    ~
    $ sh example.sh | json 
    {
      "name": "example.sh",
      "hostname": "mac.local",
      "pid": 49121,
      "level": 30,
      "msg": "this is an info message",
      "time": "2012-03-24T02:48:21Z",
      "v": 0
    }

## Settings

bash-bunyan doesn't have nearly the granularity of node-bunyan, but you can set
the name of the process reported in bunyan by setting the '\_\_bunyanName'
variable. This variable will be set automatically in your script when you source
the bunyan include file.
ex:

    $ cat example2.sh
    #!/usr/bin/bash

    . includes/bunyan
    __bunyanName='super'
    info 'hello world'
    ~
    $ sh example2.sh | bunyan
    [2012-03-24T02:47:15Z]  INFO: super/49105 on mac.local: hello world
