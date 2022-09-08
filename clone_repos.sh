#!/bin/bash

CLONE_TYPE='ssh' # or https

if [ "$CLONE_TYPE" == "ssh" ]; then
    echo "Cloning repos using ssh"
    # Clones db
    [[ -d wtt_db ]] || git clone git@github.com:waterthetrees/wtt_db.git
    # Clones frontend
    [[ -d wtt_front ]] || git clone git@github.com:waterthetrees/wtt_front.git
    # Clones server
    [[ -d wtt_server ]] || git clone git@github.com:waterthetrees/wtt_server.git
fi

if [ "$CLONE_TYPE" == "https" ]; then
    echo "Cloning repos using https"
    # Clones db
    [[ -d wtt_db ]] || git clone https://github.com/waterthetrees/wtt_db.git

    # Clones frontend
    [[ -d wtt_front ]] || git clone https://github.com/waterthetrees/wtt_front.git

    # Clones server
    [[ -d wtt_server ]] || git clone https://github.com/waterthetrees/wtt_server.git
fi


