//
// Created by Ian Dundas on 15/12/14.
//

#import "UITableViewCell+Utilities.h"

@implementation UITableViewCell (Utilities)
-(UITableView*)tableView{
    // dig for tableView. Not ideal, but we have no reference to tableView at this scope, and it's sometimes handy.
    id view = [self superview];
    while (view && [view isKindOfClass:[UITableView class]] == NO) {
        view = [view superview];
    }
    return (UITableView *)view; // returns nil if not found (i.e. no superview)
}
@end