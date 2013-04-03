//
//  GestureViewController.m
//  Responder Chain
//
//  Created by Tim Chilvers on 02/04/2013.
//  Copyright (c) 2013 Future Workshops. All rights reserved.
//

#import "GestureViewController.h"
#import "ResponderView.h"

@interface GestureViewController ()

@property (nonatomic,strong) ResponderView *view;
@property (nonatomic,strong) ResponderView *subview;
@property (nonatomic,strong) UITextField *textField;

@end

@implementation GestureViewController

- (void)loadView {
    
    self.view = [[ResponderView alloc] init];
}

- (void)viewDidLoad {
    
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor greenColor];
    
    self.subview = [[ResponderView alloc] init];
    self.subview.backgroundColor = [UIColor purpleColor];
    self.subview.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleLeftMargin;
    [self.subview setTitle:@"Subview"];
    [self.view setTitle:@"Parent view"];
    [self.view addSubview:self.subview];
    
    self.textField = [[UITextField alloc] init];
    self.textField.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.textField];
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    self.subview.frame = UIEdgeInsetsInsetRect(self.view.bounds, (UIEdgeInsets) {44.0f,CGRectGetMidX(self.view.bounds) + 44.0f,44.0f,44.0f});
    self.textField.frame = (CGRect){44.0f,44.0f,200.0f,44.0f};
}
 

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {

    UITouch *touch = [touches anyObject];
    NSLog(@"Touches in the controller for view: %@",touch.view);
}

@end
