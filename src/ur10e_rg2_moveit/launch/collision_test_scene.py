#!/usr/bin/env python3
import rospy
from moveit_commander import RobotCommander, PlanningSceneInterface
import geometry_msgs.msg
import time

class CollisionSceneExample(object):

    def __init__(self):
        self._scene = PlanningSceneInterface()

        # Clear the scene
        self._scene.remove_world_object()

        self.robot = RobotCommander()

        # Pause to wait for RViz to load
        print("============ Waiting while RVIZ displays the scene with obstacles...")

        # Wait for the planning scene to initialize
        rospy.sleep(2)

    def add_plane_above_robot(self):
        # Pose of the plane: directly above the robot
        plane_pose = [0.0, 0.0, 1.0, 0, 0, 0, 1]  # Adjust the z-position as needed
        plane_dimensions = [2.0, 2.0, 0.01]  # A flat plane with minimal thickness

        self.add_box_object("plane_above_robot", plane_dimensions, plane_pose)

        print("============ Added a plane above the robot!")

    def add_box_object(self, name, dimensions, pose):
        p = geometry_msgs.msg.PoseStamped()
        p.header.frame_id = self.robot.get_planning_frame()
        p.header.stamp = rospy.Time.now()
        p.pose.position.x = pose[0]
        p.pose.position.y = pose[1]
        p.pose.position.z = pose[2]
        p.pose.orientation.x = pose[3]
        p.pose.orientation.y = pose[4]
        p.pose.orientation.z = pose[5]
        p.pose.orientation.w = pose[6]

        self._scene.add_box(name, p, (dimensions[0], dimensions[1], dimensions[2]))

if __name__ == "__main__":
    rospy.init_node("add_plane_above_robot")
    while not rospy.search_param('robot_description_semantic') and not rospy.is_shutdown():
        time.sleep(0.5)
    load_scene = CollisionSceneExample()

    load_scene.add_plane_above_robot()
