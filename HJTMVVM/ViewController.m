//
//  ViewController.m
//  HJTMVVM
//
//  Created by Heige on 16/6/16.
//  Copyright © 2016年 Heige. All rights reserved.
//

#import "ViewController.h"
#import <MJRefresh.h>
#import "HJTNetTool.h"
#import "CustomTool.h"
#import "TableViewDataSource.h"
#import "TableViewDelegate.h"
#import "WXNewsWXNews.h"
#import "WXNewsResult.h"
#import "WXNewsList.h"
#import "WebViewController.h"
#import "HJTClearCacheTool.h"


@interface ViewController ()
@property (strong,nonatomic)UITableView *dataTableView;
@property (strong,nonatomic)NSMutableArray *totalSource;
@property (strong,nonatomic)TableViewDataSource *tableViewDataSource;
@property (strong,nonatomic)TableViewDelegate *tableViewDelegate;
@property (assign,nonatomic)NSInteger page;
@property (strong,nonatomic)WXNewsWXNews*wxNews;
@property (nonatomic,strong)UIBarButtonItem *rightButtonItem;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self CreateTableView];
    [self configureNavBar];
    
}

-(void)configureNavBar{
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeSystem];
    rightButton.frame = CGRectMake(0, 0, 20, 20);
    [rightButton setBackgroundImage:[UIImage imageNamed:@"ClearMemory"] forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(ClearMemory) forControlEvents:UIControlEventTouchDown];
    
    self.rightButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = self.rightButtonItem;
}

-(void)CreateTableView{
    
    _page = 1;
    _totalSource = [NSMutableArray array];
    
    _dataTableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:UITableViewStylePlain];
    
    _dataTableView.estimatedRowHeight = 44.0f;
    _dataTableView.rowHeight = UITableViewAutomaticDimension;
    [self.view addSubview:_dataTableView];
    
    [_dataTableView registerNib:[UINib nibWithNibName:@"NewsTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"NewsCell"];
    
    _tableViewDataSource=[[TableViewDataSource alloc] init];
    _tableViewDelegate=[[TableViewDelegate alloc] init];
    _dataTableView.dataSource=_tableViewDataSource;
    _dataTableView.delegate=_tableViewDelegate;
    
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoredata)];
    
    _dataTableView.mj_header = header;
    _dataTableView.mj_footer = footer;
    
    [_dataTableView.mj_header beginRefreshing];
    
    
}

-(void)loadNewData{
    [self getDataWithHead:YES];
}

-(void)loadMoredata{
    [self getDataWithHead:NO];
}


-(void)getDataWithHead:(BOOL)isHead{
    if (isHead) {
        _page = 1;
    }else{
        if (_page < 2) {
            _page = 2;
        }
    }
    [HJTNetTool get:GetWxNews progress:^(NSProgress * _Nonnull progress) {
        
    } success:^(id  _Nonnull responseObject) {
        if ([[responseObject objectForKey:@"error_code"] integerValue] != 0) {
            SHOW_ERROR
        }else{
            _wxNews = [[WXNewsWXNews alloc]initWithDictionary:responseObject];
            if (_wxNews.result.list) {
                if (isHead) {
                    [_totalSource removeAllObjects];
                }else{
                    _page ++;
                }
            _totalSource = [_wxNews.result.list mutableCopy];
            _tableViewDataSource.array = _totalSource;
            _tableViewDelegate.array = _totalSource;
            WS
            _tableViewDelegate.cellSelectedBlock = ^(id obj){
            SS
                [strongSelf cellSelectedWithObj:(id)obj];
                };
                
            }
            [_dataTableView reloadData];
        }
        
        if (isHead) {
            [_dataTableView.mj_header endRefreshing];
        }else{
            dispatch_async(dispatch_get_main_queue(), ^{
                [_dataTableView.mj_footer endRefreshing];
                
            });
        }
        
    } failure:^(NSString * _Nonnull errorLD) {
        SHOW_NTERROR
        if (isHead) {
            [_dataTableView.mj_header endRefreshing];
        }else{
            dispatch_async(dispatch_get_main_queue(), ^{
                [_dataTableView.mj_footer endRefreshing];
                
            });
        }
    }];
}

- (void)cellSelectedWithObj:(id)obj
{
    NSIndexPath *indexPath = obj;
    WebViewController*webVC = [WebViewController new];
    WXNewsList*wxNewsList = _totalSource[indexPath.row];
    webVC.url = wxNewsList.url;
    [self.navigationController pushViewController:webVC animated:YES];
}

-(void)ClearMemory{
    float fileSize = [HJTClearCacheTool folderSizeAtPath];
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:[NSString stringWithFormat:@"缓存大小%.2fM确定清除么?",fileSize] message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    //创建一个取消和一个确定按钮
    UIAlertAction *actionCancle=[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    //因为需要点击确定按钮后改变文字的值，所以需要在确定按钮这个block里面进行相应的操作
    UIAlertAction *actionOk=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        //清楚缓存
        [HJTClearCacheTool cleanCache:^{
            [SVProgressHUD showSuccessWithStatus:@"清除成功"];
        }];
    }];
    //将取消和确定按钮添加进弹框控制器
    [alert addAction:actionCancle];
    [alert addAction:actionOk];
    //显示弹框控制器
    [self presentViewController:alert animated:YES completion:nil];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
