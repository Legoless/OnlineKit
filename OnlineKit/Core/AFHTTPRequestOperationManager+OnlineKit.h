//
//  AFHTTPRequestOperationManager+OnlineKit.h
//  OnlineKit
//
//  Created by Dal Rupnik on 22/07/14.
//  Copyright (c) 2014 arvystate.net. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

/*!
 * Adds convenience methods to enable fast development of OnlineKit services
 */
@interface AFHTTPRequestOperationManager (OnlineKit)

/*!
 * This method automatically serializes object on path to corresponding JSONModel class
 */
- (void)requestClass:(Class)class withPath:(NSString *)path HTTPMethod:(NSString *)method parameters:(NSDictionary *)parameters success:(id)successBlock failure:(id)failureBlock;

@end