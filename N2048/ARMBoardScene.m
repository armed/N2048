//
//  ARMHelloScene.m
//  N2048
//
//  Created by Artem Medeusheyev on 12.03.14.
//  Copyright (c) 2014 Artem Medeusheyev. All rights reserved.
//

#import "ARMBoardScene.h"
#import "UIColor+Hex.h"
#import "ARMBoardIndex.h"
#import "ARMGrid.h"

#define MARGIN 15
#define BG_COLOR 0xfaf8ef
#define BOARD_COLOR 0xbbada0



@interface ARMBoardScene ()
@property BOOL contentCreated;
@property UISwipeGestureRecognizer *swipeLeft;
@property UISwipeGestureRecognizer *swipeRight;
@property UISwipeGestureRecognizer *swipeUp;
@property UISwipeGestureRecognizer *swipeDown;


@property SKShapeNode *board;

@property NSArray *boardFields;
@property NSArray *oldBoardFields;
@end

@implementation ARMBoardScene

- (void)didMoveToView:(SKView *)view {
    if (!self.contentCreated) {
        [self createSceneContents];

        self.swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleLeft)];
        [self.swipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
        [self.view addGestureRecognizer:self.swipeLeft];

        self.swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleRight)];
        [self.swipeRight setDirection:UISwipeGestureRecognizerDirectionRight];
        [self.view addGestureRecognizer:self.swipeRight];

        self.swipeUp = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleUp)];
        [self.swipeUp setDirection:UISwipeGestureRecognizerDirectionUp];
        [self.view addGestureRecognizer:self.swipeUp];

        self.swipeDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleDown)];
        [self.swipeDown setDirection:UISwipeGestureRecognizerDirectionDown];
        [self.view addGestureRecognizer:self.swipeDown];

        self.contentCreated = YES;
    }
}

- (void)createSceneContents {
    self.backgroundColor = [SKColor colorFromHex:BG_COLOR];
    self.scaleMode = SKSceneScaleModeAspectFit;
    [self initBoard];
    [self addChild:self.board];
}

- (void)initBoard {
    CGSize size = self.size;
    CGFloat startX = MARGIN;
    CGFloat startY = MARGIN + (size.height - size.width) / 2;
    CGFloat boardSize = size.width - MARGIN * 2;

    self.board = [ARMGrid initWithX:startX Y:startY Size:boardSize];
}

- (void)handleLeft {
    NSLog(@"left");
}

- (void)handleRight {
    NSLog(@"right");
}

- (void)handleUp {
    NSLog(@"up");
}

- (void)handleDown {
    NSLog(@"down");
}

- (NSMutableArray *)emptyFields {
    NSMutableArray *fields = [NSMutableArray arrayWithCapacity:4 * 4];
    for (uint r = 0; r < 4; r++) {
        for (uint c = 0; c < 4; c++) {
            if ([self.boardFields[r][c] intValue] == 0) {
                [fields addObject:[ARMBoardIndex initWithRow:r Col:c]];
            }
        }
    }
    return fields;
}

- (void)addRandomTile {
    NSMutableArray *fields = [self emptyFields];
    NSUInteger max = [fields count];
    NSUInteger index = arc4random_uniform(max);
    ARMBoardIndex *bi = fields[index];
    NSInteger twoOrFour = arc4random_uniform(10);
    self.boardFields[bi.row][bi.col] = [NSNumber numberWithInt:(twoOrFour < 9 ? 2 : 4)];
    [self showTileAtRow:bi.row col:bi.col];
}

- (void)showTileAtRow:(NSUInteger)row col:(NSUInteger)col {

}
@end
