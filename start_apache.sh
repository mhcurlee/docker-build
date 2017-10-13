#!/bin/bash

rm -f /run/httpd/httpd.pid

/usr/sbin/httpd -D FOREGROUND

