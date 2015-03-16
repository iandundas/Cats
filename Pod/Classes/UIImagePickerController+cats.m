//
// Created by Ian Dundas on 16/03/15.
//

#import "UIImagePickerController+cats.h"
#import <AVFoundation/AVFoundation.h>
#import "Photos/Photos.h"

/* 
example usage:

[UIImagePickerController obtainPermissionForMediaSourceType:UIImagePickerControllerSourceTypePhotoLibrary withSuccessHandler:^{
        UIImagePickerController *pickerNavController = [[UIImagePickerController alloc] init];
        pickerNavController.delegate = self;
        pickerNavController.allowsEditing = NO;
        pickerNavController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;

        [self presentViewController:pickerNavController animated:YES completion:nil];

    } andFailure:^{
        UIAlertController *alertController= [UIAlertController
            alertControllerWithTitle:nil
                             message:NSLocalizedString(@"You have disabled Photos access", nil)
                      preferredStyle:UIAlertControllerStyleActionSheet];

        [alertController addAction:[UIAlertAction
            actionWithTitle:NSLocalizedString(@"Open Settings", @"Photos access denied: open the settings app to change privacy settings")
                      style:UIAlertActionStyleDefault
                    handler:^(UIAlertAction *action) {
                        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
                    }]
        ];

        [alertController addAction:[UIAlertAction
            actionWithTitle:NSLocalizedString(@"Cancel", @"Cancel")
                      style:UIAlertActionStyleDefault
                    handler:NULL]
        ];

        [self presentViewController:alertController animated:YES completion:^{}];
    }];
*/
@implementation UIImagePickerController (Additions)
+ (void)obtainPermissionForMediaSourceType:(UIImagePickerControllerSourceType)sourceType withSuccessHandler:(void (^) ())successHandler andFailure:(void (^) ())failureHandler {

    if (sourceType == UIImagePickerControllerSourceTypePhotoLibrary || sourceType == UIImagePickerControllerSourceTypeSavedPhotosAlbum){
        // Denied when photo disabled, authorized when photos is enabled. Not affected by camera
        [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
            switch (status) {
                case PHAuthorizationStatusAuthorized: {
                        if (successHandler)
                            dispatch_async (dispatch_get_main_queue (), ^{ successHandler (); });
                }; break;

                case PHAuthorizationStatusRestricted:
                case PHAuthorizationStatusDenied:{
                        if (failureHandler)
                            dispatch_async (dispatch_get_main_queue (), ^{ failureHandler (); });
                }; break;

                default:
                    break;
            }
        }];
    }
    else if (sourceType == UIImagePickerControllerSourceTypeCamera){
        // Checks for Camera access:
        AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];

        switch (status){

            case AVAuthorizationStatusAuthorized:{
                if (successHandler)
                    dispatch_async (dispatch_get_main_queue (), ^{ successHandler (); });
            }; break;

            case AVAuthorizationStatusNotDetermined:{
                // seek access first:
                [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
                    if(granted){
                        if (successHandler)
                            dispatch_async (dispatch_get_main_queue (), ^{ successHandler (); });
                    } else {
                        if (failureHandler)
                            dispatch_async (dispatch_get_main_queue (), ^{ failureHandler (); });
                    }
                }];
            }; break;

            case AVAuthorizationStatusDenied:
            case AVAuthorizationStatusRestricted:
            default:{
                if (failureHandler)
                    dispatch_async (dispatch_get_main_queue (), ^{ failureHandler (); });
            }; break;
        }
    }
    else{
        NSAssert(NO, @"Permission type not found");
    }
}
@end