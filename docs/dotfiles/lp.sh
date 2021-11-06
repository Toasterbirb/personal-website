#!/bin/sh
is_text_file() { grep -qIF '' "$1"; }

case $1 in
	*) is_text_file "$1" && less -R "$1" || file -b "$1" ;;
esac
