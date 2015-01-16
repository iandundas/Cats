//
// Created by Ian Dundas on 15/12/14.
//

#import <Foundation/Foundation.h>

@interface UITableViewCell (Utilities)
// searches through superview stack to find containing tableView (if it exists)
-(UITableView*)tableView;
// determines the indexPath that the cell is currently at in it's container tableView
-(NSIndexPath*)indexPath;
@end