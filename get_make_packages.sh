#!/bin/bash
#run from the root of the workspace in the docker container
source /opt/ros/humble/setup.bash
cd  src && \
git clone https://github.com/ros-drivers/nmea_navsat_driver.git -b ros2 && \
git clone https://github.com/wimblerobotics/roboclaw_driver.git && \
git clone https://github.com/bnbhat/bno08x-ros2-driver.git 

cd  /ros2_docker_ws2 && \
rosdep update && \
rosdep install --from-paths src --ignore-src -r -y && \
colcon build 

cd  /ros2_docker_ws2 && \
source ./install/setup.bash 

    