//
//  Job.h
//  ZayBanTest
//
//  Created by Ko Ko Aye on 17/01/2021.
//

#import <Foundation/Foundation.h>
#import <JSONModel/JSONModel.h>

NS_ASSUME_NONNULL_BEGIN

@interface Job : JSONModel

@property (nonatomic) NSString *jobTitle ;
@property (nonatomic) NSString *logo;

@end

@protocol Job
@end

NS_ASSUME_NONNULL_END
