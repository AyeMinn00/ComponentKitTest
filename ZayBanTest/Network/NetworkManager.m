//
//  NetworkManager.m
//  ZayBanTest
//
//  Created by Ko Ko Aye on 16/01/2021.
//

#import "NetworkManager.h"

#define BASE_URL @"http://45.77.175.222/api/job-posts/all"

@implementation NetworkManager

static NetworkManager *shared = nil;

+ (instancetype)sharedManager {
	static dispatch_once_t once;
	dispatch_once(&once, ^{
		shared = [[NetworkManager alloc] init];
	});
	return shared;
}

-(instancetype)init {
	if ((self = [super init])) {

	}
	return self;
}

-(AFHTTPSessionManager *)getNetworkingManagerWithToken:(NSString *) token {
	if(self.networkingManager == nil) {
		self.networkingManager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:BASE_URL]];
		self.networkingManager.requestSerializer = [AFJSONRequestSerializer serializer];
		self.networkingManager.securityPolicy = [AFSecurityPolicy defaultPolicy];
	}
	return self.networkingManager;
}

-(NSString *)getError:(NSError *)error {
	if(error != nil) {
		NSData *errorData = error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey];
		if(errorData  != nil ) {
			NSDictionary *responseObject = [NSJSONSerialization JSONObjectWithData: errorData options:kNilOptions error:nil];
			if (responseObject != nil && [responseObject isKindOfClass:[NSDictionary class]] && [responseObject objectForKey:@"message"] != nil && [[responseObject objectForKey:@"message"] length] > 0) {
				return [responseObject objectForKey:@"message"];
			}
		}
	}
	return @"Server Error. Please try again later";
}

- (void)tokenCheckWithSuccess:(NetworkManagerSuccess)success failure:(NetworkManagerFailure)failure {
	NSMutableDictionary *params = [NSMutableDictionary dictionary];
	id api = [self getNetworkingManagerWithToken:@""];
	[api GET:@"" parameters:params headers:nil progress:nil success:^(NSURLSessionTask *task, id responseObject){
	         if(success != nil) {
			 success(responseObject);
		 }
	 } failure:^(NSURLSessionTask *operation, NSError *err){
	         if(failure != nil && operation != nil) {
			 NSString *errorMessage = [self getError:err];
			 failure(errorMessage, ((NSHTTPURLResponse*)operation.response).statusCode);
		 }
	 }];
}

- (void)getJobPosts:(NetworkManagerSuccess)success failure:(NetworkManagerFailure)failure {
	id api = [self getNetworkingManagerWithToken:@""];
	[api POST:@"" parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) {
	         success(responseObject);
	 } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
	         failure([self getError:error], ((NSHTTPURLResponse*)task.response).statusCode);
	 }];
}

@end
