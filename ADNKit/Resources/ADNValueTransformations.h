//
//  ADNValueTransformations.h
//  ADNKit
//
//  Created by Joel Levin on 3/3/13.
//  Copyright (c) 2013 Afterwork Studios. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ADNValueTransformations : NSObject

// forward transformations
+ (NSURL *)NSURLFromNSString:(NSString *)string;

// reverse transformations
+ (id)JSONObjectFromNSURL:(NSURL *)URL;

@end
