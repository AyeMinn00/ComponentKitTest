//
//  JobList.h
//  ZayBanTest
//
//  Created by Ko Ko Aye on 17/01/2021.
//

#import <Foundation/Foundation.h>
#import <JSONModel/JSONModel.h>
#import "Job.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobList : JSONModel

@property (nonatomic) NSArray <Job> *data;

@end

NS_ASSUME_NONNULL_END
