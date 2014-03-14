//
//  ARMViewController.m
//  N2048
//
//  Created by Artem Medeusheyev on 12.03.14.
//  Copyright (c) 2014 Artem Medeusheyev. All rights reserved.
//

#import "ARMViewController.h"
#import <SpriteKit/SpriteKit.h>
#import "ARMBoardScene.h"

@interface ARMViewController ()

@end

@implementation ARMViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    SKView *spriteView = (SKView *) self.view;
    spriteView.showsDrawCount = YES;
    spriteView.showsNodeCount = YES;
    spriteView.showsFPS = YES;
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)viewWillAppear:(BOOL)animated {
    ARMBoardScene *hello = [[ARMBoardScene alloc] initWithSize:self.view.bounds.size];
    SKView *spriteView = (SKView *) self.view;
    [spriteView presentScene:hello];
}
@end
