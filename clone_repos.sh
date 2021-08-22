#!/bin/bash

# Clones martin
[[ -d wtt_vectortiles ]] || git clone https://github.com/waterthetrees/wtt_vectortiles.git

# Clones server
[[ -d wtt_server ]] || git clone https://github.com/waterthetrees/wtt_server.git

# Clones frontend
[[ -d wtt_front ]] || git clone https://github.com/waterthetrees/wtt_front.git

# Clones db
[[ -d wtt_db ]] || git clone https://github.com/waterthetrees/wtt_db.git

# Clones notifications
[[ -d wtt_notifications ]] || git clone https://github.com/waterthetrees/wtt_notifications.git

