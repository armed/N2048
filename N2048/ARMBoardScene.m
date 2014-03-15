//
//  ARMHelloScene.m
//  N2048
//
//  Created by Artem Medeusheyev on 12.03.14.
//  Copyright (c) 2014 Artem Medeusheyev. All rights reserved.
//

#import "ARMBoardScene.h"
#import "UIColor+Hex.h"
#import "ARMGrid.h"

#define MARGIN 15

@interface ARMBoardScene ()
@property BOOL contentCreated;
@property UISwipeGestureRecognizer *swipeLeft;
@property UISwipeGestureRecognizer *swipeRight;
@property UISwipeGestureRecognizer *swipeUp;
@property UISwipeGestureRecognizer *swipeDown;
@property SKShapeNode *board;
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

    self.board = [ARMGrid initWithX:startX y:startY size:boardSize];
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
@end
