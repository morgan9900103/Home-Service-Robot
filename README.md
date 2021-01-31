# Home Service Robot

The goal of this project is to program a robot than can autonomously map an environment and navigate to pick up and drop off virtual objects. List of the steps in this project :

- Design a simple environment with the Building Editor in Gazebo.
- Teleoperate your robot and manually test SLAM.
- Create a wall_follower node that autonomously drives your robot to map the environment.
- Use the ROS navigation stack and manually commands your robot using the 2D Nav Goal arrow in rviz to move to 2 different desired positions and orientations.
- Write a pick_objects node that commands your robot to move to the desired pickup and drop off zones.
- Write an add_markers node that subscribes to your robot odometry, keeps track of your robot pose, and publishes markers to rviz.

## Project Setup

Update system: ```sudo apt-get update```

Install the ROS navigation stack: ```sudo apt-get install ros-kinetic-navigation```

Create catkin workspace:
```
mkdir -p ~/catkin_ws/src
cd ~/catkin_ws
catkin_make
```

Install package dependencies with ```rosdep install [package-name]```
