docker run -it --rm \
    --privileged \
    --network host \
    --ipc=host \
    --name "$CONTAINER_NAME" \
    -v ~/ros2_docker_ws2:/ros2_docker_ws2 \
    my_ros2_app \
    
