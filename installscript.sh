#!/usr/bin/bash

set -x

#Add PWD to path so that we can easily execute typesennse-server.
export TYPESENSE_PATH = "$PWD/typesense-server"
TYPESENSE_DATA_DIR="/tmp/typesense-data3"
export VENVPATH = "$HOME/blogSearchvenvPython3"

#Script to do one line install of typesense search engine and create appropriate tables
#To be run from inside the github repo

#TODO: Someday, we will need t upgrade the server version.
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
     wget https://dl.typesense.org/releases/0.21.0/typesense-server-0.21.0-linux-amd64.tar.gz
     tar -xvzf typesense-server-0.21.0-linux-amd64.tar.gz
elif [[ "$OSTYPE" == "darwin"* ]]; then
        # Mac OSX
        wget https://dl.typesense.org/releases/0.21.0/typesense-server-0.21.0-darwin-amd64.tar.gz
        tar -xvzf typesense-server-0.21.0-darwin-amd64.tar.gz
elif [[ "$OSTYPE" == "cygwin" ]]; then
        # POSIX compatibility layer and Linux environment emulation for Windows
        echo "Unsupported OS. $OSTYPE"
elif [[ "$OSTYPE" == "msys" ]]; then
        # Lightweight shell and GNU utilities compiled for Windows (part of MinGW)
        echo "Unsupported OS. $OSTYPE"
elif [[ "$OSTYPE" == "win32" ]]; then
        # I'm not sure this can happen.
        echo "Unsupported OS. $OSTYPE"
elif [[ "$OSTYPE" == "freebsd"* ]]; then
        echo "Unsupported OS. $OSTYPE"
else
        # Unknown.
        echo "Unsupported OS. $OSTYPE"
fi


#https://stackoverflow.com/questions/18622907/only-mkdir-if-it-does-not-exist
#Create directory if it does not exist
if [ ! -d $TYPESENSE_DATA_DIR ]; then
  mkdir $TYPESENSE_DATA_DIR
fi

#Install npm related packages for instant search and UI
if [ ! -d $VENVPATH ]; then
    python3 -m vnev $VENVPATH
fi
source $VENVPATH/bin/activate

#install nopm dependencies.
npm i 

#install python requirements for the scraper
bash libInstall.sh`

