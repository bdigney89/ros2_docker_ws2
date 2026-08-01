#!/bin/bash
#run from the root of the workspace in the docker container
source /opt/ros/humble/setup.bash
#cd  src && \
#rm -rf bno08x-ros2-driver
#rm -rf nmea_navsat_driver
#rm -rf roboclaw_driver

cd  /ros2_docker_ws2 && \
rm -rf build
rm -rf install
rm -rf log



    