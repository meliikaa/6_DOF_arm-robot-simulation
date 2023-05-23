# 6_DOF_arm-robot-simulation
This repository contains the documentation and files related to the analysis and dynamics of a robot. The purpose of this project is to perform a comprehensive study of the robot's characteristics, kinematics, workspace, inverse kinematics, Jacobian matrix, singularities, and dynamics using SolidWorks and MATLAB/Simulink.

**Project Overview**

The project consists of the following key steps:

1- Robot Characterization: The characteristics of the robot, including mass, moment of inertia, and dimensions, were extracted. This information provides a foundation for further analysis and calculations.

2- Denavit-Hartenberg Parameters: Attached a coordinate device to each of the robot's links, and obtained the parameters of the Denavit-Hartenberg convention. These parameters define the relationship between the coordinate systems of adjacent robot links.

3- Direct Kinematics: Calculated the final actuator position and its rotational position in terms of joint angles. Extracted fixed angles, Euler angles, axis-equivalent, and quadrilateral angles for the final robot operator based on its joint coordinates.

4- Robot Workspace: Utilized direct kinematic calculations to obtain the robot's workspace in 3D space. Created visual representations of the workspace using SolidWorks and Simulink.

5- Inverse Kinematics: Solved the inverse kinematics problem to determine the joint coordinates based on the linear and rotational positions of the final robot operator. Verified the correctness of the results by comparing them with the input direct kinematic response.

6- Jacobian Matrix: Calculated the Jacobian matrix of the robot using at least two different methods. Compared the results to validate the accuracy and reliability of the derived Jacobian.

7-Singularity Analysis: Identified the singularities of the robot and examined their impact on the robot's position and orientation. Analyzed the physical state of the robot at these singular points and provided a comprehensive discussion.

8- Dynamic Analysis: Determined the dynamics of the robot using the Lagrange method. Extracted the C, M, and G matrices related to the dynamics of the robot, which represent the Coriolis and centrifugal forces, mass matrix, and gravity forces, respectively.

Feel free to explore the code, files, and documentation provided in this repository. For any questions or inquiries, please contact me.
