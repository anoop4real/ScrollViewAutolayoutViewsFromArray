//
//  ContentView.h
//  ScrollViewAutoLayout
//
//  Created by anoopm on 11/09/15.
//  Copyright (c) 2015 anoopm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContentView : UIView
{
    IBOutlet UILabel *name;
}
-(void)layoutTheLabel;
@end
