//
//  CustomResponder.h
//  Responder Chain
//
//  Created by Tim Chilvers on 03/04/2013.
//  Copyright (c) 2013 Future Workshops. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CustomResponder : UIResponder

@property (nonatomic,weak) UIResponder *customNextResponder;

@end
