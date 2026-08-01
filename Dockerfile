FROM ros:humble-ros-base

ENV DEBIAN_FRONTEND=noninteractive
#SHELL ["/bin/bash", "-c"]

# Install deps
WORKDIR /ros2_docker_ws2

RUN apt update && apt install -y  \
    build-essential  \
    cmake  \
    git  \
    python3-colcon-common-extensions  \
    python3-rosdep  \
    libboost-all-dev  \
    nano  \
    && rm -rf /var/lib/apt/lists/*


ARG USERNAME=bdigney
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && apt-get update && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME  
    
RUN apt-get install -y ros-humble-teleop-twist-keyboard

# Set workspace
USER bdigney
#USER 1000:1000

WORKDIR /ros2_docker_ws2
COPY ./src ./src


RUN echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc

# Default launch command
ENTRYPOINT ["/bin/bash"]