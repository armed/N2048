//
// Created by Artem Medeusheyev on 13.03.14.
// Copyright (c) 2014 Artem Medeusheyev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>
#import "ARMColors.h"

@interface ARMGrid : SKShapeNode
@property CGFloat startX;
@property CGFloat startY;
@property CGFloat size;

+ (instancetype)initWithX:(CGFloat)x Y:(CGFloat)y Size:(CGFloat)size;
@end
