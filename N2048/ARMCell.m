//
// Created by Artem Medeusheyev on 13.03.14.
// Copyright (c) 2014 Artem Medeusheyev. All rights reserved.
//

#import "ARMCell.h"

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
    self.size = (grid.size - cellMargin * 5) / 4;
    CGFloat tileX = (self.size + cellMargin) * c + grid.startX + cellMargin;
    CGFloat tileY = (self.size + cellMargin) * r + grid.startY + cellMargin;
    self.position = CGPointMake(tileX, tileY);
    [self setPath:CGPathCreateWithRoundedRect(CGRectMake(0, 0, self.size, self.size), 4, 4, nil)];
}
@end
