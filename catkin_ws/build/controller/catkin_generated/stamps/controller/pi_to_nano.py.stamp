# python -m pip install pyserial
# !/usr/bin/env python
import os
import rospy
import serial
from std_msgs.msg import String, Int8
from controller.msg import instruction
from time import sleep
os.system("echo juneer2022 | sudo chown -R juneer /dev/ttyUSB0 | echo juneer2022")

# declare
USB_to_nano = '/dev/ttyUSB0'
ser = serial.Serial(USB_to_nano, 115200)
previous_msg = "S"
pub = rospy.Publisher('feedback_to_ground', String, queue_size=10)
    
def upward():
    ser.write(b'U')

def downward():
    ser.write(b"D")

def forward():
    ser.write(b"F")

def backward():
    ser.write(b"B")

def left_turn():
    ser.write(b"L")

def right_turn():
    ser.write(b"R")

def stop():
    ser.write(b'S')

def pwm_init():
    ser.write(b"I")


def transfer_to_nano(msg):
    global previous_msg
    feed_back_msg = "The rov has received the {} instruction.".format(msg.direction)
    rospy.loginfo(feed_back_msg)
    pub.publish(feed_back_msg)
    if msg.data != previous_msg:
        previous_msg = msg.data
        if msg.data == "U":
            upward() 
        elif msg.data == "D":
            downward()
        elif msg.data == "F":
            forward()
        elif msg.data == "B":
            backward()
        elif msg.data == "L":
            left_turn()
        elif msg.data == "R":
            right_turn()
        elif msg.data == "S":
            stop()
        elif msg.data == "I":
            pwm_init()


def start():
    rospy.init_node('pi_transfer_nano')
    rospy.Subscriber('instruction_to_pi', instruction, transfer_to_nano)
    rospy.spin()


if __name__ == '__main__':
    start()
