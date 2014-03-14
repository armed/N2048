//
//  ARMBoardIndex.h
//  N2048
//
//  Created by Artem Medeusheyev on 12.03.14.
//  Copyright (c) 2014 Artem Medeusheyev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ARMBoardIndex : NSObject
@property NSUInteger row;
@property NSUInteger col;

+ (ARMBoardIndex *)initWithRow:(NSUInteger)row Col:(NSUInteger)col;
@end
