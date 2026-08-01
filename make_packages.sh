#!/bin/bash
#run from the root of the workspace in the docker container
source /opt/ros/humble/setup.bash


cd  /ros2_docker_ws2 && \
rosdep update && \
rosdep install --from-paths src --ignore-src -r -y && \
colcon build 

cd  /ros2_docker_ws2 && \
source ./install/setup.bash 

    