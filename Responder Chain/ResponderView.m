//
//  ResponderView.m
//  Responder Chain
//
//  Created by Tim Chilvers on 02/04/2013.
//  Copyright (c) 2013 Future Workshops. All rights reserved.
//

#import "ResponderView.h"
#import "CustomRecognizer.h"
#import "CustomResponder.h"

@interface ResponderView()

@property (nonatomic,strong) UILabel *label;
@property (nonatomic,strong) CustomResponder *responder;

@end

@implementation ResponderView

- (id)init{
    
    self = [super init];
    if (self) {
        
        CustomRecognizer *rec = [[CustomRecognizer alloc] init];
        [self addGestureRecognizer:rec];
      
        self.label = [[UILabel alloc] init];
        self.label.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
        [self addSubview:self.label];
        self.responder = [[CustomResponder alloc] init];
    }
    return self;
}

- (void)setTitle:(NSString *)string {
    
    self.label.text = string;
    [self.label sizeToFit];
    self.label.center = (CGPoint){CGRectGetMidX(self.bounds),CGRectGetMidY(self.bounds)};
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    NSLog(@"Touches in the view for view: %@",self);
    
    [super touchesBegan:touches withEvent:event];
}

- (UIResponder *)nextResponder {

    UIResponder *nextResponder = [super nextResponder];
    
    if (self.responder) {
        self.responder.customNextResponder = nextResponder;
        return self.responder;
    } else {
        return nextResponder;
    }
}

@end
