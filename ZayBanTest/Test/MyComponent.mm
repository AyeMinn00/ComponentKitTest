//
//  MyComponent.m
//  ZayBanTest
//
//  Created by Ko Ko Aye on 12/01/2021.
//

#import "MyComponent.h"

@implementation MyComponent

+ (id)initialState {
	return @NO;
}

+ (instancetype)newWithModel:(NSString *)name action:(const CKAction<UIGestureRecognizer *> &)action {

	CKComponentScope scope(self);
	NSNumber *state = scope.state();

	CKLabelComponent *labelComponent = [CKLabelComponent
	                                    newWithLabelAttributes:
                                        {
                                            .string = name,
                                            .color = [state boolValue] ? [UIColor blackColor] : [UIColor redColor],
                                            .font = [UIFont systemFontOfSize:47],
                                            .alignment = NSTextAlignmentLeft,
                                            .shadowColor = [UIColor grayColor],
                                            .shadowOffset = { .width = 4 , .height = 8}
                                        }
	                                    viewAttributes:
                                        {
                                            {@selector(setBackgroundColor:),[UIColor whiteColor]},
                                            {CKComponentTapGestureAttribute(@selector(didTap))}
                                        }
	                                    size:{.maxWidth = 370}];

	CKComponent *containerComponent = [CKFlexboxComponent
	                                   newWithView:{ }
	                                   size:{}
	                                   style:{}
	                                   children:{{labelComponent}}];
//    return [self newWithComponent:containerComponent];
	return [self newWithComponent:containerComponent];
}

- (void) didTap {
	NSLog(@"didTap");
    
}


@end
