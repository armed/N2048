//
// Created by Artem Medeusheyev on 14.03.14.
// Copyright (c) 2014 Artem Medeusheyev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ARMTile.h"

@interface ARMTileItem : NSObject
@property ARMTile *tile;

+ (instancetype) empty;
- (BOOL)isEmpty;
@end
