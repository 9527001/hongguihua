//
//  Aspect-UIViewController.c
//  XYFrameWork
//
//  Created by xiaoyao on 16/5/10.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import <UIKit/UIKit.h>

// -----------------------------------------------------------------------------
#define AtAspect DeallocTracker
// -----------------------------------------------------------------------------

#define AtAspectOfClass UIViewController
@classPatchField(UIViewController)
//- (void)viewWillAppear:(BOOL)animated;
AspectPatch(-, void, viewWillAppear:(BOOL)animated)
{
    
//    [[SDImageCache sharedImageCache] setValue:nil forKey:@"memCache"];
    XAMessageForwardDirectly(viewWillAppear:animated);
}



@end