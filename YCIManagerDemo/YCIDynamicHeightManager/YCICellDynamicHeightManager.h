//
//  YCICellDynamicHeightManager.h
//  JianHuo
//
//  Created by yanchen on 15/7/13.
//  Copyright (c) 2015年 易达正丰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol YCICellDynamicHeightManagerDelegate <NSObject>

@required
//配置宽度
- (void)setUpPreferredWidth;
//根据model刷新UI
- (void)bindDataWithModel:(NSObject *)model;

//保存/获取高度信息,建议保存在model中
- (void)saveCellHeight:(CGFloat)height;
- (CGFloat)getCellHeight;

@end

/**
 仅支持autolayout布局的cell,必须遵守<YCICellDynamicHeightManagerDelegate>
 */
@interface YCICellDynamicHeightManager : NSObject

/**
 *  注: cell必须遵守协议<YCICellDynamicHeightManagerDelegate>
 */
- (instancetype)initWithCellClass:(Class)aClass;
- (instancetype)initWithCell:(UITableViewCell<YCICellDynamicHeightManagerDelegate> *)aCell;

/**
 *  计算高度,已包含对 获取/存储 高度信息的处理
 */
- (CGFloat)cellHeightWithModel:(NSObject *)model;

@end
