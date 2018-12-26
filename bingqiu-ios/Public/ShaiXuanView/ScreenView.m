//
//  ScreenView.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/20.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "ScreenView.h"
#import "ScreenTableViewCell.h"

@interface ScreenView()
{
    NSArray *yearArr;
    NSArray *arr;
    NSArray *dateArr;
    NSMutableArray *marr;
}
@end

@implementation ScreenView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        yearArr = @[@"2018"];
        arr = @[@"全年",@"12月",@"11月",@"10月",@"9月",@"8月",@"7月",@"6月",@"5月",@"4月",@"3月",@"2月",@"1月"];
        dateArr = @[@"",@"12月",@"11月",@"10月",@"9月",@"8月",@"7月",@"6月",@"5月",@"4月",@"3月",@"2月",@"1月"];
        
        [self addSubview:self.leftTable];
        [self addSubview:self.rightTable];
        
        [self creatTwoBtn];
        
    }
    return self;
}

#pragma mark ---- 创建表格 ----
-(UITableView *)leftTable{
    if (!_leftTable) {
        _leftTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W/2, 277) style:UITableViewStylePlain];
        _leftTable.delegate = self;
        _leftTable.dataSource = self;
        _leftTable.separatorStyle = NO;
    }
    return _leftTable;
}
-(UITableView *)rightTable{
    if (!_rightTable) {
        _rightTable = [[UITableView alloc]initWithFrame:CGRectMake(SCREEN_W/2, 0, SCREEN_W/2, 277) style:UITableViewStylePlain];
        _rightTable.delegate = self;
        _rightTable.dataSource = self;
        _rightTable.separatorStyle = NO;
        _rightTable.backgroundColor = [UIColor colorWithHexString:@"#f8f8f8"];
    }
    return _rightTable;
}
#pragma mark ---- 表格协议方法 ----
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == _leftTable) {
        return yearArr.count;
    }
    return arr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (tableView == _rightTable) {
        
        static  NSString  *ss = @"ScreenTableViewCell";
        ScreenTableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:ss];
        if (!cell) {
            cell = [[ScreenTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ss];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        else{
//            while ([cell.contentView.subviews lastObject] != nil){
//                [(UIView *)[cell.contentView.subviews lastObject] removeFromSuperview];
//            }
//        }
        
        cell.titLab.text = arr[indexPath.row];
        
        if (self.selIndex == 0 && indexPath.row == 0) {
            [cell.yesBtn setImage:[UIImage imageNamed:@"icon_datewindow_state_select"] forState:UIControlStateNormal];
            cell.backgroundColor = [UIColor colorWithHexString:@"#f2f2f2"];
            cell.titLab.textColor = [UIColor colorWithHexString:@"#188bf0"];
        }else if (self.selIndex == indexPath){
            [cell.yesBtn setImage:[UIImage imageNamed:@"icon_datewindow_state_select"] forState:UIControlStateNormal];
            cell.backgroundColor = [UIColor colorWithHexString:@"#f2f2f2"];
            cell.titLab.textColor = [UIColor colorWithHexString:@"#188bf0"];
        }else{
            [cell.yesBtn setImage:[UIImage imageNamed:@"icon_datewindow_state_regular"] forState:UIControlStateNormal];
            cell.backgroundColor = [UIColor colorWithHexString:@"#f8f8f8"];
            cell.titLab.textColor = [UIColor colorWithHexString:@"#666666"];
        }
        
//        [cell.yesBtn setImage:[UIImage imageNamed:@"icon_datewindow_state_regular"] forState:UIControlStateNormal];
    
        return cell;
        
    }else{
        
        UITableViewCell *cellss = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
        if (!cellss) {
            cellss = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
        }
//        else{
//            while ([cell.contentView.subviews lastObject] != nil){
//                [(UIView *)[cell.contentView.subviews lastObject] removeFromSuperview];
//            }
//        }
        cellss.textLabel.text = yearArr[indexPath.row];
        cellss.textLabel.textAlignment = NSTextAlignmentCenter;
        self.yearStr = yearArr[indexPath.row];
        
        return cellss;
    }
}

//MARK: - 点击 cell 的代理方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (tableView == _leftTable) {
        self.yearStr = yearArr[indexPath.row];
    }
    if (tableView == _rightTable ) {
        
        ScreenTableViewCell *celld = [tableView cellForRowAtIndexPath:self.selIndex];
        [celld.yesBtn setImage:[UIImage imageNamed:@"icon_datewindow_state_select"] forState:UIControlStateNormal];
        celld.backgroundColor = [UIColor colorWithHexString:@"#f8f8f8"];
        celld.titLab.textColor = [UIColor colorWithHexString:@"#666666"];
        
        // 记录当前选中的位置索引
        self.selIndex = indexPath;
        
        // 当前选择的打勾
        ScreenTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        [cell.yesBtn setImage:[UIImage imageNamed:@"icon_datewindow_state_select"] forState:UIControlStateNormal];
        cell.backgroundColor = [UIColor colorWithHexString:@"#f2f2f2"];
        cell.titLab.textColor = [UIColor colorWithHexString:@"#188bf0"];
        
        [self.rightTable reloadData];
        
        NSString  *newstr;
        marr = [NSMutableArray array];
        for (int i=0; i<dateArr.count; i++) {
            if ([dateArr[i] isEqualToString:@""]) {
                newstr = @"";
                self.monthStr =  newstr;
                [marr addObject:self.monthStr];
            }else if ([dateArr[i] isEqualToString:@"12月"]){
                newstr = @"12";
                self.monthStr =  newstr;
                [marr addObject:self.monthStr];
            }else if ([dateArr[i] isEqualToString:@"11月"]){
                newstr = @"11";
                self.monthStr =  newstr;
                [marr addObject:self.monthStr];
            }else if ([dateArr[i] isEqualToString:@"10月"]){
                newstr = @"10";
                self.monthStr =  newstr;;
                [marr addObject:self.monthStr];
            }else if ([dateArr[i] isEqualToString:@"9月"]){
                newstr = @"09";
                self.monthStr =  newstr;;
                [marr addObject:self.monthStr];
            }else if ([dateArr[i] isEqualToString:@"8月"]){
                newstr = @"08";
                self.monthStr =  newstr;;
                [marr addObject:self.monthStr];
            }else if ([dateArr[i] isEqualToString:@"7月"]){
                newstr = @"07";
                self.monthStr =  newstr;;
                [marr addObject:self.monthStr];
            }else if ([dateArr[i] isEqualToString:@"6月"]){
                newstr = @"06";
                self.monthStr =  newstr;;
                [marr addObject:self.monthStr];
            }else if ([dateArr[i] isEqualToString:@"5月"]){
                newstr = @"05";
                self.monthStr =  newstr;;
                [marr addObject:self.monthStr];
            }else if ([dateArr[i] isEqualToString:@"4月"]){
                newstr = @"04";
                self.monthStr =  newstr;;
                [marr addObject:self.monthStr];
            }else if ([dateArr[i] isEqualToString:@"3月"]){
                newstr = @"03";
                self.monthStr =  newstr;;
                [marr addObject:self.monthStr];
            }else if ([dateArr[i] isEqualToString:@"2月"]){
                newstr = @"02";
                self.monthStr =  newstr;;
                [marr addObject:self.monthStr];
            }else if ([dateArr[i] isEqualToString:@"1月"]){
                newstr = @"01";
                self.monthStr =  newstr;;
                [marr addObject:self.monthStr];
            }
        }
        self.monthStr = marr[indexPath.row];
        
    }
}

//- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
//
//    if (tableView == _rightTable) {
//        ScreenTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//        [cell.yesBtn setImage:[UIImage imageNamed:@"icon_datewindow_state_regular"] forState:UIControlStateNormal];
//         cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    }
//
//}

#pragma mark ---- 创建取消确定按钮 ----
-(void)creatTwoBtn{
    _cancelBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    _cancelBtn.frame = CGRectMake(0, self.leftTable.frame.size.height, SCREEN_W/2, 40);
    _cancelBtn.backgroundColor = [UIColor whiteColor];
    [_cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    // 点击事件
    [_cancelBtn setTitleColor:[UIColor colorWithHexString:@"#666666"] forState:UIControlStateNormal];
    _cancelBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [self addSubview:self.cancelBtn];
    
    _sureBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    _sureBtn.frame = CGRectMake(SCREEN_W/2, self.rightTable.frame.size.height, SCREEN_W/2, 40);
    _sureBtn.backgroundColor = [UIColor whiteColor];
    [_sureBtn setTitle:@"确定" forState:UIControlStateNormal];
    [_sureBtn setTitleColor:[UIColor colorWithHexString:@"#188bf0"] forState:UIControlStateNormal];
    _sureBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [self addSubview:self.sureBtn];
    
    _topLine = [[UILabel alloc]initWithFrame:CGRectMake(0,self.cancelBtn.frame.origin.y, SCREEN_W, 0.5)];
    _topLine.backgroundColor = [UIColor colorWithHexString:@"#dcdcdc"];
    [self addSubview:self.topLine];
    
    _midLine = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_W/2,self.cancelBtn.frame.origin.y, 0.5, 40)];
    _midLine.backgroundColor = [UIColor colorWithHexString:@"#dcdcdc"];
    [self addSubview:self.midLine];
    
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
