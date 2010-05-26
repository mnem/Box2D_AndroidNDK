#######################################
# Set the local path.
#######################################
LOCAL_PATH := $(call my-dir)

#######################################
# Header file locations
#######################################
BOX2D_INCLUDES := $(LOCAL_PATH)/Box2D
BOX2D_ANDROID_INCLUDES := $(LOCAL_PATH)/Box2DAndroid

#######################################
# Build the Box2D core static lib
#######################################
BOX2D_SOURCES := Collision/b2BroadPhase.cpp
BOX2D_SOURCES += Collision/b2CollideCircle.cpp
BOX2D_SOURCES += Collision/b2CollideEdge.cpp
BOX2D_SOURCES += Collision/b2CollidePolygon.cpp
BOX2D_SOURCES += Collision/b2Collision.cpp
BOX2D_SOURCES += Collision/b2Distance.cpp
BOX2D_SOURCES += Collision/b2DynamicTree.cpp
BOX2D_SOURCES += Collision/b2TimeOfImpact.cpp
BOX2D_SOURCES += Collision/Shapes/b2CircleShape.cpp
BOX2D_SOURCES += Collision/Shapes/b2EdgeShape.cpp
BOX2D_SOURCES += Collision/Shapes/b2PolygonShape.cpp
BOX2D_SOURCES += Common/b2BlockAllocator.cpp
BOX2D_SOURCES += Common/b2Math.cpp
BOX2D_SOURCES += Common/b2Settings.cpp
BOX2D_SOURCES += Common/b2StackAllocator.cpp
BOX2D_SOURCES += Dynamics/b2Body.cpp
BOX2D_SOURCES += Dynamics/b2ContactManager.cpp
BOX2D_SOURCES += Dynamics/b2Fixture.cpp
BOX2D_SOURCES += Dynamics/b2Island.cpp
BOX2D_SOURCES += Dynamics/b2World.cpp
BOX2D_SOURCES += Dynamics/b2WorldCallbacks.cpp
BOX2D_SOURCES += Dynamics/Contacts/b2CircleContact.cpp
BOX2D_SOURCES += Dynamics/Contacts/b2Contact.cpp
BOX2D_SOURCES += Dynamics/Contacts/b2ContactSolver.cpp
BOX2D_SOURCES += Dynamics/Contacts/b2PolygonAndCircleContact.cpp
BOX2D_SOURCES += Dynamics/Contacts/b2PolygonContact.cpp
BOX2D_SOURCES += Dynamics/Contacts/b2TOISolver.cpp
BOX2D_SOURCES += Dynamics/Joints/b2DistanceJoint.cpp
BOX2D_SOURCES += Dynamics/Joints/b2FrictionJoint.cpp
BOX2D_SOURCES += Dynamics/Joints/b2GearJoint.cpp
BOX2D_SOURCES += Dynamics/Joints/b2Joint.cpp
BOX2D_SOURCES += Dynamics/Joints/b2LineJoint.cpp
BOX2D_SOURCES += Dynamics/Joints/b2MouseJoint.cpp
BOX2D_SOURCES += Dynamics/Joints/b2PrismaticJoint.cpp
BOX2D_SOURCES += Dynamics/Joints/b2PulleyJoint.cpp
BOX2D_SOURCES += Dynamics/Joints/b2RevoluteJoint.cpp
BOX2D_SOURCES += Dynamics/Joints/b2WeldJoint.cpp

include $(CLEAR_VARS)
LOCAL_ARM_MODE   := arm
LOCAL_MODULE     := box2dcore
LOCAL_C_INCLUDES := $(BOX2D_ANDROID_INCLUDES)
LOCAL_SRC_FILES  := $(BOX2D_SOURCES)
include $(BUILD_STATIC_LIBRARY)

#######################################
# Build the Box2D facade lib
#######################################
FACADE_SOURCES := Box2DFacade/com_noiseandheat_box2d_Box2D.cpp

include $(CLEAR_VARS)
LOCAL_ARM_MODE   := arm
LOCAL_MODULE     := box2dfacade
LOCAL_C_INCLUDES := $(BOX2D_INCLUDES) $(BOX2D_ANDROID_INCLUDES)
LOCAL_SRC_FILES  := $(FACADE_SOURCES)
include $(BUILD_STATIC_LIBRARY)

#######################################
# Assemble it into a shared library for
# use in Android
#######################################
include $(CLEAR_VARS)
LOCAL_ARM_MODE   := arm
LOCAL_MODULE     := box2d
LOCAL_STATIC_LIBRARIES := box2dcore box2dfacade
include $(BUILD_SHARED_LIBRARY)
