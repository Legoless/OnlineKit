#import "AFHTTPRequestOperationManager+OnlineKit.h"

#import "AKCrashlyticsClient+OnlineKit.h"

@implementation AKCrashlyticsClient (OnlineKit)

- (void)organizationsWithSuccess:(void (^)(NSArray* organizations))success failure:(AKFailureBlock)failure
{
    [self.manager requestClass:[CLOrganization class] withPath:@"organizations" HTTPMethod:@"GET" parameters:nil success:success failure:failure];
}

- (void)applicationsForOrganizationId:(NSString *)organizationId success:(void (^)(NSArray* applications))success failure:(AKFailureBlock)failure
{
    [self.manager requestClass:[CLApplication class] withPath:[NSString stringWithFormat:@"organizations/%@/apps", organizationId] HTTPMethod:@"GET" parameters:nil success:success failure:failure];
}

- (void)buildsForApplicationId:(NSString *)applicationId organizationId:(NSString *)organizationId success:(void (^)(NSArray* builds))success failure:(AKFailureBlock)failure
{
    [self.manager requestClass:[CLBuild class] withPath:[NSString stringWithFormat:@"organizations/%@/apps/%@/builds", organizationId, applicationId] HTTPMethod:@"GET" parameters:nil success:success failure:failure];
}

- (void)enableReportCollectionForBuildId:(NSString *)buildId applicationId:(NSString *)applicationId organizationId:(NSString *)organizationId success:(void (^)())success failure:(AKFailureBlock)failure
{
    [self.manager requestClass:nil withPath:[NSString stringWithFormat:@"organizations/%@/apps/%@", organizationId, applicationId] HTTPMethod:@"POST" parameters:@{ @"build_opts" : @{ buildId : @{ @"collect_crash_reports" : @YES } } } success:success failure:failure];
}

- (void)disableReportCollectionForBuildId:(NSString *)buildId applicationId:(NSString *)applicationId organizationId:(NSString *)organizationId success:(void (^)())success failure:(AKFailureBlock)failure
{
    [self.manager requestClass:nil withPath:[NSString stringWithFormat:@"organizations/%@/apps/%@", organizationId, applicationId] HTTPMethod:@"POST" parameters:@{ @"build_opts" : @{ buildId : @{ @"collect_crash_reports" : @NO } } } success:success failure:failure];
}

- (void)issuesForApplicationId:(NSString *)applicationId organizationId:(NSString *)organizationId success:(void (^)(NSArray* issues))success failure:(AKFailureBlock)failure
{
    [self.manager requestClass:[CLIssue class] withPath:[NSString stringWithFormat:@"organizations/%@/apps/%@/issues.json", organizationId, applicationId] HTTPMethod:@"GET" parameters:nil success:success failure:failure];
}

- (void)latestIncidentForIssueId:(NSString *)issueId applicationId:(NSString *)applicationId organizationId:(NSString *)organizationId success:(void (^)(CLIssue* issue))success failure:(AKFailureBlock)failure
{
    [self.manager requestClass:[CLIssue class] withPath:[NSString stringWithFormat:@"organizations/%@/apps/%@/issues/%@", organizationId, applicationId, issueId] HTTPMethod:@"GET" parameters:nil success:success failure:failure];
}

- (void)detailsForIssueId:(NSString *)issueId latestIncidentId:(NSString *)latestIncidentId applicationId:(NSString *)applicationId organizationId:(NSString *)organizationId success:(void (^)(CLSession* session))success failure:(AKFailureBlock)failure
{
    AFHTTPRequestOperationManager* manager = self.managerCopy;
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"application/octet-stream"];

    //
    // TODO: This is raw data of a specific crash session, this should be serialized using another object
    //
    [manager requestClass:[CLSession class] withPath:[NSString stringWithFormat:@"organizations/%@/apps/%@/issues/%@/clsessions/%@", organizationId, applicationId, issueId, latestIncidentId] HTTPMethod:@"GET" parameters:nil success:success failure:failure];
}

- (void)resolveIssueId:(NSString *)issueId applicationId:(NSString *)applicationId organizationId:(NSString *)organizationId success:(void (^)())success failure:(AKFailureBlock)failure
{
    [self.manager requestClass:[CLApplication class] withPath:[NSString stringWithFormat:@"organizations/%@/apps/%@/issues/%@", organizationId, applicationId, issueId] HTTPMethod:@"PUT" parameters:@{ @"resolved_at" : [NSDate date] } success:success failure:failure];
}

- (void)unresolveIssueId:(NSString *)issueId applicationId:(NSString *)applicationId organizationId:(NSString *)organizationId success:(void (^)())success failure:(AKFailureBlock)failure
{
    [self.manager requestClass:[CLApplication class] withPath:[NSString stringWithFormat:@"organizations/%@/apps/%@/issues/%@", organizationId, applicationId, issueId] HTTPMethod:@"PUT" parameters:@{ @"resolved_at" : [NSNull null] } success:success failure:failure];
}



@end
