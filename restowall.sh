#!/bin/sh
for package in *; do [ -d "${package}" ] &&  stow -R $package; done
