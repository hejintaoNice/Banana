//
//  NewsTableViewCell.h
//  HJTMVVM
//
//  Created by Heige on 16/6/16.
//  Copyright © 2016年 Heige. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WXNewsList.h"
@interface NewsTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *img;
@property (weak, nonatomic) IBOutlet UILabel *title;
-(void)setModelWithData:(WXNewsList*)data;
@end
