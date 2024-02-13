#!/usr/bin/sh

if [ ${EUID} -ne 0 ]
then
  echo +++++++++++++++++++++++++
  echo ++ MUST BE RUN AS ROOT ++
  echo +++++++++++++++++++++++++
  sleep 3
	exit 1 # this is meant to be run as root
fi

curl -L https://github.com/pyserial/pyserial/tarball/master | tar xzf - --strip-components=1 --wildcards --no-anchored */serial
