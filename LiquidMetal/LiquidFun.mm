//
//  LiquidFun.m
//  LiquidMetal
//
//  Created by Yvette Cook on 06/11/2015.
//  Copyright © 2015 YvetteCook. All rights reserved.
//

#import "LiquidFun.h"
#import "Box2D.h"

static b2World *world;

@implementation LiquidFun

+ (void)createWorldWithGravity:(Vector2D)gravity {
    world = new b2World(b2Vec2(gravity.x, gravity.y));
}



@end
