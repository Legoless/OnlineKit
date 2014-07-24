//
// Created by Dal Rupnik on 15/07/14.
// Copyright (c) 2014 D·Labs d.o.o. All rights reserved.
//

#import <JSONModel/JSONModel.h>

#import <AuthKit/AKGitHubUser.h>

#import "GHKPermissions.h"

@interface GHKRepository : JSONModel

@property (nonatomic) NSInteger id;
@property (nonatomic, strong) AKGitHubUser *owner;
@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSString* full_name;
@property (nonatomic, strong) NSString* description;
@property (nonatomic) BOOL private;
@property (nonatomic) BOOL fork;
@property (nonatomic, strong) NSString* url;
@property (nonatomic, strong) NSString* html_url;
@property (nonatomic, strong) NSString* clone_url;
@property (nonatomic, strong) NSString* git_url;
@property (nonatomic, strong) NSString* ssh_url;
@property (nonatomic, strong) NSString* svn_url;
@property (nonatomic, strong) NSString<Optional>* mirror_url;
@property (nonatomic, strong) NSString<Optional>* homepage;
@property (nonatomic, strong) NSString<Optional>* language;
@property (nonatomic) NSInteger forks_count;
@property (nonatomic) NSInteger stargazers_count;
@property (nonatomic) NSInteger watchers_count;
@property (nonatomic) double size;
@property (nonatomic, strong) NSString* default_branch;
@property (nonatomic) NSInteger open_issues_count;
@property (nonatomic) BOOL has_issues;
@property (nonatomic) BOOL has_wiki;
@property (nonatomic) BOOL has_downloads;
@property (nonatomic, strong) NSDate* pushed_at;
@property (nonatomic, strong) NSDate* created_at;
@property (nonatomic, strong) NSDate* updated_at;
@property (nonatomic, strong) GHKPermissions *permissions;


@end