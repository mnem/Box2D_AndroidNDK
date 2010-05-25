#######################################
# Set the local path.
#######################################
LOCAL_PATH := $(call my-dir)

#######################################
# Build the Box2D core static lib
#######################################
BOX2D_SOURCES := Box2D/Source/Collision/b2BroadPhase.cpp
BOX2D_SOURCES += Box2D/Source/Collision/b2CollideCircle.cpp
BOX2D_SOURCES += Box2D/Source/Collision/b2CollideEdge.cpp
BOX2D_SOURCES += Box2D/Source/Collision/b2CollidePoly.cpp
BOX2D_SOURCES += Box2D/Source/Collision/b2Collision.cpp
BOX2D_SOURCES += Box2D/Source/Collision/b2Distance.cpp
BOX2D_SOURCES += Box2D/Source/Collision/b2DynamicTree.cpp
BOX2D_SOURCES += Box2D/Source/Collision/b2PairManager.cpp
BOX2D_SOURCES += Box2D/Source/Collision/b2TimeOfImpact.cpp
BOX2D_SOURCES += Box2D/Source/Collision/Shapes/b2CircleShape.cpp
BOX2D_SOURCES += Box2D/Source/Collision/Shapes/b2EdgeShape.cpp
BOX2D_SOURCES += Box2D/Source/Collision/Shapes/b2PolygonShape.cpp
BOX2D_SOURCES += Box2D/Source/Collision/Shapes/b2Shape.cpp
BOX2D_SOURCES += Box2D/Source/Common/b2BlockAllocator.cpp
BOX2D_SOURCES += Box2D/Source/Common/b2Math.cpp
BOX2D_SOURCES += Box2D/Source/Common/b2Settings.cpp
BOX2D_SOURCES += Box2D/Source/Common/b2StackAllocator.cpp
BOX2D_SOURCES += Box2D/Source/Dynamics/b2Body.cpp
BOX2D_SOURCES += Box2D/Source/Dynamics/b2ContactManager.cpp
BOX2D_SOURCES += Box2D/Source/Dynamics/b2EdgeChain.cpp
BOX2D_SOURCES += Box2D/Source/Dynamics/b2Fixture.cpp
BOX2D_SOURCES += Box2D/Source/Dynamics/b2Island.cpp
BOX2D_SOURCES += Box2D/Source/Dynamics/b2World.cpp
BOX2D_SOURCES += Box2D/Source/Dynamics/b2WorldCallbacks.cpp
BOX2D_SOURCES += Box2D/Source/Dynamics/Contacts/b2CircleContact.cpp
BOX2D_SOURCES += Box2D/Source/Dynamics/Contacts/b2Contact.cpp
BOX2D_SOURCES += Box2D/Source/Dynamics/Contacts/b2ContactSolver.cpp
BOX2D_SOURCES += Box2D/Source/Dynamics/Contacts/b2EdgeAndCircleContact.cpp
BOX2D_SOURCES += Box2D/Source/Dynamics/Contacts/b2PolyAndCircleContact.cpp
BOX2D_SOURCES += Box2D/Source/Dynamics/Contacts/b2PolyAndEdgeContact.cpp
BOX2D_SOURCES += Box2D/Source/Dynamics/Contacts/b2PolyContact.cpp
BOX2D_SOURCES += Box2D/Source/Dynamics/Controllers/b2BuoyancyController.cpp
BOX2D_SOURCES += Box2D/Source/Dynamics/Controllers/b2ConstantAccelController.cpp
BOX2D_SOURCES += Box2D/Source/Dynamics/Controllers/b2ConstantForceController.cpp
BOX2D_SOURCES += Box2D/Source/Dynamics/Controllers/b2Controller.cpp
BOX2D_SOURCES += Box2D/Source/Dynamics/Controllers/b2GravityController.cpp
BOX2D_SOURCES += Box2D/Source/Dynamics/Controllers/b2TensorDampingController.cpp
BOX2D_SOURCES += Box2D/Source/Dynamics/Joints/b2DistanceJoint.cpp
BOX2D_SOURCES += Box2D/Source/Dynamics/Joints/b2FixedJoint.cpp
BOX2D_SOURCES += Box2D/Source/Dynamics/Joints/b2GearJoint.cpp
BOX2D_SOURCES += Box2D/Source/Dynamics/Joints/b2Joint.cpp
BOX2D_SOURCES += Box2D/Source/Dynamics/Joints/b2LineJoint.cpp
BOX2D_SOURCES += Box2D/Source/Dynamics/Joints/b2MouseJoint.cpp
BOX2D_SOURCES += Box2D/Source/Dynamics/Joints/b2PrismaticJoint.cpp
BOX2D_SOURCES += Box2D/Source/Dynamics/Joints/b2PulleyJoint.cpp
BOX2D_SOURCES += Box2D/Source/Dynamics/Joints/b2RevoluteJoint.cpp

include $(CLEAR_VARS)
LOCAL_ARM_MODE   := arm
LOCAL_MODULE     := box2dcore
LOCAL_C_INCLUDES := $(LOCAL_PATH)/Box2DAndroid/Include
LOCAL_SRC_FILES  := $(BOX2D_SOURCES)
include $(BUILD_STATIC_LIBRARY)

#######################################
# Build the Box2D wrapper lib
#######################################
WRAPPER_SOURCES := 

include $(CLEAR_VARS)
LOCAL_ARM_MODE   := arm
LOCAL_MODULE     := box2dwrapper
LOCAL_SRC_FILES  := $(WRAPPER_SOURCES)
include $(BUILD_STATIC_LIBRARY)

#######################################
# Assemble it into a shared library for
# use in Android
#######################################
include $(CLEAR_VARS)
LOCAL_ARM_MODE   := arm
LOCAL_MODULE     := box2d
LOCAL_STATIC_LIBRARIES := box2dcore box2dwrapper
include $(BUILD_SHARED_LIBRARY)
