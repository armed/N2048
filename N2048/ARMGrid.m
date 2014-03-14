//
// Created by Artem Medeusheyev on 13.03.14.
// Copyright (c) 2014 Artem Medeusheyev. All rights reserved.
//

#import "ARMGrid.h"
#import "UIColor+Hex.h"
#import "ARMCell.h"
#import "ARMTileItem.h"
#import "ARMBoardIndex.h"

#define BOARD_COLOR 0xbbada0

@interface ARMGrid ()
@property(nonatomic) NSArray *tileData;
@end

@implementation ARMGrid
+ (instancetype)initWithX:(CGFloat)x Y:(CGFloat)y Size:(CGFloat)size {
    ARMGrid *grid = [ARMGrid node];
    grid.startX = x;
    grid.startY = y;
    grid.size = size;

    [grid setPath:CGPathCreateWithRoundedRect(CGRectMake(x, y, size, size), 4, 4, nil)];
    grid.strokeColor = grid.fillColor = [UIColor colorFromHex:BOARD_COLOR];

    NSMutableArray *td = [NSMutableArray arrayWithCapacity:4];

    for (uint i = 0; i < 4; i++) {
        NSMutableArray *tr = [NSMutableArray arrayWithCapacity:4];
        for (uint j = 0; j < 4; j++) {
            [grid addChild:[ARMCell initForGrid:grid Row:i Col:j]];
            [tr addObject:[ARMTileItem empty]];
        }
        [td addObject:tr];
    }
    grid.tileData = [NSArray arrayWithArray:td];

    [grid addRandomTile];
    [grid addRandomTile];
    return grid;
}

- (NSArray *)emptyCells {
    NSMutableArray *cells = [NSMutableArray arrayWithCapacity:4 * 4];
    for (uint r = 0; r < 4; r++) {
        for (uint c = 0; c < 4; c++) {
            if ([self.tileData[r][c] isEmpty]) {
                [cells addObject:[ARMBoardIndex initWithRow:r Col:c]];
            }
        }
    }
    return [NSArray arrayWithArray:cells];
}

- (void)addRandomTile {
    NSArray *cells = [self emptyCells];
    NSUInteger max = [cells count];
    NSUInteger index = arc4random_uniform(max);
    ARMBoardIndex *bi = cells[index];
    NSUInteger twoOrFour = arc4random_uniform(10);
    ARMTileItem *item = self.tileData[bi.row][bi.col];
    item.tile = [ARMTile initForGrid:self Row:bi.row Col:bi.col Val:(twoOrFour < 9 ? 2 : 4)];
    [self addChild:item.tile];
}
@end
