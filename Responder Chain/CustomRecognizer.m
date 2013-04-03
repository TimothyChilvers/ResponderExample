//
//  CustomRecognizer.m
//  Responder Chain
//
//  Created by Tim Chilvers on 02/04/2013.
//  Copyright (c) 2013 Future Workshops. All rights reserved.
//

#import "CustomRecognizer.h"

@implementation CustomRecognizer

- (id)init
{
    self = [super init];
    if (self) {
        self.delaysTouchesEnded = NO;
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    NSLog(@"Touches in the recogniser for view: %@",self.view);
}

@end
