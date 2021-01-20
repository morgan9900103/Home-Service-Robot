#!/bin/sh

xterm -e " export TURTLEBOT_GAZEBO_WORLD_FILE=~/catkin_ws/src/worlds/world.world " &
sleep 1

xterm -e " roslaunch turtlebot_gazebo turtlebot_world.launch" &
sleep 5

xterm -e " roslaunch turtlebot_gazebo gmapping_demo.launch " &
sleep 5

xterm -e " roslaunch turtlebot_rviz_launchers view_navigation.launch " &
sleep 5

xterm -e " roslaunch turtlebot_teleop keyboard_teleop.launch "
