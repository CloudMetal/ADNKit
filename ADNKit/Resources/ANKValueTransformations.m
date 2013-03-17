//
//  ADNValueTransformations.m
//  ADNKit
//
//  Created by Joel Levin on 3/3/13.
//  Copyright (c) 2013 Afterwork Studios. All rights reserved.
//

#import "ANKValueTransformations.h"


@implementation ANKValueTransformations

+ (instancetype)transformations {
	static ANKValueTransformations *transformations = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		transformations = [[ANKValueTransformations alloc] init];
	});
	return transformations;
}


- (NSDateFormatter *)dateFormatter {
	static NSDateFormatter *sharedDateFormatter = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		sharedDateFormatter = [[NSDateFormatter alloc] init];
		sharedDateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss'Z'";
		sharedDateFormatter.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"GMT"];
	});
	return sharedDateFormatter;
}


- (NSString *)NSStringFromNSConstantString:(NSString *)string {
	return string;
}


- (NSURL *)NSURLFromNSString:(NSString *)string {
	return [NSURL URLWithString:string];
}


- (NSDate *)NSDateFromNSString:(NSString *)string {
	return [[self dateFormatter] dateFromString:string];
}


- (NSArray *)NSArrayFrom__NSArrayI:(NSArray *)array {
	return array;
}


- (NSDictionary *)NSDictionaryFrom__NSDictionaryI:(NSDictionary *)dictionary {
	return dictionary;
}


- (id)JSONObjectFromNSURL:(NSURL *)URL {
	return [URL absoluteString];
}


- (id)JSONObjectFromNSDate:(NSDate *)date {
	return [[self dateFormatter] stringFromDate:date];
}


@end
