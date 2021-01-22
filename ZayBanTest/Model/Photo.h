//
//  Photo.h
//  ZayBanTest
//
//  Created by Ko Ko Aye on 11/01/2021.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Photo : NSObject

- (instancetype)initWithIdentifier: (NSString *)aId _url:(NSString *)url;

@property (readonly) NSString *identifier;
@property (readonly) NSURL *imageURL;


@end

NS_ASSUME_NONNULL_END
