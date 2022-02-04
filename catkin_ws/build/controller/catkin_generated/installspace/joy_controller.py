#!/usr/bin/env python3
import rospy
from std_msgs.msg import String
from controller.msg import instruction
from sensor_msgs.msg import Joy


def joy_instructor(dir,spd):
    spd = abs(int(round(spd,1)*10))
    if spd != 10:
        con_pub.publish(direction = dir,speed=spd)
        rospy.loginfo('Instruction is sent successfully.')

def joy_instructor_basic(opr,truefalse):
    con_pub.publish(direction = opr,speed= truefalse)
    rospy.loginfo('Instruction is sent successfully.')

def joy_subsriber(data):


    if data.axes[3] > 0:       
        joy_instructor('F',data.axes[3])    #Forwards
    if data.axes[3] < 0:       
        joy_instructor('B',data.axes[3])    #Backwards
    if data.axes[2] > 0:
        joy_instructor('L',data.axes[2])    #Left
    if data.axes[2] < 0:
        joy_instructor('R',data.axes[2])    #Right
    if data.axes[1] > 0 :
        joy_instructor('U',data.axes[1])    #Upwards
    if data.axes[1] < 0 : 
        joy_instructor('D',data.axes[1])    #Downwards
    if data.buttons[3] == 1:
        joy_instructor_basic('S',data.buttons[3])    #Stop
    
    '''
    if data.buttons[1] == 1:
        joy_instructor('I',data.buttons[0])     #Init
    '''

def ground_feedback(msg):
    rospy.loginfo(msg.data)

if __name__ == "__main__":

    rospy.init_node('ground_station_controller',anonymous=True)
    rospy.Subscriber('joy',Joy,joy_subsriber)

    con_pub = rospy.Publisher('instruction_to_pi',instruction, queue_size=10)

    rospy.Subscriber('feedback_to_ground',String,ground_feedback)

    rospy.spin()
    