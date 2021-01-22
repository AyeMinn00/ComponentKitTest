//
//  QuoteContext.m
//  ZayBanTest
//
//  Created by Ko Ko Aye on 21/01/2021.
//

#import "QuoteContext.h"

@implementation QuoteContext{
    NSDictionary<NSString *, UIImage *> *_images;
}

- (instancetype)initWithImageNames:(NSSet<NSString *> *)imageNames
{
    if (self = [super init]){
        _images = loadImages(imageNames);
    }
    return self;
}

- (UIImage *)imageNamed:(NSString *)imageName
{
    return _images[imageName];
}

static NSDictionary<NSString *, UIImage *>* loadImages(NSSet *imageNames)
{
    NSMutableDictionary<NSString *, UIImage *> *imageDictionary = [NSMutableDictionary new];
    for(NSString *imageName in imageNames){
        UIImage *image = [UIImage imageNamed:imageName];
        if(image){
            imageDictionary[imageName] = image;
        }
    }
    return imageDictionary;
}

@end
