//
// Created by Artem Medeusheyev on 14.03.14.
// Copyright (c) 2014 Artem Medeusheyev. All rights reserved.
//

#import "ARMTileItem.h"


@implementation ARMTileItem
+ (instancetype)empty {
    return [[ARMTileItem alloc] init];
}

- (BOOL)isEmpty {
    return self.tile == nil;
}
@end
