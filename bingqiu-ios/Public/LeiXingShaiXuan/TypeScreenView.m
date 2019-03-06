//
//  TypeScreenView.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/12/7.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "TypeScreenView.h"
#import "TypeScreenTableViewCell.h"

@interface TypeScreenView()
{
    NSArray *arr;
    NSArray *typeArr;
}
@end

@implementation TypeScreenView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addSubview:self.typeScreenTbv];
        [self creatTwoBtn];
        
    }
    return self;
}

#pragma mark ---- 创建表格 ----
-(UITableView *)typeScreenTbv{
    if (!_typeScreenTbv) {
        _typeScreenTbv = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, 277) style:UITableViewStylePlain];
        _typeScreenTbv.delegate = self;
        _typeScreenTbv.dataSource = self;
        _typeScreenTbv.separatorStyle = NO;
    }
    return _typeScreenTbv;
}
#pragma mark --- 代理和数据源方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 6;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static  NSString  *ss = @"TypeScreenTableViewCell";
    TypeScreenTableViewCell *typeCell = [tableView dequeueReusableCellWithIdentifier:ss];
    if (!typeCell) {
        typeCell = [[TypeScreenTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ss];
    }
    typeCell.selectionStyle = UITableViewCellSelectionStyleNone;
//    else{
//        while ([typeCell.contentView.subviews lastObject] != nil){
//            [(UIView *)[typeCell.contentView.subviews lastObject] removeFromSuperview];
//        }
//    }
    arr = @[@"全年",@"充值",@"购卡",@"消费",@"退款",@"上课"];
    typeArr = @[@"",@"RECHARGE",@"BUY_CARD",@"CONSUMPTION",@"REFUND",@"CLASS"];
    typeCell.titLab.text = arr[indexPath.row];
    
    
    if (self.selIndex == 0 && indexPath.row == 0) {
        [typeCell.yesBtn setImage:[UIImage imageNamed:@"icon_datewindow_state_select"] forState:UIControlStateNormal];
        typeCell.titLab.textColor = [UIColor colorWithHexString:@"#188bf0"];
        typeCell.backgroundColor = [UIColor colorWithHexString:@"#f2f2f2"];
    }else if (self.selIndex == indexPath){
        [typeCell.yesBtn setImage:[UIImage imageNamed:@"icon_datewindow_state_select"] forState:UIControlStateNormal];
        typeCell.titLab.textColor = [UIColor colorWithHexString:@"#188bf0"];
        typeCell.backgroundColor = [UIColor colorWithHexString:@"#f2f2f2"];
    }else{
        [typeCell.yesBtn setImage:[UIImage imageNamed:@"icon_datewindow_state_regular"] forState:UIControlStateNormal];
        typeCell.titLab.textColor = [UIColor colorWithHexString:@"#666666"];
        typeCell.backgroundColor = [UIColor colorWithHexString:@"#f8f8f8"];
    }
    
    
    return typeCell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // self.typeStr用来接收选中的类型
    self.typeStr = typeArr[indexPath.row];
    
    TypeScreenTableViewCell *celld = [tableView cellForRowAtIndexPath:self.selIndex];
    [celld.yesBtn setImage:[UIImage imageNamed:@"icon_datewindow_state_regular"] forState:UIControlStateNormal];
    celld.backgroundColor = [UIColor colorWithHexString:@"#f8f8f8"];
    celld.titLab.textColor = [UIColor colorWithHexString:@"#666666"];
    
    // 记录当前选中的位置索引
    self.selIndex = indexPath;
    
    // 当前选择的打勾
    TypeScreenTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell.yesBtn setImage:[UIImage imageNamed:@"icon_datewindow_state_select"] forState:UIControlStateNormal];
    cell.backgroundColor = [UIColor colorWithHexString:@"#f2f2f2"];
    cell.titLab.textColor = [UIColor colorWithHexString:@"#188bf0"];
    [self.typeScreenTbv reloadData];
    
    
}

-(void)creatTwoBtn{
    
    _cancelBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    _cancelBtn.frame = CGRectMake(0, self.typeScreenTbv.frame.size.height, SCREEN_W/2, 40);
    _cancelBtn.backgroundColor = [UIColor whiteColor];
    [_cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [_cancelBtn setTitleColor:[UIColor colorWithHexString:@"#666666"] forState:UIControlStateNormal];
    _cancelBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [self addSubview:self.cancelBtn];
    
    _sureBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    _sureBtn.frame = CGRectMake(SCREEN_W/2, self.typeScreenTbv.frame.size.height, SCREEN_W/2, 40);
    _sureBtn.backgroundColor = [UIColor whiteColor];
    [_sureBtn setTitle:@"确定" forState:UIControlStateNormal];
    [_sureBtn setTitleColor:[UIColor colorWithHexString:@"#666666"] forState:UIControlStateNormal];
    _sureBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [self addSubview:self.sureBtn];
    
    _topLine = [[UILabel alloc]initWithFrame:CGRectMake(0,self.cancelBtn.frame.origin.y, SCREEN_W, 0.5)];
    _topLine.backgroundColor = [UIColor colorWithHexString:@"#dcdcdc"];
    [self addSubview:self.topLine];
    
    _midLine = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_W/2,self.cancelBtn.frame.origin.y, 0.5, 40)];
    _midLine.backgroundColor = [UIColor colorWithHexString:@"#dcdcdc"];
    [self addSubview:self.midLine];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

-(void)showCustomScreenView:(UIView *)view{
    if (!view) {
        return;
    }
    [view addSubview:self];
}
-(void)dissmissCustomScreenView{
    [self removeFromSuperview];
}
@end
