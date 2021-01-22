//
//  FilterData.h
//  ZayBanTest
//
//  Created by Ko Ko Aye on 17/01/2021.
//

#import <JSONModel/JSONModel.h>
#import "ChoiceData.h"


@interface FilterData : JSONModel

@property (nonatomic) NSArray<ChoiceData> *location;

@end

@implementation FilterData



@end
