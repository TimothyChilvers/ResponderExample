//
//  TextField.m
//  Responder Chain
//
//  Created by Tim Chilvers on 02/04/2013.
//  Copyright (c) 2013 Future Workshops. All rights reserved.
//

#import "TextField.h"
#import "CustomRecognizer.h"
#import "CustomResponder.h"

@interface TextField ()

@property (nonatomic,strong) CustomResponder *responder;

@end

@implementation TextField

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self addGestureRecognizer:[[CustomRecognizer alloc] init]];
        self.responder = [[CustomResponder alloc] init];
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [super touchesBegan:touches withEvent:event];
    
    NSLog(@"Touches in the text field : %@",self);
}

- (UIResponder *)nextResponder {
    
    if (self.responder) {
        self.responder.customNextResponder = [super nextResponder];
        return self.responder;
    } else {
        return [super nextResponder];
    }
}


@end
