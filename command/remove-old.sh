#!/bin/bash

echo "Ce script supprime de vieux conteneur vous aurez peut être besoin de re builder certain conteneur"

docker rm $(docker ps -a -q)

#docker rmi $(docker images -a | grep "^<none>" | awk '{print $3}')

docker rmi $(docker images -q --filter dangling=true)

echo "Done"
