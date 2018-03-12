//
//  DDSettingHeader.h
//  DingTalk
//
//  Created by TozyZuo on 2018/3/9.
//  Copyright © 2018年 TozyZuo. All rights reserved.
//

#ifndef DDSettingHeader_h
#define DDSettingHeader_h


@interface DTCellItem : NSObject
@property(retain, nonatomic) UIFont *titleFont;
@property(retain, nonatomic) UIColor *titleColor;
@property( copy , nonatomic) NSString *title;
@property(nonatomic) _Bool showIndicator;
@property(copy, nonatomic) void(^selectedBlock)(DTCellItem *item, UIView *cell);
@end


@interface DTSectionItem : NSObject
@property(copy, nonatomic) NSArray<DTCellItem *> *dataSource;
+ (id)itemWithSectionHeader:(id)arg1 sectionFooter:(id)arg2;
@end


@interface DTTableViewDataSource : NSObject
@property(copy, nonatomic) NSArray<DTSectionItem *> *tableViewDataSource;
@end


@interface DTTableViewHandler : NSObject
@property(retain, nonatomic) DTTableViewDataSource *dataSource;
@end


@interface DTSettingListViewController : UITableViewController
@property(retain, nonatomic) DTTableViewHandler *tableViewHandler;
- (void)tableViewReloadData;
@end


#endif /* DDSettingHeader_h */
