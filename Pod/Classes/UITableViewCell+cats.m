//
// Created by Ian Dundas on 15/12/14.
//

#import "UITableViewCell+Utilities.h"

@implementation UITableViewCell (Utilities)
-(UITableView*)tableView{
    return [self superviewWithClass:UITableView.class];
}
-(NSIndexPath*)indexPath{
    return [self.tableView indexPathForCell:self];
}
@end