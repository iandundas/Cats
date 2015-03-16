//
// Created by Ian Dundas on 16/03/15
//

#import <Foundation/Foundation.h>

@interface UIImagePickerController (cats)
+ (void)obtainPermissionForMediaSourceType:(UIImagePickerControllerSourceType)sourceType withSuccessHandler:(void (^) ())successHandler andFailure:(void (^) ())failureHandler;
@end