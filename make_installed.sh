#!/bin/bash
apt list --installed | awk -F"/" '{print $1}' | grep -v "linux-" > installed
