#!/bin/sh

xterm -e " export TURTLEBOT_GAZEBO_WORLD_FILE=~/catkin_ws/src/worlds/world.world; roslaunch turtlebot_gazebo turtlebot_world.launch " &
sleep 5

xterm -e " export TURTLEBOT_GAZEBO_MAP_FILE=~/catkin_ws/src/map/map.yaml ;roslaunch turtlebot_gazebo amcl_demo.launch initial_pose_x:=0.0 initial_pose_y:=0.0 initial_pose_a:=-1.5707 " &
sleep 5

xterm -e " roslaunch turtlebot_rviz_launchers view_navigation.launch" &
sleep 5

xterm -e " rosrun add_markers add_markers "
