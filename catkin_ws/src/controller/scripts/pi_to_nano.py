# !/usr/bin/env python
import os
import rospy
import RPi.GPIO as GPIO
import serial
from std_msgs.msg import String, Int8
from controller.msg import instruction
from time import sleep
os.system("echo juneer2022 | sudo chown -R juneer /dev/ttyUSB0 | echo juneer2022")


def transfer_to_nano(msg):

    global lightness

    if msg.direction == "M":

        if lightness == 30:
            lightness = -5
        if lightness == 0:
            lightness = 15
        lightness += 5

        pwm.start(lightness)

        feed_back_msg = "The light is {}".format(lightness)
        rospy.loginfo(feed_back_msg)
        pub.publish(feed_back_msg)

    else:
        feed_back_msg = "The rov has received the {} instruction with speed {}.".format(msg.direction,msg.speed)
        rospy.loginfo(msg)
        pub.publish(feed_back_msg)
        ser.write(bytes(msg.direction+str(int(msg.speed)),encoding='utf8'))


if __name__ == '__main__':
        
    USB_to_nano = '/dev/ttyUSB0'
    ser = serial.Serial(USB_to_nano, 115200)
    
    GPIO.setmode(GPIO.BOARD)
    GPIO.setup(12,GPIO.OUT)
    pwm = GPIO.PWM(12,200)
    lightness = 0
    
    rospy.init_node('pi_transfer_nano')
    rospy.Subscriber('instruction_to_pi', instruction, transfer_to_nano)
    pub = rospy.Publisher('feedback_to_ground', String, queue_size=10)
    rospy.spin()

