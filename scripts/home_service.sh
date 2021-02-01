#!/bin/sh

xterm -e " export TURTLEBOT_GAZEBO_WORLD_FILE=$(rospack find add_markers)/../worlds/world.world; roslaunch turtlebot_gazebo turtlebot_world.launch " &
sleep 5

xterm -e " export TURTLEBOT_GAZEBO_MAP_FILE=~/catkin_ws/src/map/map.yaml ;roslaunch turtlebot_gazebo amcl_demo.launch initial_pose_x:=0.0 initial_pose_y:=0.0 initial_pose_a:=-1.5707 min_particles:=100 max_particles:=500 update_min_d:=0.1 update_min_a:=3.14/12 laser_z_hit:=0.95 laser_z_rand:=0.05 laser_likelihood_max_dist:=10.0 " &
sleep 5

xterm -e " rosrun rviz rviz -d $(rospack find add_markers)/../rvizConfig/home_service_robot.rviz " &
sleep 5

xterm -e " rosrun add_markers add_markers " & 
sleep 5

xterm -e " rosrun pick_objects pick_objects "
