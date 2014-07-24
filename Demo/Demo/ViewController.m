//
//  ViewController.m
//  Demo
//
//  Created by Dal Rupnik on 17/06/14.
//  Copyright (c) 2014 arvystate.net. All rights reserved.
//

#import <AuthKit/AKGitHub.h>
#import <AuthKit/AKCrashlytics.h>

#import <OnlineKit/OnlineKit.h>

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) AKGitHubClient* client;
@property (nonatomic, strong) AKCrashlyticsClient* crashlyticsClient;

@end

@implementation ViewController

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    self.client = [[AKGitHubClient alloc] initWithClientID:@"<YOUR_CLIENT_ID>" clientSecret:@"<YOUR_CLIENT_SECRET>" scopes:@[ AKGitHubScopeUser, AKGitHubScopeRepo ] note:@"Test"];
    
    [self.client loginWithUsername:@"<USERNAME>" password:@"<PASSWORD>" success:^(id loginDetails)
    {
        NSLog(@"SUCCESS! %@", loginDetails);
        
        NSLog(@"TOKEN: %@", self.client.accessToken);
    }
    failure:^(id responseObject, NSError *error)
    {
        NSLog(@"ERROR: %@", error);
    }];

    self.crashlyticsClient = [[AKCrashlyticsClient alloc] initWithDeveloperToken:@"<DEVELOPER_TOKEN>"];
    
    [self.crashlyticsClient loginWithUsername:@"<USERNAME>" password:@"<PASSWORD>" success:^(id loginDetails)
    {
        NSLog(@"TOKEN: %@", self.crashlyticsClient.accessToken);
        
        [self.crashlyticsClient organizationsWithSuccess:^(NSArray *organizations)
        {
            NSLog(@"SUCCESS ORGANIZATIONS: %@", organizations);
            
            for (CLOrganization* organization in organizations)
            {
                [self.crashlyticsClient applicationsForOrganizationId:organization.id success:^(NSArray *applications)
                {
                    NSLog(@"SUCCESS APPLICATIONS: %@", applications);
                    
                    CLApplication* application = [applications lastObject];
                    
                    [self.crashlyticsClient buildsForApplicationId:application.id organizationId:application.organization_id success:^(NSArray *builds)
                    {
                         NSLog(@"SUCCESS BUILDS: %@", builds);
                    }
                    failure:^(id responseObject, NSError *error)
                    {
                        NSLog(@"ERROR: %@", error);
                    }];
                    
                    [self.crashlyticsClient issuesForApplicationId:application.id organizationId:application.organization_id success:^(NSArray *issues)
                    {
                        NSLog(@"SUCCESS ISSUES: %@", issues);
                        
                        CLIssue* someIssue = [issues firstObject];
                        
                        [self.crashlyticsClient latestIncidentForIssueId:someIssue.id applicationId:application.id organizationId:application.organization_id success:^(CLIssue *issue)
                        {
                            NSLog(@"SUCCESS LATEST ISSUE: %@", issue);
                            
                            [self.crashlyticsClient detailsForIssueId:issue.id latestIncidentId:issue.latest_cls_id applicationId:application.id organizationId:application.organization_id success:^(CLSession *session)
                            {
                                NSLog(@"SUCCESS SESSION: %@", session);
                            }
                            failure:^(id responseObject, NSError *error)
                            {
                                NSLog(@"ERROR: %@", error);
                            }];
                        }
                        failure:^(id responseObject, NSError *error)
                        {
                            NSLog(@"ERROR: %@", error);
                        }];
                        
                        
                    }
                    failure:^(id responseObject, NSError *error)
                    {
                        NSLog(@"ERROR: %@", error);
                    }];
                }
                failure:^(id responseObject, NSError *error)
                {
                    NSLog(@"ERROR: %@", error);
                }];
            }
        }
        failure:^(id responseObject, NSError *error)
        {
            NSLog(@"ERROR: %@", error);
        }];
    }
    failure:^(id responseObject, NSError *error)
    {
        NSLog(@"ERROR: %@", error);
    }];
}
@end
