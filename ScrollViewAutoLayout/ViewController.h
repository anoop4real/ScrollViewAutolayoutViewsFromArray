//
//  ViewController.h
//  ScrollViewAutoLayout
//
//  Created by anoopm on 11/09/15.
//  Copyright (c) 2015 anoopm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    IBOutlet UIScrollView *contentScrollView;
    NSMutableArray *viewsArray;
    NSMutableDictionary *viewsDict;
}


@end

