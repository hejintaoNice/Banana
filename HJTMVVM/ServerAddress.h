//
//  ServerAddress.h
//  HJTMVVM
//
//  Created by Heige on 16/6/16.
//  Copyright © 2016年 Heige. All rights reserved.
//

#ifndef ServerAddress_h
#define ServerAddress_h


#define NetworkServer   @"http://v.juhe.cn"


#define GetWxNews    @"/weixin/query?key=ec4aeeaed34845de98a611d87534001f"

//---------------------------SVProgressHUD--------
//#define SHOW_ERROR [SVProgressHUD showErrorWithStatus:[NSString stringWithFormat:@"%@",[[responseObject objectForKey:@"msg"] isEqual:[NSNull null]] ? @"不好意思，出错啦-.-" : [responseObject objectForKey:@"msg"]] maskType:SVProgressHUDMaskTypeGradient];
#define SHOW_ERROR [SVProgressHUD showErrorWithStatus:@"出错了"];
#define SHOW_NTERROR [SVProgressHUD showErrorWithStatus:@"网络在开小差哦~\(≧▽≦)/~"];
#define SHOW_STATUS [SVProgressHUD showWithStatus:@"请稍等..." maskType:SVProgressHUDMaskTypeGradient];
#define SHOW_HIDDEN [SVProgressHUD dismiss];

#endif /* ServerAddress_h */
