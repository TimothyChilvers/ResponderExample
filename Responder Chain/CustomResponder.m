//
//  CustomResponder.m
//  Responder Chain
//
//  Created by Tim Chilvers on 03/04/2013.
//  Copyright (c) 2013 Future Workshops. All rights reserved.
//

#import "CustomResponder.h"

@interface CustomResponder ()


@end

@implementation CustomResponder

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    NSLog(@"Touches in the custom responder: %@",self);
    [self.customNextResponder touchesBegan:touches withEvent:event];
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.customNextResponder touchesMoved:touches withEvent:event];
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.customNextResponder touchesEnded:touches withEvent:event];
}
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.customNextResponder touchesCancelled:touches withEvent:event];    
}

- (UIResponder *)nextResponder {
    
    return self.customNextResponder;
}
@end
