//
// Created by Dal Rupnik on 15/07/14.
// Copyright (c) 2014 D·Labs d.o.o. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface GHKPermissions : JSONModel

@property (nonatomic) BOOL admin;
@property (nonatomic) BOOL push;
@property (nonatomic) BOOL pull;
@end