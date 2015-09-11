//
//  ViewController.m
//  ScrollViewAutoLayout
//
//  Created by anoopm on 11/09/15.
//  Copyright (c) 2015 anoopm. All rights reserved.
//

#import "ViewController.h"
#import "ContentView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    viewsArray = [[NSMutableArray alloc] init];
    viewsDict  = [[NSMutableDictionary alloc] init];
    contentScrollView.pagingEnabled = YES;
    [self setUpViews];
    [self layoutViews];
    //[self layoutViewsVertically];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*!
 Create an array of views that we need to load
 @param nil
 @result creates array of views and adds it to scrollview
 */
-(void)setUpViews
{
    [viewsDict setObject:contentScrollView forKey:@"parent"];
    int count = 20;//Lets layout 20 views
    for (int i=0; i<=count; i++) {
        // I am loading the view from xib.
        ContentView *contenView = [[NSBundle mainBundle] loadNibNamed:@"ContentView" owner:self options:nil][0];
        contenView.translatesAutoresizingMaskIntoConstraints = NO;
        // Layout the text and color
        [contenView layoutTheLabel];
        [contentScrollView addSubview:contenView];
        [viewsArray addObject:contenView];
    }
}
/*!
 Method to layout the childviews in the scrollview.
 @param nil
 @result layout the child views
 */
-(void)layoutViews
{
    NSMutableString *horizontalString = [NSMutableString string];
    // Keep the start of the horizontal constraint
    [horizontalString appendString:@"H:|"];
    for (int i=0; i<viewsArray.count; i++) {
        // Here I am providing the index of the array as the view name key in the dictionary
        [viewsDict setObject:viewsArray[i] forKey:[NSString stringWithFormat:@"v%d",i]];
        // Since we are having only one view vertically, then we need to add the constraint now itself. Since we need to have fullscreen, we are giving height equal to the superview.
        NSString *verticalString = [NSString stringWithFormat:@"V:|[%@(==parent)]|", [NSString stringWithFormat:@"v%d",i]];
        // add the constraint
        [contentScrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:verticalString options:0 metrics:nil views:viewsDict]];
        // Since we need to horizontally arrange, we construct a string, with all the views in array looped and here also we have fullwidth of superview.
        [horizontalString appendString:[NSString stringWithFormat:@"[%@(==parent)]", [NSString stringWithFormat:@"v%d",i]]];
    }
    // Close the string with the parent
    [horizontalString appendString:@"|"];
    // apply the constraint
    [contentScrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:horizontalString options:0 metrics:nil views:viewsDict]];
}

/*!
 Method to layout the childviews in the scrollview.
 @param nil
 @result layout the child views
 */
-(void)layoutViewsVertically
{
    NSMutableString *verticalString = [NSMutableString string];
    // Keep the start of the vertical constraint
    [verticalString appendString:@"V:|"];
    for (int i=0; i<viewsArray.count; i++) {
        // Here I am providing the index of the array as the view name key in the dictionary
        [viewsDict setObject:viewsArray[i] forKey:[NSString stringWithFormat:@"v%d",i]];
        // Since we are having only one view horizontally, then we need to add the constraint now itself. Since we need to have fullscreen, we are giving width equal to the superview.
        NSString *horizontalString = [NSString stringWithFormat:@"H:|[%@(==parent)]|", [NSString stringWithFormat:@"v%d",i]];
        // add the constraint
        [contentScrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:horizontalString options:0 metrics:nil views:viewsDict]];
        // Since we need to horizontally arrange, we construct a string, with all the views in array looped and here also we have fullwidth of superview.
        [verticalString appendString:[NSString stringWithFormat:@"[%@(==parent)]", [NSString stringWithFormat:@"v%d",i]]];
    }
    // Close the string with the parent
    [verticalString appendString:@"|"];
    // apply the constraint
    [contentScrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:verticalString options:0 metrics:nil views:viewsDict]];
}

@end
