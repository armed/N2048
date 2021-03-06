//
// Created by Artem Medeusheyev on 13.03.14.
// Copyright (c) 2014 Artem Medeusheyev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>
#import "ARMGrid.h"

@interface ARMCell : SKShapeNode
@property CGFloat size;
+ (instancetype)initForGrid:(ARMGrid *)grid
                         Row:(NSUInteger)r
                         Col:(NSUInteger)c;
- (void)initPathWithGrid:(ARMGrid *)grid row:(NSUInteger)r col:(NSUInteger)c;
@end
