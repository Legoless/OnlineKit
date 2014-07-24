//
//  CLFilter.h
//  DTrack
//
//  Created by Dal Rupnik on 22/07/14.
//  Copyright (c) 2014 D·Labs d.o.o. All rights reserved.
//

#import "JSONModel.h"

@interface CLFilter : JSONModel

@property (nonatomic, strong) NSNumber* issueNewerThen;
@property (nonatomic, strong) NSNumber* issueOlderThen;
@property (nonatomic, strong) NSString* issueStatus;

@end
