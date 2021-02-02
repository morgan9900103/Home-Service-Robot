#!/bin/sh

xterm -e " export TURTLEBOT_GAZEBO_WORLD_FILE=$(rospack find add_markers)/../worlds/world.world; roslaunch turtlebot_gazebo turtlebot_world.launch " &
sleep 5

xterm -e " export TURTLEBOT_GAZEBO_MAP_FILE=~/catkin_ws/src/map/map.yaml ;roslaunch turtlebot_gazebo amcl_demo.launch initial_pose_x:=0.0 initial_pose_y:=0.0 initial_pose_a:=-1.5707 " &
sleep 5

xterm -e " rosrun rviz rviz -d $(rospack find add_markers)/../rvizConfig/home_service_robot.rviz " &
sleep 7

xterm -e " rosrun add_markers add_markers_test "
