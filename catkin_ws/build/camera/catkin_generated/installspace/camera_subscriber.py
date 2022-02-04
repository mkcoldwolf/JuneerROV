#!/usr/bin/env python3
import rospy
import cv2
from std_msgs.msg import String
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError

def callback(data):
    global bridge
    cv_image = cv2.flip(bridge.imgmsg_to_cv2(data,'rgb8'),0)
    cv2.imshow('Image window',cv_image)
    cv2.waitKey(1)

def camera_subscriber():

    rospy.init_node('ground_camera_subsriber',anonymous=True)
    rospy.Subscriber('camera_image', Image, callback)
    rospy.spin()

if __name__ == "__main__":
    bridge = CvBridge()
    camera_subscriber()
