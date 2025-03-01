#!/bin/bash
openssl enc -d -aes-256-cbc -iter 1000 -in file.txt.enc -pass pass:password
