#include <ros/ros.h>
#include <visualization_msgs/Marker.h>

int main(int argc, char** argv) {
	ros::init(argc, argv, "add_markers");
	ros::NodeHandle n;
	ros::Rate r(20);
	ros::Publisher marker_pub = n.advertise<visualization_msgs::Marker>("visualization_marker", 1);
	
	
	// Set our initial shape type to be a cube
	uint32_t shape = visualization_msgs::Marker::CUBE;
	// double goals[2][2] = {{-1.0, 12.5}, {4.0, -3.0}};
	double goals[2][2] = {{-3, 0.5}, {0, 0}};

	while (ros::ok()) {
	
		visualization_msgs::Marker marker;
		// Set the frame ID and timestamp
		marker.header.frame_id = "map";
		marker.header.stamp = ros::Time::now();

		// Set the namespace and id for this marker
		marker.ns = "markers";
		marker.id = 0;

		// Set the marker type
		marker.type = shape;
	
		// Set the marker action
		marker.action = visualization_msgs::Marker::ADD;
	
		// Set the pose of the marker
		marker.pose.position.x = goals[0][0];
		marker.pose.position.y = goals[0][1];
		marker.pose.position.z = 0;
		marker.pose.orientation.x = 0.0;
		marker.pose.orientation.y = 0.0;
		marker.pose.orientation.z = 0.0;
		marker.pose.orientation.w = 1.0;

		// Set the scale of the marker -- 1x1x1 here means 1m
		marker.scale.x = 0.5;
		marker.scale.y = 0.5;
		marker.scale.z = 0.5;

		// Set the color -- be sure to set alpha to something non-zero
		marker.color.r = 0.0f;
		marker.color.g = 0.0f;
		marker.color.b = 1.0f;
		marker.color.a = 1.0;

		marker.lifetime = ros::Duration();
		
		// Publish the marker
		while (marker_pub.getNumSubscribers() < 1) {
			if (!ros::ok()) {
				return 0;
			}
			ROS_WARN_ONCE("Please create a subscriber to the marker");
			sleep(1);
		}
		ROS_INFO("Publishing the marker - pick up zone");
		marker_pub.publish(marker);
   		
		// Pause 5 secs
		ROS_INFO("Pause for 5 secs");
		ros::Duration(5.0).sleep();
		
		// Hide the marker
		ROS_INFO("Hiding the marker");
		marker.action = visualization_msgs::Marker::DELETE;
		marker_pub.publish(marker);
		
		// Pause 5 secs
		ROS_INFO("Pause for 5 secs");
		ros::Duration(5.0).sleep();
		
		// Publish the marker 
		ROS_INFO("Publishing the marker - drop off zone");
		marker.action = visualization_msgs::Marker::ADD;
		marker.pose.position.x = goals[1][0];
		marker.pose.position.y = goals[1][1];
		marker_pub.publish(marker);
		
		// Pause 5 secs
		ROS_INFO("Pause for 5 secs");
		ros::Duration(5.0).sleep();

		r.sleep();
	}
	return 0;
}
