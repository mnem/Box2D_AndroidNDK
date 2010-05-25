#!/bin/sh
INPUT=Box2DAndroid/SWIG/Box2D.i
JAVA_OUTPUT=../src/noiseandheat/android/box2d
JAVA_PACKAGE=noiseandheat.android.box2d
WRAPPER=Box2DAndroid/Source/Box2D_wrap.cpp

rm ${JAVA_OUTPUT}/*.java 
swig -v -c++ -java -includeall -ignoremissing -package ${JAVA_PACKAGE} -outdir ${JAVA_OUTPUT} -o ${WRAPPER} ${INPUT}
