//
//  TimNavigationBarMenuView.m
//  CRM
//
//  Created by TimTiger on 6/6/14.
//  Copyright (c) 2014 TimTiger. All rights reserved.
//

#import "MudNavigationBarMenuView.h"
#import "UIColor+Extension.h"

@interface MudNavigationBarMenuView () <UITableViewDelegate,UITableViewDataSource,UIAlertViewDelegate>

@property (nonatomic,retain) UITableView *tableView;

@end

@implementation MudNavigationBarMenuView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //Initialization code
        [self setupView];
    }
    return self;
}

- (void)setupView {
    
}

- (void)layoutSubviews {
    if (self.tableView == nil)  {
        _tableView = [[UITableView alloc]initWithFrame:self.bounds style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [_tableView setSeparatorColor:[UIColor whiteColor]];
        _tableView.backgroundColor = [UIColor colorWithHex:0x01567f];
        [_tableView setScrollEnabled:NO];
        [self addSubview:_tableView];
        self.layer.shadowColor = [[UIColor blackColor]CGColor];
        self.layer.shadowOffset = CGSizeMake(3,3);
    }
    [super layoutSubviews];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.menuArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        UIView *viewBG = [[UIView alloc]initWithFrame:CGRectMake(0, 0,tableView.bounds.size.width, 40)];
        viewBG.backgroundColor = [UIColor colorWithHex:0x3f67bf];
        cell.backgroundView = viewBG;
        cell.textLabel.textColor = [UIColor whiteColor];
    }
    cell.textLabel.text = [self.menuArray objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath  {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (self.delegate && [self.delegate respondsToSelector:@selector(menuView:clickedButtonAtIndex:)]) {
        [self.delegate menuView:tableView clickedButtonAtIndex:indexPath.row];
    }
    self.hidden = YES;
}

@end
