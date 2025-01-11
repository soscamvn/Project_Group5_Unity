# Install script for directory: /home/vietanh/catkin_ws/src/onrobot22/onrobot_rg_control

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/vietanh/catkin_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/onrobot_rg_control/msg" TYPE FILE FILES
    "/home/vietanh/catkin_ws/src/onrobot22/onrobot_rg_control/msg/OnRobotRGInput.msg"
    "/home/vietanh/catkin_ws/src/onrobot22/onrobot_rg_control/msg/OnRobotRGOutput.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/onrobot_rg_control/srv" TYPE FILE FILES "/home/vietanh/catkin_ws/src/onrobot22/onrobot_rg_control/srv/SetCommand.srv")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  include("/home/vietanh/catkin_ws/build/onrobot22/onrobot_rg_control/catkin_generated/safe_execute_install.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/onrobot_rg_control/cmake" TYPE FILE FILES "/home/vietanh/catkin_ws/build/onrobot22/onrobot_rg_control/catkin_generated/installspace/onrobot_rg_control-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/vietanh/catkin_ws/devel/include/onrobot_rg_control")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/vietanh/catkin_ws/devel/share/roseus/ros/onrobot_rg_control")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/vietanh/catkin_ws/devel/share/common-lisp/ros/onrobot_rg_control")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/vietanh/catkin_ws/devel/share/gennodejs/ros/onrobot_rg_control")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python3" -m compileall "/home/vietanh/catkin_ws/devel/lib/python3/dist-packages/onrobot_rg_control")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages" TYPE DIRECTORY FILES "/home/vietanh/catkin_ws/devel/lib/python3/dist-packages/onrobot_rg_control" REGEX "/\\_\\_init\\_\\_\\.py$" EXCLUDE REGEX "/\\_\\_init\\_\\_\\.pyc$" EXCLUDE)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages" TYPE DIRECTORY FILES "/home/vietanh/catkin_ws/devel/lib/python3/dist-packages/onrobot_rg_control" FILES_MATCHING REGEX "/home/vietanh/catkin_ws/devel/lib/python3/dist-packages/onrobot_rg_control/.+/__init__.pyc?$")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/vietanh/catkin_ws/build/onrobot22/onrobot_rg_control/catkin_generated/installspace/onrobot_rg_control.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/onrobot_rg_control/cmake" TYPE FILE FILES "/home/vietanh/catkin_ws/build/onrobot22/onrobot_rg_control/catkin_generated/installspace/onrobot_rg_control-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/onrobot_rg_control/cmake" TYPE FILE FILES
    "/home/vietanh/catkin_ws/build/onrobot22/onrobot_rg_control/catkin_generated/installspace/onrobot_rg_controlConfig.cmake"
    "/home/vietanh/catkin_ws/build/onrobot22/onrobot_rg_control/catkin_generated/installspace/onrobot_rg_controlConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/onrobot_rg_control" TYPE FILE FILES "/home/vietanh/catkin_ws/src/onrobot22/onrobot_rg_control/package.xml")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/onrobot_rg_control" TYPE PROGRAM FILES "/home/vietanh/catkin_ws/build/onrobot22/onrobot_rg_control/catkin_generated/installspace/OnRobotRGSimpleController.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/onrobot_rg_control" TYPE PROGRAM FILES "/home/vietanh/catkin_ws/build/onrobot22/onrobot_rg_control/catkin_generated/installspace/OnRobotRGStatusListener.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/onrobot_rg_control" TYPE PROGRAM FILES "/home/vietanh/catkin_ws/build/onrobot22/onrobot_rg_control/catkin_generated/installspace/OnRobotRGTcpNode.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/onrobot_rg_control" TYPE PROGRAM FILES "/home/vietanh/catkin_ws/build/onrobot22/onrobot_rg_control/catkin_generated/installspace/OnRobotRGSimpleControllerServer.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/onrobot_rg_control" TYPE PROGRAM FILES "/home/vietanh/catkin_ws/build/onrobot22/onrobot_rg_control/catkin_generated/installspace/OnRobotRGTcpDualNode.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/onrobot_rg_control" TYPE PROGRAM FILES "/home/vietanh/catkin_ws/build/onrobot22/onrobot_rg_control/catkin_generated/installspace/OnRobotRGStatusDualListener.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/onrobot_rg_control" TYPE PROGRAM FILES "/home/vietanh/catkin_ws/build/onrobot22/onrobot_rg_control/catkin_generated/installspace/OnRobotRGDualServer.py")
endif()

