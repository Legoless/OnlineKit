//
//  CLIssue.h
//  DTrack
//
//  Created by Dal Rupnik on 22/07/14.
//  Copyright (c) 2014 D·Labs d.o.o. All rights reserved.
//

#import "JSONModel.h"

@interface CLIssue : JSONModel

@property (nonatomic, strong) NSString* id;

@property (nonatomic, strong) NSNumber<Optional>* average_free_ram;
@property (nonatomic, strong) NSNumber<Optional>* average_free_space;
@property (nonatomic, strong) NSString<Optional>* build;
@property (nonatomic) NSInteger crashes_count;
@property (nonatomic, strong) NSString<Optional>* display_id;
@property (nonatomic) NSInteger event_type;
@property (nonatomic) double impact_level;
@property (nonatomic) NSInteger impacted_devices_count;
@property (nonatomic, strong) NSString<Optional>* latest_cls_id;
@property (nonatomic) NSInteger notes_count;
@property (nonatomic, strong) NSDate<Optional>* resolved_at;
@property (nonatomic, strong) NSString<Optional>* share_url;
@property (nonatomic, strong) NSString<Optional>* shares_base_uri;
@property (nonatomic, strong) NSString<Optional>* subtitle;
@property (nonatomic, strong) NSString* title;
@property (nonatomic, strong) NSString<Optional>* suggestion;
@property (nonatomic, strong) NSString<Optional>* url;

@end
