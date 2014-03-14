//
//  NSColor+Hex.m
//  N2048
//
//  Created by Artem Medeusheyev on 12.03.14.
//  Copyright (c) 2014 Artem Medeusheyev. All rights reserved.
//

#import "UIColor+Hex.h"

@implementation UIColor (Hex)

+ (UIColor *)colorFromHex:(unsigned long)hex {
    return [UIColor colorWithRed:((float) ((hex & 0xFF0000) >> 16)) / 255.0
                           green:((float) ((hex & 0xFF00) >> 8)) / 255.0
                            blue:((float) (hex & 0xFF)) / 255.0
                           alpha:1.0];
}

@end
