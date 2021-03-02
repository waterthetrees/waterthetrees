#!/bin/bash

echo "Setting up docker mvp database wtt_db"
./dockerbuilders.sh

echo "Installing server wtt_front"
./install_wtt_server.sh

echo "Installing front end wtt_front"
./install_wtt_front.sh