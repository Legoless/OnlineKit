//
//  CLBuild.h
//  DTrack
//
//  Created by Dal Rupnik on 22/07/14.
//  Copyright (c) 2014 D·Labs d.o.o. All rights reserved.
//

#import "JSONModel.h"

#import "CLFilter.h"

@interface CLBuild : JSONModel

@property (nonatomic, strong) NSString* id;
@property (nonatomic) BOOL collect_crash_reports;

@end
