//
// Created by Artem Medeusheyev on 13.03.14.
// Copyright (c) 2014 Artem Medeusheyev. All rights reserved.
//

#import "ARMTile.h"
#import "UIColor+Hex.h"

#define TILE_2_BG 0xeee4da
#define TILE_4_BG 0xede0c8
#define TILE_8_BG 0xf2b179
#define TILE_16_BG 0xf59563
#define TILE_32_BG 0xf67c5f
#define TILE_64_BG 0xf65e3b
#define TILE_128_BG 0xedcf72
#define TILE_256_BG 0xedcc61
#define TILE_512_BG 0xedc850
#define TILE_1024_BG 0xedc53f
#define TILE_2048_BG 0xedc22e

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

    return tile;
}

@end
