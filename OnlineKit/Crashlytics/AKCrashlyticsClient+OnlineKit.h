#import <AuthKit/AKCrashlytics.h>

#import "CLApplication.h"
#import "CLBuild.h"
#import "CLFilter.h"
#import "CLIssue.h"
#import "CLOrganization.h"
#import "CLSession.h"

@interface AKCrashlyticsClient (OnlineKit)

- (void)organizationsWithSuccess:(void (^)(NSArray* organizations))success failure:(AKFailureBlock)failure;

- (void)applicationsForOrganizationId:(NSString *)organizationId success:(void (^)(NSArray* applications))success failure:(AKFailureBlock)failure;

- (void)buildsForApplicationId:(NSString *)applicationId organizationId:(NSString *)organizationId success:(void (^)(NSArray* builds))success failure:(AKFailureBlock)failure;

- (void)enableReportCollectionForBuildId:(NSString *)buildId applicationId:(NSString *)applicationId organizationId:(NSString *)organizationId success:(void (^)())success failure:(AKFailureBlock)failure;

- (void)disableReportCollectionForBuildId:(NSString *)buildId applicationId:(NSString *)applicationId organizationId:(NSString *)organizationId success:(void (^)())success failure:(AKFailureBlock)failure;

- (void)issuesForApplicationId:(NSString *)applicationId organizationId:(NSString *)organizationId success:(void (^)(NSArray* issues))success failure:(AKFailureBlock)failure;

- (void)latestIncidentForIssueId:(NSString *)issueId applicationId:(NSString *)applicationId organizationId:(NSString *)organizationId success:(void (^)(CLIssue* issue))success failure:(AKFailureBlock)failure;

- (void)detailsForIssueId:(NSString *)issueId latestIncidentId:(NSString *)latestIncidentId applicationId:(NSString *)applicationId organizationId:(NSString *)organizationId success:(void (^)(CLSession* session))success failure:(AKFailureBlock)failure;

- (void)resolveIssueId:(NSString *)issueId applicationId:(NSString *)applicationId organizationId:(NSString *)organizationId success:(void (^)())success failure:(AKFailureBlock)failure;

- (void)unresolveIssueId:(NSString *)issueId applicationId:(NSString *)applicationId organizationId:(NSString *)organizationId success:(void (^)())success failure:(AKFailureBlock)failure;

@end

/*!
 * Category adds convenience methods
 */
@interface AKCrashlyticsClient (OnlineKitModel)

@end