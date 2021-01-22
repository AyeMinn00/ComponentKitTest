//
//  ChoiceData.h
//  ZayBanTest
//
//  Created by Ko Ko Aye on 17/01/2021.
//



@interface ChoiceData : JSONModel

@property (nonatomic) NSInteger id;
@property (nonatomic) NSString *name;
@property (nonatomic, strong) NSString *mmName;

@end

@implementation ChoiceData

+ (JSONKeyMapper *)keyMapper{
    return [JSONKeyMapper mapperForSnakeCase];
}

@end

@protocol ChoiceData

@end


