#!/usr/bin/env python3

import rospy
from std_msgs.msg import String
from controller.msg import instruction
import keyboard

def controller_publisher(key,num):
    con_pub.publish(direction=key,speed=num)
    rospy.loginfo('Instruction is sent successfully.')

def controller_subscriber(msg):
    rospy.loginfo(msg.data)

if __name__ == "__main__":


    con_pub = rospy.Publisher('instruction_to_pi',instruction,queue_size=10)
    rospy.init_node('ground_station_controller', anonymous=True)

    rospy.Subscriber('feedback_to_ground',String,controller_subscriber)
    rospy.loginfo('Ground station is set up successfully.')

    keys = {'u':'U', 'j':'D', 'w':'F', 's':'B', 'a':'L', 'd':'R','esc':'S'}
    
    for key in keys:
        for i in range(10):
            keyboard.add_hotkey(key+str(i),controller_publisher,args=(keys[key]+str(i))) 

    keyboard.wait('esc')
 

