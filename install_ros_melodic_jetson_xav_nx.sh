#!/bin/bash

#simple script to install ros-melodic-desktop- Ubuntu 18.04, Jetson Xavier Nx
 
#Installing Installing ROS Melodic on Jetson Xavier NX Embedded Hardware

echo "Installing ROS Melodic on Jetson Xavier NX Embedded Hardware..."

echo -n "Press y to continue and n to exit (y/n)? "
read answer

if [ "$answer" != "${answer#[Yy]}" ] ;then

	# Add the sources.list to accept software from packages.ros.org
	sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
	if [ $? == 0 ];then
	# Add a new apt key
	echo "Adding the apt key..."
	sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
		if [ $? == 0 ];then
			#update debian packages index
			echo "updating debian packages index..."
			sudo apt update
			#installing ros-mlodic-desktop
			echo "Installing ros-melodic-desktop..."
			sudo apt install ros-melodic-desktop
				if [ $(rosversion -d) == "melodic" ]; then
				echo "Installed successfully"
				else
				echo "Failed to install melodic"
				fi
		else
			echo "Exit"
			exit 1
		fi
	else 
		echo "Exit"
		exit 1
	fi

		
else
	echo "Exiting installation..."
fi
