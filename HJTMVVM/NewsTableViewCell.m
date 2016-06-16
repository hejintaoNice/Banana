//
//  NewsTableViewCell.m
//  HJTMVVM
//
//  Created by Heige on 16/6/16.
//  Copyright © 2016年 Heige. All rights reserved.
//

#import "NewsTableViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
@implementation NewsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _img.contentMode = UIViewContentModeScaleAspectFill;
    _img.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    _img.clipsToBounds = YES;
}

-(void)setModelWithData:(WXNewsList *)data{
    [_img sd_setImageWithURL:[NSURL  URLWithString:[NSString stringWithFormat:@"%@",data.firstImg]] placeholderImage:[UIImage imageNamed:@"PlaceHolderImg"]];
    _title.text = data.title;
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
