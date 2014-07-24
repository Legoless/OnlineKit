//
//  CLApplication.h
//  DTrack
//
//  Created by Dal Rupnik on 22/07/14.
//  Copyright (c) 2014 D·Labs d.o.o. All rights reserved.
//

#import "CLOrganization.h"
#import "CLFilter.h"

#import "JSONModel.h"

@interface CLApplication : JSONModel

@property (nonatomic, strong) NSString* id;
@property (nonatomic) NSInteger accounts_count;
@property (nonatomic, strong) NSNumber<Optional>* analytics_app_has_received_data;
@property (nonatomic, strong) NSString<Optional>* bundle_identifier;
@property (nonatomic) BOOL collect_analytics;
@property (nonatomic) NSInteger crashes_count;
@property (nonatomic, strong) NSString<Optional>* dashboard_url;
@property (nonatomic, strong) NSString<Optional>* icon128_url;
@property (nonatomic, strong) NSString<Optional>* icon64_url;
@property (nonatomic, strong) NSString<Optional>* icon32_url;
@property (nonatomic, strong) NSString<Optional>* icon_hash;
@property (nonatomic, strong) NSString<Optional>* icon_url;
@property (nonatomic) NSInteger impacted_devices_count;
@property (nonatomic, strong) NSString<Optional>* latest_build;
@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSString* organization_id;
@property (nonatomic, strong) NSString<Optional>* platform;
@property (nonatomic, strong) NSString<Optional>* sdk_kits;
@property (nonatomic, strong) NSString<Optional>* status;
@property (nonatomic) NSInteger unresolved_issues_count;

@end
