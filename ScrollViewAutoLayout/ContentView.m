//
//  ContentView.m
//  ScrollViewAutoLayout
//
//  Created by anoopm on 11/09/15.
//  Copyright (c) 2015 anoopm. All rights reserved.
//

#import "ContentView.h"

@implementation ContentView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)layoutTheLabel
{
    name.text = [NSString stringWithFormat:@"View%d",rand()];
    
    
    CGFloat redLevel    = rand() / (float) RAND_MAX;
    CGFloat greenLevel  = rand() / (float) RAND_MAX;
    CGFloat blueLevel   = rand() / (float) RAND_MAX;
    
    self.backgroundColor = [UIColor colorWithRed: redLevel
                                             green: greenLevel
                                              blue: blueLevel
                                             alpha: 1.0];
}

@end
