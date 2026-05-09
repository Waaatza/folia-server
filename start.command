#!/bin/bash

# --- RAM SETTINGS ---
MIN_RAM="2G"
MAX_RAM="6G"

# --- SERVER JAR ---
JAR_NAME="folia-26.1.2-8.jar"

#while true
#do
  echo "Starting Folia server..."

  java \
  -Xms${MIN_RAM} \
  -Xmx${MAX_RAM} \
  -XX:+UseG1GC \
  -XX:+ParallelRefProcEnabled \
  -XX:MaxGCPauseMillis=200 \
  -XX:+UnlockExperimentalVMOptions \
  -XX:+DisableExplicitGC \
  -XX:+AlwaysPreTouch \
  -XX:+PerfDisableSharedMem \
  -XX:G1NewSizePercent=20 \
  -XX:G1MaxNewSizePercent=40 \
  -XX:G1HeapRegionSize=8M \
  -XX:G1ReservePercent=15 \
  -XX:G1HeapWastePercent=5 \
  -XX:G1MixedGCCountTarget=4 \
  -XX:InitiatingHeapOccupancyPercent=15 \
  -XX:G1MixedGCLiveThresholdPercent=90 \
  -XX:G1RSetUpdatingPauseTimePercent=5 \
  -jar ${JAR_NAME} nogui

  echo "Server crashed! Restarting in 10 seconds..."
  #sleep 10
#done