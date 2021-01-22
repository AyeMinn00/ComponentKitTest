//
//  NetworkManager.h
//  ZayBanTest
//
//  Created by Ko Ko Aye on 16/01/2021.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^NetworkManagerSuccess)(id responseObject);
typedef void (^NetworkManagerFailure)(NSString *failureReason, NSInteger statusCode);

@interface NetworkManager : NSObject

+ (instancetype)sharedManager;

@property(nonatomic , strong) AFHTTPSessionManager *networkingManager;

- (void) tokenCheckWithSuccess:(NetworkManagerSuccess)success failure:(NetworkManagerFailure)failure;
- (void) getJobPosts:(NetworkManagerSuccess)success failure:(NetworkManagerFailure)failure;

@end

NS_ASSUME_NONNULL_END
