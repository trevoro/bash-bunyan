#!/usr/bin/env bash

. includes/bunyan

__bunyanSetLevel "trace"
bunyanFields[user]+=`whoami`
info "hello world"
trace "hello world"

ls -l  | while read x; do trace "$x"; done
