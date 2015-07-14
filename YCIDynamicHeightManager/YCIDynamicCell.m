//
//  YCIDynamicCell.m
//  YCIDynamicHeightManager
//
//  Created by yanchen on 15/7/14.
//  Copyright (c) 2015年 yanchen. All rights reserved.
//

#import "YCIDynamicCell.h"

@interface YCIDynamicCell ()

@property (weak, nonatomic) IBOutlet UILabel *lb;

@property (nonatomic, strong) YCIDynamicModel *model;

@end

@implementation YCIDynamicCell

#pragma mark - YCICellDynamicHeightManagerDelegate

- (void)setUpPreferredWidth{
    _lb.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width -90;
}

- (void)bindDataWithModel:(YCIDynamicModel *)model{
    _lb.text = model.title;
}

- (void)saveCellHeight:(CGFloat)height{
    _model.cellHeight = height;
}

- (CGFloat)getCellHeight{
    return _model.cellHeight;
}


@end
