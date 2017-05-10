//
//  LPAViewController.m
//  Autolayout
//
//  Created by Steven Masuch on 2014-07-20.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import "LPAViewController.h"

@interface LPAViewController ()

@property (nonatomic, weak) UIButton *squareButton;
@property (nonatomic, weak) UIButton *portraitButton;
@property (nonatomic, weak) UIButton *landscapeButton;

@property (nonatomic, weak) UIView *framingView;
@property (nonatomic, weak) NSLayoutConstraint *framingViewHeightConstraint;
@property (nonatomic, weak) NSLayoutConstraint *framingViewWidthConstraint;

@end

@implementation LPAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *squareButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [squareButton setTitle:@"Square" forState:UIControlStateNormal];
    [squareButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:squareButton];
    squareButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.squareButton = squareButton;
    
    UIButton *portraitButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [portraitButton setTitle:@"Portrait" forState:UIControlStateNormal];
    [portraitButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:portraitButton];
    portraitButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.portraitButton = portraitButton;
    
    UIButton *landscapeButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [landscapeButton setTitle:@"Landscape" forState:UIControlStateNormal];
    [landscapeButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:landscapeButton];
    landscapeButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.landscapeButton = landscapeButton;
    
    UIView *framingView = [[UIView alloc] initWithFrame:CGRectZero];
    framingView.translatesAutoresizingMaskIntoConstraints = NO;
    framingView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:framingView];
    self.framingView = framingView;
    
   
    
    
    
    
    
    
    NSString *buttonsHorizontalConstraintsFormat = @"|[squareButton(==portraitButton)][portraitButton(==landscapeButton)][landscapeButton]|";
    
    NSArray *buttonsHorizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:buttonsHorizontalConstraintsFormat
                                                                   options:NSLayoutFormatAlignAllCenterY
                                                                    metrics:nil
                                                                    views:NSDictionaryOfVariableBindings(squareButton, portraitButton, landscapeButton)];
    [NSLayoutConstraint activateConstraints:buttonsHorizontalConstraints];
    
    NSLayoutConstraint *squareButtonBottomConstraint = [NSLayoutConstraint constraintWithItem:squareButton
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:-50.0];
    squareButtonBottomConstraint.active = YES;
    
    NSLayoutConstraint *framingViewCenterXConstraint = [NSLayoutConstraint constraintWithItem:framingView
                                                                                    attribute:NSLayoutAttributeCenterX
                                                                                    relatedBy:NSLayoutRelationEqual
                                                                                       toItem:self.view
                                                                                    attribute:NSLayoutAttributeCenterX
                                                                                   multiplier:1.0
                                                                                     constant:0.0];
    framingViewCenterXConstraint.active = YES;
    
    NSLayoutConstraint *framingViewCenterY = [NSLayoutConstraint constraintWithItem:framingView
                                                                          attribute:NSLayoutAttributeCenterY
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:self.view
                                                                          attribute:NSLayoutAttributeCenterY
                                                                         multiplier:1.0
                                                                           constant:-50.0];
    framingViewCenterY.active = YES;
    
    self.framingViewHeightConstraint = [NSLayoutConstraint constraintWithItem:framingView
                                                                                   attribute:NSLayoutAttributeHeight
                                                                                   relatedBy:NSLayoutRelationEqual
                                                                                      toItem:nil
                                                                                   attribute:NSLayoutAttributeNotAnAttribute
                                                                                  multiplier:1.0
                                                                                    constant:500.0];
    self.framingViewHeightConstraint.active = YES;
    
    self.framingViewWidthConstraint = [NSLayoutConstraint constraintWithItem:framingView
                                                                                  attribute:NSLayoutAttributeWidth
                                                                                  relatedBy:NSLayoutRelationEqual
                                                                                     toItem:nil
                                                                                  attribute:NSLayoutAttributeNotAnAttribute
                                                                                 multiplier:1.0
                                                                                   constant:500.0];
    self.framingViewWidthConstraint.active = YES;

    
    // Set up your views and constraints here
    
    UIView *purpleBox = [[UIView alloc] initWithFrame:CGRectZero];
    purpleBox.translatesAutoresizingMaskIntoConstraints = NO;
    purpleBox.backgroundColor = [UIColor purpleColor];
    [self.framingView addSubview:purpleBox];  //add the purple box to our view

    NSLayoutConstraint *purpleRightMargin =   [NSLayoutConstraint constraintWithItem:purpleBox
                                                                         attribute:NSLayoutAttributeRightMargin
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:self.framingView
                                                                         attribute:NSLayoutAttributeRightMargin
                                                                        multiplier:1.0
                                                                          constant:-25.0];
    [self.view addConstraint:purpleRightMargin];


    NSLayoutConstraint *purpleBottomMargin = [NSLayoutConstraint constraintWithItem:purpleBox
                                                                          attribute:NSLayoutAttributeBottomMargin
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:self.framingView
                                                                          attribute:NSLayoutAttributeBottomMargin
                                                                         multiplier:1.0
                                                                           constant:-20.0];
    [self.view addConstraint:purpleBottomMargin];

    
    NSLayoutConstraint *purpleWidth =   [NSLayoutConstraint constraintWithItem:purpleBox
                                                                     attribute:NSLayoutAttributeWidth
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:self.framingView
                                                                     attribute:NSLayoutAttributeWidth
                                                                    multiplier:305.0/500.0
                                                                      constant:0];
     [self.view addConstraint:purpleWidth];

    

    NSLayoutConstraint *purpleHeight =   [NSLayoutConstraint constraintWithItem:purpleBox
                                                                           attribute:NSLayoutAttributeHeight
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:nil
                                                                           attribute:NSLayoutAttributeNotAnAttribute
                                                                          multiplier:1
                                                                            constant:50];
    [self.view addConstraint:purpleHeight];
    
    
    //SET RED BOX
    UIView *redBox = [[UIView alloc] initWithFrame:CGRectZero];
    redBox.translatesAutoresizingMaskIntoConstraints = NO;
    redBox.backgroundColor = [UIColor redColor];
    [self.framingView addSubview:redBox];  //add the red box to our view
    
    NSLayoutConstraint *redRightMargin =   [NSLayoutConstraint constraintWithItem:redBox
                                                                           attribute:NSLayoutAttributeRightMargin
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:self.framingView
                                                                           attribute:NSLayoutAttributeRightMargin
                                                                          multiplier:1.0
                                                                            constant:-20.0];
    
    NSLayoutConstraint *redLeftMargin =   [NSLayoutConstraint constraintWithItem:redBox
                                                                          attribute:NSLayoutAttributeLeftMargin
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:self.framingView
                                                                          attribute:NSLayoutAttributeRightMargin
                                                                         multiplier:1.0
                                                                           constant:-132.0];
    
    NSLayoutConstraint *redTopMargin =   [NSLayoutConstraint constraintWithItem:redBox
                                                                         attribute:NSLayoutAttributeTopMargin
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:self.framingView
                                                                         attribute:NSLayoutAttributeTop
                                                                        multiplier:1.0
                                                                          constant:50.0];
    
    NSLayoutConstraint *redBottomMargin = [NSLayoutConstraint constraintWithItem:redBox
                                                                          attribute:NSLayoutAttributeBottomMargin
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:self.framingView
                                                                          attribute:NSLayoutAttributeTopMargin
                                                                         multiplier:1.0
                                                                           constant:66.0];
    
    [self.view addConstraint:redRightMargin];
    [self.view addConstraint:redLeftMargin];
    [self.view addConstraint:redTopMargin];
    [self.view addConstraint:redBottomMargin];
    
    //SET ORANGE BOX
    UIView *orangeBox1 = [[UIView alloc] initWithFrame:CGRectZero];
    orangeBox1.translatesAutoresizingMaskIntoConstraints = NO;
    orangeBox1.backgroundColor = [UIColor orangeColor];
    [self.framingView addSubview:orangeBox1];  //add the first orange box to our view
    
    NSLayoutConstraint *orangeBox1RightMargin =   [NSLayoutConstraint constraintWithItem:orangeBox1
                                                                        attribute:NSLayoutAttributeRightMargin
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:self.framingView
                                                                        attribute:NSLayoutAttributeRightMargin
                                                                       multiplier:1.0
                                                                         constant:-28.0];
    
    NSLayoutConstraint *orangeBox1LeftMargin =   [NSLayoutConstraint constraintWithItem:orangeBox1
                                                                       attribute:NSLayoutAttributeLeftMargin
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:self.framingView
                                                                       attribute:NSLayoutAttributeRightMargin
                                                                      multiplier:1.0
                                                                        constant:-50.0];
    
    NSLayoutConstraint *orangeBox1TopMargin =   [NSLayoutConstraint constraintWithItem:orangeBox1
                                                                      attribute:NSLayoutAttributeTopMargin
                                                                      relatedBy:NSLayoutRelationEqual
                                                                         toItem:self.framingView
                                                                      attribute:NSLayoutAttributeTop
                                                                     multiplier:1.0
                                                                       constant:58.0];
    
    NSLayoutConstraint *orangeBox1BottomMargin = [NSLayoutConstraint constraintWithItem:orangeBox1
                                                                        attribute:NSLayoutAttributeBottomMargin
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:self.framingView
                                                                       attribute:NSLayoutAttributeTopMargin
                                                                      multiplier:1.0
                                                                        constant:58.0];
    
    [self.view addConstraint:orangeBox1RightMargin];
    [self.view addConstraint:orangeBox1LeftMargin];
    [self.view addConstraint:orangeBox1TopMargin];
    [self.view addConstraint:orangeBox1BottomMargin];

    //SET ORANGE BOX
    UIView *orangeBox2 = [[UIView alloc] initWithFrame:CGRectZero];
    orangeBox2.translatesAutoresizingMaskIntoConstraints = NO;
    orangeBox2.backgroundColor = [UIColor orangeColor];
    [self.framingView addSubview:orangeBox2];  //add the first orange box to our view
    
    NSLayoutConstraint *orangeBox2RightMargin =   [NSLayoutConstraint constraintWithItem:orangeBox2
                                                                               attribute:NSLayoutAttributeRightMargin
                                                                               relatedBy:NSLayoutRelationEqual
                                                                                  toItem:self.framingView
                                                                               attribute:NSLayoutAttributeRightMargin
                                                                              multiplier:1.0
                                                                                constant:-72.0];
    
    NSLayoutConstraint *orangeBox2LeftMargin =   [NSLayoutConstraint constraintWithItem:orangeBox2
                                                                              attribute:NSLayoutAttributeLeftMargin
                                                                              relatedBy:NSLayoutRelationEqual
                                                                                 toItem:self.framingView
                                                                              attribute:NSLayoutAttributeRightMargin
                                                                             multiplier:1.0
                                                                               constant:-124.0];
    
    NSLayoutConstraint *orangeBox2TopMargin =   [NSLayoutConstraint constraintWithItem:orangeBox2
                                                                             attribute:NSLayoutAttributeTopMargin
                                                                             relatedBy:NSLayoutRelationEqual
                                                                                toItem:self.framingView
                                                                             attribute:NSLayoutAttributeTop
                                                                            multiplier:1.0
                                                                              constant:58.0];
    
    NSLayoutConstraint *orangeBox2BottomMargin = [NSLayoutConstraint constraintWithItem:orangeBox2
                                                                              attribute:NSLayoutAttributeBottomMargin
                                                                              relatedBy:NSLayoutRelationEqual
                                                                                 toItem:self.framingView
                                                                              attribute:NSLayoutAttributeTopMargin
                                                                             multiplier:1.0
                                                                               constant:58.0];
    
    [self.view addConstraint:orangeBox2RightMargin];
    [self.view addConstraint:orangeBox2LeftMargin];
    [self.view addConstraint:orangeBox2TopMargin];
    [self.view addConstraint:orangeBox2BottomMargin];


    
    
    
    
    
    
    
    
    
    
    
}





/**
 Resize the frame of the framing view depending on which button was pressed.
 */
- (void)resizeFramingView:(id)sender
{
    CGFloat newWidth = 0.0;
    CGFloat newHeight = 0.0;
    
    if (sender == self.squareButton) {
        newWidth = 500.0;
        newHeight = 500.0;
    } else if (sender == self.portraitButton) {
        newWidth = 350.0;
        newHeight = 550.0;
    } else if (sender == self.landscapeButton) {
        newWidth = 900.0;
        newHeight = 300.0;
    }
    
    [UIView animateWithDuration:2.0 animations:^(){
        self.framingViewHeightConstraint.constant = newHeight;
        self.framingViewWidthConstraint.constant = newWidth;
        [self.view layoutIfNeeded];
    }];
}

@end
