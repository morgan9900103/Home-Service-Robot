#!/bin/sh

xterm -e " export TURTLEBOT_GAZEBO_WORLD_FILE=$(rospack find add_markers)/../worlds/world.world; roslaunch turtlebot_gazebo turtlebot_world.launch " &
sleep 5

xterm -e " roslaunch turtlebot_gazebo amcl_demo.launch " &
sleep 5

xterm -e " roslaunch turtlebot_rviz_launchers view_navigation.launch "
