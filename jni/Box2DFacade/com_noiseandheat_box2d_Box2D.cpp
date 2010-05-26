/**
 * Copyright (c) 2010 David Wagner
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

#include "com_noiseandheat_box2d_Box2D.h"
#include "Box2D.h"

static b2World* world = NULL;

JNIEXPORT void JNICALL Java_com_noiseandheat_box2d_Box2D_init(JNIEnv * env, jobject obj)
{
    // Create world
    {
        b2Vec2 gravity(0.0f, -10.0f);
        bool doSleep = true;
        world = new b2World(gravity, doSleep);
    }

    // Create ground
    {
        b2BodyDef groundBodyDef;
        groundBodyDef.position.Set(0.0f, -10.0f);
        b2Body* groundBody = world->CreateBody(&groundBodyDef);
        b2PolygonShape groundBox;
        groundBox.SetAsBox(50.0f, 10.0f);
        groundBody->CreateFixture(&groundBox);
    }

    // Create body
    {
        b2BodyDef bodyDef;
        bodyDef.type = b2_dynamicBody;
        bodyDef.position.Set(0.0f, 4.0f);
        b2Body* body = world->CreateBody(&bodyDef);
        b2PolygonShape dynamicBox;
        dynamicBox.SetAsBox(1.0f, 1.0f);
        b2FixtureDef fixtureDef;
        fixtureDef.shape = &dynamicBox;
        fixtureDef.density = 1.0f;
        fixtureDef.friction = 0.3f;
        body->CreateFixture(&fixtureDef);
    }
}

JNIEXPORT void JNICALL Java_com_noiseandheat_box2d_Box2D_init(JNIEnv * env, jobject obj)
{
    float32 timeStep = 1.0f / 60.0f;
    int32 velocityIterations = 6;
    int32 positionIterations = 2;

    world->Step(timeStep, velocityIterations, positionIterations);
    world->ClearForces();

    b2Vec2 position = body->GetPosition();
    float32 angle = body->GetAngle();

    LOGI("%4.2f %4.2f %4.2f\n", position.x, position.y, angle);
}

// TODO: Don't forget to add a destroy function so world can be deleted
