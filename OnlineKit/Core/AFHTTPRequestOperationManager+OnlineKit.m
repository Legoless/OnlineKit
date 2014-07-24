//
//  AFHTTPRequestOperationManager+OnlineKit.m
//  OnlineKit
//
//  Created by Dal Rupnik on 22/07/14.
//  Copyright (c) 2014 arvystate.net. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import <JSONModel/JSONModel.h>

#import "AFHTTPRequestOperationManager+OnlineKit.h"
#import "AKCore.h"

@implementation AFHTTPRequestOperationManager (OnlineKit)

- (void)requestClass:(Class)class withPath:(NSString *)path HTTPMethod:(NSString *)method parameters:(NSDictionary *)parameters success:(id)successBlock failure:(id)failureBlock
{
    //
    // Define AFNetworking blocks
    //
    void (^success)(AFHTTPRequestOperation *operation, id responseObject) = ^(AFHTTPRequestOperation *operation, id responseObject)
    {
        [self handleSuccessWithOperation:operation class:class successBlock:successBlock failureBlock:failureBlock];
    };
    
    void (^failure)(AFHTTPRequestOperation *operation, NSError *error) = ^(AFHTTPRequestOperation *operation, NSError *error)
    {
        [self handleFailureWithOperation:operation error:error failureBlock:failureBlock];
    };
    
    //
    // Call correct methods
    //
    
    if ([method isEqualToString:@"GET"])
    {
        [self GET:path parameters:parameters success:success failure:failure];
    }
    else if ([method isEqualToString:@"HEAD"])
    {
        [self HEAD:path parameters:parameters success:^(AFHTTPRequestOperation* operation)
        {
            [self handleSuccessWithOperation:operation class:class successBlock:successBlock failureBlock:failureBlock];
        }
        failure:failure];
    }
    else if ([method isEqualToString:@"PUT"])
    {
        [self POST:path parameters:parameters success:success failure:failure];
    }
    else if ([method isEqualToString:@"POST"])
    {
        [self PUT:path parameters:parameters success:success failure:failure];
    }
    else if ([method isEqualToString:@"PATCH"])
    {
        [self PATCH:path parameters:parameters success:success failure:failure];
    }
    else if ([method isEqualToString:@"DELETE"])
    {
        [self DELETE:path parameters:parameters success:success failure:failure];
    }
}

- (void)handleSuccessWithOperation:(AFHTTPRequestOperation *)operation class:(Class)class successBlock:(id)successBlock failureBlock:(id)failureBlock
{
    //
    // Nothing happens if success block is missing
    //
    if (!successBlock)
    {
        return;
    }
    
    id responseObject = operation.responseObject;
    
    if (class && [[class alloc] isKindOfClass:[JSONModel class]])
    {
        //
        // We will attempt to serialize the object in multiple ways using our magic method
        //
        
        NSError* error;
        
        responseObject = [self serializeObject:operation.responseObject toClass:class withMaxDepth:1 error:&error];
        
        if (error)
        {
            [self handleFailureWithOperation:operation error:error failureBlock:failureBlock];
            
            return;
        }
    }
    
    //
    // Call success block
    //
    
    if (class)
    {
        void (^ success)(id responseObject) = successBlock;
        
        success (responseObject);
    }
    else
    {
        void (^ success)() = successBlock;
        
        success ();
    }
}


- (void)handleFailureWithOperation:(AFHTTPRequestOperation *)operation error:(NSError *)error failureBlock:(id)failureBlock
{
    //
    // Do nothing if no failure block is defined
    //
    if (!failureBlock)
    {
        return;
    }
    
    if (error)
    {
        AKFailureBlock failure = failureBlock;
        
        failure (operation.responseObject ? operation.responseObject : operation.responseString, error);
    }
}

/*!
 * This method will magically convert object
 */
- (id)serializeObject:(id)object toClass:(Class)class withMaxDepth:(NSInteger)maxDepth error:(NSError **)error
{
    if (!object)
    {
        return nil;
    }
    
    //
    // First try to serialize into array of objects
    //
    
    if ([object isKindOfClass:[NSArray class]])
    {
        NSArray* objectArray = [class arrayOfModelsFromDictionaries:object error:error];
        
        if (*error)
        {
            return nil;
        }
        else
        {
            return objectArray;
        }
    }
    else if ([object isKindOfClass:[NSDictionary class]])
    {
        //
        // If it is a dictionary, first we try to serialize directly into self
        //
        
        id serializedObject = [[class alloc] initWithDictionary:object error:error];
        
        //
        // If we have an error, the object might be in one of the dictionary keys, so we go lower in depth
        //
        if (*error)
        {
            if (maxDepth <= 0)
            {
                return nil;
            }

            for (id key in object)
            {
                NSError* err;
                
                id serializationAttempt = [self serializeObject:object[key] toClass:class withMaxDepth:maxDepth - 1 error:&err];
                
                if (!err)
                {
                    return serializationAttempt;
                }
            }
            
            return nil;
        }
        else
        {
            return serializedObject;
        }
    
    }
    
    return nil;
}

@end