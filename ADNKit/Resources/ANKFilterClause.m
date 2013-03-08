//
//  ADNFilterClause.m
//  ADNKit
//
//  Created by Joel Levin on 3/7/13.
//  Copyright (c) 2013 Afterwork Studios. All rights reserved.
//

#import "ANKFilterClause.h"


@implementation ANKFilterClause

+ (NSDictionary *)JSONToLocalKeyMapping {
	return [[super JSONToLocalKeyMapping] ank_dictionaryByAppendingDictionary:@{@"object_type": @"objectType"}];
}


- (ADNFilterClauseOperator)clauseOperator {
	static NSDictionary *operatorMapping = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		operatorMapping = [@{@"equals": @(ADNFilterClauseOperatorEquals), @"matches": @(ADNFilterClauseOperatorMatches), @"lt": @(ADNFilterClauseOperatorLessThan), @"le": @(ADNFilterClauseOperatorLessThanOrEquals), @"gt": @(ADNFilterClauseOperatorGreaterThan), @"ge": @(ADNFilterClauseOperatorGreaterThanOrEquals), @"one_of": @(ADNFilterClauseOperatorOneOf)} copy];
	});
	return (ADNFilterClauseOperator)[operatorMapping[self.operatorString] unsignedIntegerValue];
}


@end
