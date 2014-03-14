//
// Created by Artem Medeusheyev on 13.03.14.
// Copyright (c) 2014 Artem Medeusheyev. All rights reserved.
//

#import "ARMCell.h"
#import "UIColor+Hex.h"

#define TILE_EMPTY_BG 0xccc0b3

@interface ARMCell ()

@end

@implementation ARMCell
+ (instancetype)initForGrid:(ARMGrid *)grid
                         Row:(NSUInteger)r
                         Col:(NSUInteger)c {
    ARMCell *cell = [ARMCell node];
    [cell initPathWithGrid:grid Row:r Col:c];
    cell.fillColor = cell.strokeColor = [UIColor colorFromHex:TILE_EMPTY_BG];
    return cell;
}

- (void)initPathWithGrid:(ARMGrid *)grid Row:(NSUInteger)r Col:(NSUInteger)c {
    CGFloat cellMargin = grid.size * 0.03;
    CGFloat cellSize = (grid.size - cellMargin *5)/4;
    CGFloat tileX = (cellSize + cellMargin) * c + grid.startX + cellMargin;
    CGFloat tileY = (cellSize + cellMargin) * r + grid.startY + cellMargin;

    [self setPath:CGPathCreateWithRoundedRect(CGRectMake(tileX, tileY, cellSize, cellSize), 4, 4, nil)];
}
@end
