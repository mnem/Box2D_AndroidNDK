#######################################
# Set the local path.
#######################################
LOCAL_PATH := $(call my-dir)

#######################################
# Box2D sources.
#######################################
BOX2D_SOURCES := Box2D/Collision/b2BroadPhase.cpp
BOX2D_SOURCES += Box2D/Collision/b2CollideCircle.cpp
BOX2D_SOURCES += Box2D/Collision/b2CollideEdge.cpp
BOX2D_SOURCES += Box2D/Collision/b2CollidePolygon.cpp
BOX2D_SOURCES += Box2D/Collision/b2Collision.cpp
BOX2D_SOURCES += Box2D/Collision/b2Distance.cpp
BOX2D_SOURCES += Box2D/Collision/b2DynamicTree.cpp
BOX2D_SOURCES += Box2D/Collision/b2TimeOfImpact.cpp
BOX2D_SOURCES += Box2D/Collision/Shapes/b2CircleShape.cpp
BOX2D_SOURCES += Box2D/Collision/Shapes/b2EdgeShape.cpp
BOX2D_SOURCES += Box2D/Collision/Shapes/b2PolygonShape.cpp
BOX2D_SOURCES += Box2D/Common/b2BlockAllocator.cpp
BOX2D_SOURCES += Box2D/Common/b2Math.cpp
BOX2D_SOURCES += Box2D/Common/b2Settings.cpp
BOX2D_SOURCES += Box2D/Common/b2StackAllocator.cpp
BOX2D_SOURCES += Box2D/Dynamics/b2Body.cpp
BOX2D_SOURCES += Box2D/Dynamics/b2ContactManager.cpp
BOX2D_SOURCES += Box2D/Dynamics/b2Fixture.cpp
BOX2D_SOURCES += Box2D/Dynamics/b2Island.cpp
BOX2D_SOURCES += Box2D/Dynamics/b2World.cpp
BOX2D_SOURCES += Box2D/Dynamics/b2WorldCallbacks.cpp
BOX2D_SOURCES += Box2D/Dynamics/Contacts/b2CircleContact.cpp
BOX2D_SOURCES += Box2D/Dynamics/Contacts/b2Contact.cpp
BOX2D_SOURCES += Box2D/Dynamics/Contacts/b2ContactSolver.cpp
BOX2D_SOURCES += Box2D/Dynamics/Contacts/b2PolygonAndCircleContact.cpp
BOX2D_SOURCES += Box2D/Dynamics/Contacts/b2PolygonContact.cpp
BOX2D_SOURCES += Box2D/Dynamics/Contacts/b2TOISolver.cpp
BOX2D_SOURCES += Box2D/Dynamics/Joints/b2DistanceJoint.cpp
BOX2D_SOURCES += Box2D/Dynamics/Joints/b2FrictionJoint.cpp
BOX2D_SOURCES += Box2D/Dynamics/Joints/b2GearJoint.cpp
BOX2D_SOURCES += Box2D/Dynamics/Joints/b2Joint.cpp
BOX2D_SOURCES += Box2D/Dynamics/Joints/b2LineJoint.cpp
BOX2D_SOURCES += Box2D/Dynamics/Joints/b2MouseJoint.cpp
BOX2D_SOURCES += Box2D/Dynamics/Joints/b2PrismaticJoint.cpp
BOX2D_SOURCES += Box2D/Dynamics/Joints/b2PulleyJoint.cpp
BOX2D_SOURCES += Box2D/Dynamics/Joints/b2RevoluteJoint.cpp
BOX2D_SOURCES += Box2D/Dynamics/Joints/b2WeldJoint.cpp

#######################################
# Facade sources.
#######################################
FACADE_SOURCES := Box2DFacade/com_noiseandheat_box2d_Box2D.cpp
FACADE_SOURCES += Box2DFacade/core.cpp

#######################################
# Setup the build.
#######################################
include $(CLEAR_VARS)

LOCAL_ARM_MODE   := arm
LOCAL_MODULE     := box2d
LOCAL_LDLIBS     := -llog
LOCAL_C_INCLUDES := $(LOCAL_PATH)/Box2D
LOCAL_SRC_FILES  := $(BOX2D_SOURCES) $(FACADE_SOURCES)

#######################################
# Create the shared library.
#######################################
include $(BUILD_SHARED_LIBRARY)
