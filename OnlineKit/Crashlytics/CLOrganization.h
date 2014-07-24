//
//  CLOrganization.h
//  DTrack
//
//  Created by Dal Rupnik on 22/07/14.
//  Copyright (c) 2014 D·Labs d.o.o. All rights reserved.
//

#import "JSONModel.h"

@interface CLOrganization : JSONModel

@property (nonatomic, strong) NSString<Optional>* id;
@property (nonatomic, strong) NSNumber<Optional>* accountsCount;
@property (nonatomic, strong) NSString<Optional>* alias;
@property (nonatomic, strong) NSString<Optional>* api_key;
@property (nonatomic, strong) NSDictionary<Optional>* apps_counts;
@property (nonatomic, strong) NSString<Optional>* build_secret;
@property (nonatomic, strong) NSDictionary<Optional>* enrollments;
@property (nonatomic, strong) NSString<Optional>* name;

@end
