//
//  TableViewDelegate.m
//  HJTMVVM
//
//  Created by Heige on 16/6/16.
//  Copyright © 2016年 Heige. All rights reserved.
//

#import "TableViewDelegate.h"

@implementation TableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _cellSelectedBlock(indexPath);
}


@end
