//
//  ViewController.m
//  YCIDynamicHeightManager
//
//  Created by yanchen on 15/7/14.
//  Copyright (c) 2015年 yanchen. All rights reserved.
//

#import "ViewController.h"
#import "YCIDynamicModel.h"
#import "YCIDynamicCell.h"
#import "YCICellDynamicHeightManager.h"

#define CellId @"YCIDynamicCell"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *models;
@property (weak, nonatomic) IBOutlet UITableView *tableview;

@property (nonatomic, strong) YCICellDynamicHeightManager *dynamicManager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupCenterUI];
    [self loadData];
}

- (void)setupCenterUI{
    
    [_tableview registerNib:[UINib nibWithNibName:CellId bundle:nil] forCellReuseIdentifier:CellId];
    //创建一个Manager
    _dynamicManager = [[YCICellDynamicHeightManager alloc]initWithCellClass:[YCIDynamicCell class]];
}

//创建假数据
- (void)loadData{
    
    _models = [NSMutableArray array];
    
    for (int i = 0; i < 4; i++) {
        YCIDynamicModel *model = [[YCIDynamicModel alloc]init];
        model.title = [self randomString];
        [_models addObject:model];
    }
}

- (NSString *)randomString{
    NSString *baseStr = @"title标题word";
    for (int i = 0; i < random()%20; i++) {
        baseStr = [baseStr stringByAppendingString:baseStr];
    }
    return baseStr;
}

#pragma mark - tableView

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //用manager 测量高度
    YCIDynamicModel *model = _models[indexPath.row];
    return [_dynamicManager cellHeightWithModel:model];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _models.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    YCIDynamicCell *cell = [tableView dequeueReusableCellWithIdentifier:CellId];
    if (cell == nil) {
        cell = [[YCIDynamicCell alloc]initWithStyle:0 reuseIdentifier:CellId];
    }

    YCIDynamicModel *model = _models[indexPath.row];
    
    [cell bindDataWithModel:model];
    
    return cell;
    
}



@end
