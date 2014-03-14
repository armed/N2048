//
//  ARMBoardIndex.m
//  N2048
//
//  Created by Artem Medeusheyev on 12.03.14.
//  Copyright (c) 2014 Artem Medeusheyev. All rights reserved.
//

#import "ARMBoardIndex.h"

@implementation ARMBoardIndex
+ (ARMBoardIndex *)initWithRow:(NSUInteger)row Col:(NSUInteger)col {
    ARMBoardIndex *index = [[ARMBoardIndex alloc] init];
    index.row = row;
    index.col = col;
    return index;
}
@end
