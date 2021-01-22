//
//  Photo.m
//  ZayBanTest
//
//  Created by Ko Ko Aye on 11/01/2021.
//

#import "Photo.h"

@interface Photo()

@property (nonatomic , strong) NSString *identifier;
@property (nonatomic , strong) NSURL *imageURL;
    
@end

@implementation Photo

- (instancetype)initWithIdentifier:(NSString *)aId _url:(NSString *)url{
    self = [super init];
    if(self){
        _identifier = aId;
        _imageURL = [NSURL URLWithString:url];
        NSLog(@"Photo %@ ", _identifier);
    }
    return self;
}

@end
