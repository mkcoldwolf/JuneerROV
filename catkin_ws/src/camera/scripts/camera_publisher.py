#!/usr/bin/env python3
import rospy
import cv2
from std_msgs.msg import String
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError


def publisher():
    global cap
    global bridge
    pub = rospy.Publisher('camera_image',Image, queue_size=10)
    rospy.init_node('rov_camera_publisher',anonymous=True)
    rate = rospy.Rate(10)

    while not rospy.is_shutdown():
        ret, cv_image = cap.read()
        if not ret:
            print("can't receive frame!")
            break

        image_message = bridge.cv2_to_imgmsg(cv_image,encoding="rgb8")
        pub.publish(image_message)
        rospy.loginfo("Frame is published successfully.")
        rate.sleep()

if __name__ == "__main__":
    cap = cv2.VideoCapture(0)
    bridge = CvBridge()
    if not cap.isOpened():
        print("Cannot open the camera")
    try:
        publisher()
        cap.release()
    except rospy.ROSInterruptException:
        pass    

