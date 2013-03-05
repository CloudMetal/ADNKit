//
//  ADNUser.m
//  ADNKit
//
//  Created by Joel Levin on 3/3/13.
//  Copyright (c) 2013 Afterwork Studios. All rights reserved.
//

#import "ADNUser.h"
#import "NSDictionary+ADNAdditions.h"


@implementation ADNUser

+ (NSDictionary *)keyMapping {
	return [[super keyMapping] adn_dictionaryByAppendingDictionary:@{@"id" : @"userID", @"created_at": @"createdAt", @"avatar_image": @"avatarImage", @"cover_image": @"coverImage"}];
}

@end
