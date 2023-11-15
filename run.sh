#!/bin/bash

npm run grab -- --channels=../channels.xml --maxConnections 5 --gzip

npm run serve