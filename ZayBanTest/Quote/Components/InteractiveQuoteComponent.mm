//
//  InteractiveQuoteComponent.m
//  ZayBanTest
//
//  Created by Ko Ko Aye on 22/01/2021.
//

#import "InteractiveQuoteComponent.h"

#import <ComponentKit/CKComponentSubclass.h>
#import <ComponentKit/FlexboxComponentBuilder.h>
#import <ComponentKit/CKOverlayLayoutComponent.h>

#import "Quote.h"
#import "QuoteContext.h"
#import "SuccessIndicatorComponent.h"

static NSString *const oscarWilde = @"Oscar Wilde";

@implementation InteractiveQuoteComponent{
    CKComponent *_overlay;
}

+ (instancetype)newWithQuote:(Quote *)quote context:(QuoteContext *)context
{
    CKComponentScope scope(self);
    const BOOL revealAnswer = [scope.state() boolValue];
    
    CKComponent *overlay = revealAnswer
    ? [SuccessIndicatorComponent
       newWithIndicatesSuccess:[quote.author isEqualToString:oscarWilde] successText:[NSString stringWithFormat:@"This quote is by %@ " , oscarWilde] failureText:[NSString stringWithFormat:@"This quote isn't by %@", oscarWilde]]
    : nil;
    
    CKComponent *flexComponent = CK::FlexboxComponentBuilder()
    .view({[UIView class] , {CKComponentTapGestureAttribute(@selector(didTap))}})
    .alignItems(CKFlexboxAlignItemsStretch)
    .children({})
    .build();
    
    InteractiveQuoteComponent *c = [super newWithComponent:flexComponent];
    if(c){
        c->_overlay = overlay;
    }
    return c;
    
}

+(id)initialState
{
    return @NO;
}

-(void) didTap
{
    [self updateState:^(NSNumber *oldState){
        return [oldState boolValue] ? @NO : @YES;
    } mode:CKUpdateModeSynchronous];
}

@end
