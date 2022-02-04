#!/usr/bin/env python3
from http.client import PRECONDITION_REQUIRED
from xml.sax.handler import property_declaration_handler
import rospy
from std_msgs.msg import String
from controller.msg import instruction
from sensor_msgs.msg import Joy
import time

pre_dir = ""
dir_spd = {"F":0,"B":0,"L":0,"R":0,"U":0,"D":0}


def joy_instructor(dir,spd):
    
    global pre_dir
    spd = abs(spd)

    if spd != dir_spd[dir]:
        pre_dir = dir
        dir_spd[dir] = spd
        if spd < 10.0:
            con_pub.publish(direction = dir,speed=spd)
            rospy.loginfo('Instruction is sent successfully.')
            time.sleep(0.05)

def joy_instructor_stop(opr,spd):
    con_pub.publish(direction = opr,speed = spd)
    rospy.loginfo('Stop Instruction is sent successfully.')

def joy_instructor_light(opr,truefalse):
    con_pub.publish(direction = opr,speed = truefalse)
    rospy.loginfo('Lighting Instruction is sent successfully.')

def joy_subsriber(data):

    global pre_dir

    data.axes = list(data.axes)

    for i in range(6):
        data.axes[i] = round(data.axes[i],1)*10

    if data.axes[3] > 0 :
        joy_instructor('F',data.axes[3])    #Forwards
    elif data.axes[3] < 0 :       
        joy_instructor('B',data.axes[3])    #Backwards
    elif data.axes[2] > 0 :
        joy_instructor('L',data.axes[2])    #Left
    elif data.axes[2] < 0 :
        joy_instructor('R',data.axes[2])    #Right
    if data.axes[1] > 0 :
        joy_instructor('U',data.axes[1])    #Upwards
    if data.axes[1] < 0 : 
        joy_instructor('D',data.axes[1])    #Downwards
    
    if data.axes[3] == 0 and pre_dir == 'F':   #Stop signal 
        joy_instructor('F',0)
    if data.axes[3] == 0 and pre_dir == 'B':
        joy_instructor('B',0)
    if data.axes[2] == 0 and pre_dir == 'L':
        joy_instructor('L',0)
    if data.axes[2] == 0 and pre_dir == 'R':
        joy_instructor('R',0)
    if data.axes[1] == 0 and pre_dir == 'U':
        joy_instructor('U',0)
    if data.axes[1] == 0 and pre_dir == 'D':
        joy_instructor('D',0)

    if data.buttons[3] == 1:
        joy_instructor_stop('S',0)    #All thrusters Stop

    if data.buttons[6] == 1:
        joy_instructor_light('M',data.buttons[6])   #Lighting

def ground_feedback(msg):
    rospy.loginfo(msg.data)

if __name__ == "__main__":

    rospy.init_node('ground_station_controller',anonymous=True)
    rospy.Subscriber('joy',Joy,joy_subsriber)

    con_pub = rospy.Publisher('instruction_to_pi',instruction, queue_size=10)

    rospy.Subscriber('feedback_to_ground',String,ground_feedback)

    rospy.spin()
    