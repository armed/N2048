//
// Created by Artem Medeusheyev on 13.03.14.
// Copyright (c) 2014 Artem Medeusheyev. All rights reserved.
//

#import "ARMTile.h"

@interface ARMTile ()
@property(weak, nonatomic) ARMGrid *grid;
@property(nonatomic) NSUInteger row;
@property(nonatomic) NSUInteger col;
@property(nonatomic) NSUInteger value;
@end

@implementation ARMTile
+ (instancetype)initForGrid:(ARMGrid *)grid
                        Row:(NSUInteger)r
                        Col:(NSUInteger)c
                        Val:(NSUInteger)v {
    ARMTile *tile = [ARMTile node];
    tile.row = r;
    tile.col = c;
    tile.value = v;

    [tile initPathWithGrid:grid Row:r Col:c];

    if (v == 2) {
        tile.fillColor = tile.strokeColor = [UIColor colorFromHex:TILE_2_BG];
    } else if (v == 4) {
        tile.fillColor = tile.strokeColor = [UIColor colorFromHex:TILE_4_BG];
    } else if (v == 8) {
        tile.fillColor = tile.strokeColor = [UIColor colorFromHex:TILE_8_BG];
    } else if (v == 16) {
        tile.fillColor = tile.strokeColor = [UIColor colorFromHex:TILE_16_BG];
    } else if (v == 32) {
        tile.fillColor = tile.strokeColor = [UIColor colorFromHex:TILE_32_BG];
    } else if (v == 64) {
        tile.fillColor = tile.strokeColor = [UIColor colorFromHex:TILE_64_BG];
    } else if (v == 128) {
        tile.fillColor = tile.strokeColor = [UIColor colorFromHex:TILE_128_BG];
    } else if (v == 256) {
        tile.fillColor = tile.strokeColor = [UIColor colorFromHex:TILE_256_BG];
    } else if (v == 512) {
        tile.fillColor = tile.strokeColor = [UIColor colorFromHex:TILE_512_BG];
    } else if (v == 1024) {
        tile.fillColor = tile.strokeColor = [UIColor colorFromHex:TILE_1024_BG];
    } else/* if (v == 2048) */{
        tile.fillColor = tile.strokeColor = [UIColor colorFromHex:TILE_2048_BG];
    }

    SKLabelNode *value = [SKLabelNode labelNodeWithFontNamed:@"Arial Bold"];
    value.fontColor = [UIColor colorFromHex:(v > 4 ? LIGHT_FONT_COLOR : BASE_FONT_COLOR)];
    value.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeCenter;
    value.verticalAlignmentMode = SKLabelVerticalAlignmentModeCenter;
    value.fontSize = 34.0f;
    value.position = CGPointMake(tile.size / 2, tile.size / 2);
    value.text = [NSString stringWithFormat:@"%lu", (unsigned long) v];

    [tile addChild:value];

    return tile;
}

@end
