#!/usr/bin/env python3

import rospy
from std_msgs.msg import String
import keyboard

def controller_publisher(key):
    con_pub.publish(key)
    rospy.loginfo('{} instruction is sent successfully.'.format(key))

def controller_subscriber(msg):
    rospy.loginfo(msg.data)

if __name__ == "__main__":

    con_pub = rospy.Publisher('instruction_to_pi',String, queue_size=10)
    rospy.init_node('ground_station_controller', anonymous=True)

    rospy.Subscriber('feedback_to_ground',String,controller_subscriber)
    rospy.loginfo('Ground station is set up successfully.')

    keyboard.add_hotkey('u',controller_publisher,args=('U'))
    keyboard.add_hotkey('d',controller_publisher,args=('D'))
    keyboard.add_hotkey('f',controller_publisher,args=('F'))
    keyboard.add_hotkey('b',controller_publisher,args=('B'))
    keyboard.add_hotkey('l',controller_publisher,args=('L'))
    keyboard.add_hotkey('r',controller_publisher,args=('R'))
    keyboard.add_hotkey('s',controller_publisher,args=('S'))
    keyboard.add_hotkey('i',controller_publisher,args=('I'))
    keyboard.add_hotkey('1',controller_publisher, args=('1'))
    keyboard.wait('esc')
 

