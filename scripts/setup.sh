#! /bin/bash

SCRIPT_DIR=$(dirname "$0")
cd $SCRIPT_DIR
cd ../Minecraft

HAS_JAVA_8=$(java -version)
HAS_SCREEN=$(which screen)
HAS_MINECRAFT=$(ls | grep "minecraft_server.1.12.2.jar")
HAS_FORGE=$(ls | grep "forge-1.12.2-14.23.5.2860.jar")

if [ ! $HAS_JAVA_8 ]; then
  apt-get install openjdk-8-jdk -y
fi

if [ ! $HAS_MINECRAFT | ! $HAS_FORGE ]; then
  echo "[WARN] Minecraft Not Found"
  echo "[INFO] Downloading Forge Minecraft Server"
  curl -O https://maven.minecraftforge.net/net/minecraftforge/forge/1.12.2-14.23.5.2860/forge-1.12.2-14.23.5.2860-installer.jar)

  java -jar forge-1.12.2-14.23.5.2860-installer.jar --installServer

  
fi

if [ ! $HAS_SCREEN ]; then
  echo "Missing Screen - Needed for background operation"
  exit 1
fi

echo $HAS_MINECRAFT

echo $HAS_SCREEN