//
//  StuInforController.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/23.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "StuInforController.h"
#import "MineViewController.h"
#import "LoginViewController.h"
#import "ChangeStuViewController.h"
#import "StuInformationCell.h"
#import "MyMedalController.h"

#import "MyMemberInfoModel.h"
#import "MyMemberInfoDetailModel.h"
#import "MyMemberInfoViewModel.h"

@interface StuInforController ()<UITableViewDelegate,UITableViewDataSource,UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property(nonatomic,strong)StuInformationCell *stuInfoCell;
@property(nonatomic,strong)UILabel *navTitleLab;
@property(nonatomic,strong)UITableView *tbv;
@property(nonatomic,strong)NSMutableArray *oneArr,*twoArr;
@property(nonatomic,strong) UIImagePickerController *imagePicker; //声明全局的UIImagePickerController
@property(nonatomic,strong)MyMemberInfoModel *myMemberInfoModel;
@property(nonatomic,strong)MyMemberInfoDetailModel *myMemberInfoDetailModel;
@property(nonatomic,strong)MyMemberInfoViewModel *myMemberInfoViewModel;
@property(nonatomic,strong)NSMutableDictionary *myDic;
@property(nonatomic,strong)NSString *imageStr;

@end

@implementation StuInforController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
   // [self netWorkRequest];
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.tabBarController.tabBar.hidden = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // 导航标题
    self.navigationItem.titleView = self.navTitleLab;
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    // 导航左侧按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav_back_blue"] style:UIBarButtonItemStyleDone target:self action:@selector(goBackBtn:)];
    // 背景颜色
    self.view.backgroundColor = [UIColor whiteColor];
    // 将表格添加到视图
    [self.view addSubview:self.tbv];
    
    self.imagePicker = [[UIImagePickerController alloc]init];
    self.imagePicker.delegate = self;
    // 跳转动画效果
    self.imagePicker.modalPresentationStyle = UIModalTransitionStyleFlipHorizontal;
    self.imagePicker.allowsEditing = YES;
    
    // 网络解析
    [self netWorkRequest];

}

-(void)netWorkRequest{
    
        [self.myMemberInfoViewModel getMyMemberInfoSuccess:^(MyMemberInfoModel *  infoModel) {
            
            self.myMemberInfoDetailModel = [MyMemberInfoDetailModel new];
            
            self.myMemberInfoDetailModel.birthday   = infoModel.data[@"birthday"];
            self.myMemberInfoDetailModel.no         = infoModel.data[@"no"];
            self.myMemberInfoDetailModel.guardianName = infoModel.data[@"guardianName"];
            self.myMemberInfoDetailModel.titleID    = infoModel.data[@"id"];
            self.myMemberInfoDetailModel.height     = infoModel.data[@"height"];
            self.myMemberInfoDetailModel.photo      = infoModel.data[@"photo"];
            self.myMemberInfoDetailModel.weight     = infoModel.data[@"weight"];
            self.myMemberInfoDetailModel.heatRate   = infoModel.data[@"heatRate"];
            self.myMemberInfoDetailModel.bindMobile = infoModel.data[@"bindMobile"];
            self.myMemberInfoDetailModel.name       = infoModel.data[@"name"];
            self.myMemberInfoDetailModel.position   = infoModel.data[@"position"];
            self.myMemberInfoDetailModel.membershipCategoryText = infoModel.data[@"membershipCategoryText"];
            self.myMemberInfoDetailModel.genderText = infoModel.data[@"genderText"];
            
            [self.tbv reloadData];
            
        } Failture:^(MyMemberInfoModel *  infoError) {
//            [self showErrorText:infoError.message];
            if ([[infoError.message substringToIndex:5] isEqualToString:@"未登录错误"]) {
                if ([User_Default objectForKey:@"myjsession"]) {
                    [LoginOut OutSuccess:^(TuiChuLoginModel *  tuichumm) {
                        // 登录
                        LoginViewController *loginVC = [[LoginViewController alloc]initWithLoginSuccessBlock:^{
                            [self netWorkRequest];
                        }];
                        [self.navigationController pushViewController:loginVC animated:YES];
//                        [self presentViewController:loginVC animated:NO completion:nil];
                        
                    } Failture:^(TuiChuLoginModel *  err_tuichumm) {
                        
                    }];
                    
                }else{
                    // 登录
                    LoginViewController *loginVC = [[LoginViewController alloc]initWithLoginSuccessBlock:^{
                        [self netWorkRequest];
                    }];
                    [self.navigationController pushViewController:loginVC animated:YES];
//                    [self presentViewController:loginVC animated:NO completion:nil];
                }
                
            }
            
        }];
    
}
#pragma mark --> 自定义按钮点击事件
-(void)goBackBtn:(UIButton *)backBtn{
    
    MineViewController *mineVC = [[MineViewController alloc]init];
    mineVC.headImgStr = self.myMemberInfoDetailModel.photo;
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark --> 懒加载
-(UILabel *)navTitleLab{
    if (!_navTitleLab) {
        // 导航标题
        _navTitleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 18)];
        _navTitleLab.text = @"学员资料";
        _navTitleLab.textAlignment = NSTextAlignmentCenter;
        _navTitleLab.textColor = [UIColor colorWithHexString:@"#333333"];
        _navTitleLab.font = BQBOLDFONT(18);
    }
    return _navTitleLab;
}

-(NSMutableArray *)oneArr{
    if (!_oneArr) {
        _oneArr = [NSMutableArray arrayWithObjects:@"姓名",@"性别",@"生日",@"身高",@"体重",@"基础心率", nil];
    }
    return _oneArr;
}

-(UITableView *)tbv{
    if (!_tbv) {
        // 初始化表格
        _tbv = [[UITableView alloc]initWithFrame:CGRectMake(0, NAVIGATION_BAR_HEIGHT, SCREEN_W, SCREEN_H - NAVIGATION_BAR_HEIGHT) style:UITableViewStyleGrouped];
        
        if (@available(iOS 11.0, *)) {
            _tbv.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }else{
            self.automaticallyAdjustsScrollViewInsets =  NO;
        }
        // 设置代理和数据源
        _tbv.delegate = self;
        _tbv.dataSource = self;
    }
    return _tbv;
}

#pragma mark --> UITanleViewDelegate ------UItableViewDataSource
//几组
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
// 几行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 7;
    }else{
        return 1;
    }
    
}
// 设置cell内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        
        if (indexPath.row == 0) {
            _stuInfoCell = [tableView dequeueReusableCellWithIdentifier:@"stuInfoCell"];
            if (!_stuInfoCell) {
                _stuInfoCell = [[StuInformationCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"stuInfoCell"];
            }
            _stuInfoCell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            if (self.headImg != nil) {
                _stuInfoCell.headImg.image = self.headImg;
            }
            if ([self.myMemberInfoDetailModel.genderText isEqualToString:@"男"]) {
                NSString *photoStr = self.myMemberInfoDetailModel.photo;
                [_stuInfoCell.headImg sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",photoStr]] placeholderImage:[UIImage imageNamed:@"photo_man_nor"]];
            }else{
                NSString *photoStr = self.myMemberInfoDetailModel.photo;
                [_stuInfoCell.headImg sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",photoStr]] placeholderImage:[UIImage imageNamed:@"photo_woman_nor"]];
            }
            
            if (self.headImg != nil) {
                //加载内存图片
                _stuInfoCell.headImg.image = self.headImg;
            }
            
            return _stuInfoCell;
            
        }else{
            
            UITableViewCell *twoCell = [tableView dequeueReusableCellWithIdentifier:@"twoCell"];
            if (!twoCell) {
                twoCell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"twoCell"];
            }
            twoCell.selectionStyle = UITableViewCellSelectionStyleNone;
            twoCell.textLabel.text = self.oneArr[indexPath.row-1];
            twoCell.textLabel.font = BQBOLDFONT(16);
            
            switch (indexPath.row) {
                case 1:{
                    // 姓名
                    if (self.myMemberInfoDetailModel.name.length) {
                        twoCell.detailTextLabel.text = self.myMemberInfoDetailModel.name;
                    }
                }
                    break;
                case 2:{
                    // 性别
                    if (self.myMemberInfoDetailModel.genderText.length) {
                        twoCell.detailTextLabel.text = self.myMemberInfoDetailModel.genderText;
                    }
                }
                    break;
                case 3:{
                    // 生日
                    if (self.myMemberInfoDetailModel.birthday.length) {
                        twoCell.detailTextLabel.text = self.myMemberInfoDetailModel.birthday;
                    }
                }
                    break;
                case 4:{
                    // 身高
                    if ([self.myMemberInfoDetailModel.height isKindOfClass:[NSNull class]]) {
                        twoCell.detailTextLabel.text = @"";
                        
                    }else{
                        twoCell.detailTextLabel.text = [NSString stringWithFormat:@"%@cm",self.myMemberInfoDetailModel.height];
                    }
                }
                    break;
                case 5:{
                    // 体重
                    if ([self.myMemberInfoDetailModel.weight isKindOfClass:[NSNull class]]) {
                        twoCell.detailTextLabel.text = @"";
                    }else{
                        twoCell.detailTextLabel.text = [NSString stringWithFormat:@"%@kg",self.myMemberInfoDetailModel.weight];
                    }
                }
                    break;
                case 6:{
                    // 基本心率
                    if ([self.myMemberInfoDetailModel.heatRate isKindOfClass:[NSNull class]]) {
                        twoCell.detailTextLabel.text = @"";
                    }else{
                        twoCell.detailTextLabel.text = [NSString stringWithFormat:@"%@",self.myMemberInfoDetailModel.heatRate];
                    }
                }
                    break;
                default:
                    break;
            }
            return twoCell;
            
        }
        
    }else if (indexPath.section == 1){
        
        UITableViewCell *threeCell = [tableView dequeueReusableCellWithIdentifier:@"threeCell"];
        if (!threeCell) {
            threeCell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"threeCell"];
        }
        threeCell.selectionStyle = UITableViewCellSelectionStyleNone;
        threeCell.textLabel.text = @"我的勋章";
        threeCell.textLabel.font = BQBOLDFONT(16);
        UIImageView  *img = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"arrow_right_black"]];
        threeCell.accessoryView = img;
        
        return threeCell;
    }else{
        
        UITableViewCell *fourCell = [tableView dequeueReusableCellWithIdentifier:@"fourCell"];
        if (!fourCell) {
            fourCell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"fourCell"];
        }
        fourCell.selectionStyle = UITableViewCellSelectionStyleNone;
        fourCell.textLabel.text = @"绑定手机号";
        fourCell.textLabel.font = BQBOLDFONT(16);
        fourCell.detailTextLabel.text = self.myMemberInfoDetailModel.bindMobile;
        return fourCell;
    }
    
}

// 设置行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        
        if (indexPath.row == 0) {
            return 80;
        }else{
            return 50;
        }
    }else{
        return 50;
    }
}

// 设置页眉高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 1 || section == 2) {
        return 20;
    }
    return 0.1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return 0;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return 0;
}

// 设置表格的单元格的点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        
        if (indexPath.row == 0) {
            
            UIAlertController *alertCtl =[[UIAlertController alloc]init];
            UIAlertAction *cancel =[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * action) {
                NSLog(@"cancel");
            }];
            UIAlertAction *xiangji =[UIAlertAction actionWithTitle:@"相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
                NSLog(@"xiangji");
                // 打开相机
                [self openCamera];
            }];
            UIAlertAction *xiangce =[UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                NSLog(@"xiangce");
                // 打开相册
                [self openPhotoLibrary];
            }];
            [alertCtl addAction:cancel];
            [alertCtl addAction:xiangji];
            [alertCtl addAction:xiangce];
            [self presentViewController:alertCtl animated:YES completion:nil];
        }
        
    }else if (indexPath.section == 1) {
        
        MyMedalController *medalVC = [[MyMedalController alloc]init];
        [self presentViewController:medalVC animated:NO completion:nil];
    }
}
#pragma mark --> 调用照相机
-(void)openCamera{
    //判断是否可以打开照相机
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        //摄像头
        self.imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:self.imagePicker animated:YES completion:nil];
    }
    else{
        NSLog(@"没有摄像头");
    }
}
#pragma mark --> 打开相册
-(void)openPhotoLibrary{
    // 进入相册
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary])
    {
        self.imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:self.imagePicker animated:YES completion:^{
            NSLog(@"打开相册");
        }];
    }else{
        NSLog(@"不能打开相册");
    }
    
}
#pragma mark - UIImagePickerControllerDelegate
// 拍照完成回调
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(nullable NSDictionary<NSString *,id> *)editingInfo NS_DEPRECATED_IOS(2_0, 3_0){
    if(picker.sourceType == UIImagePickerControllerSourceTypeCamera)
    {
        //图片存入相册
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
    }
    _stuInfoCell.headImg.image =image;
    
    //调用返回头像的block
    if (image != nil && _headerImgBlock != nil) {
        _headerImgBlock(image);
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    // 调用上传头像的方法
    [self updataImage];
    
}
//进入拍摄页面点击取消按钮
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)updataImage{
    
    // 拼接地址
    NSString *str = [NSString stringWithFormat:@"%@/upload/uploadHead",interface];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //ContentType设置
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html",@"image/jpeg",@"image/png",@"application/octet-stream",@"text/json",nil];
    manager.requestSerializer= [AFHTTPRequestSerializer serializer];
    manager.responseSerializer= [AFHTTPResponseSerializer serializer];
    [manager POST:str parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        //把image  转为data , POST上传只能传data
        NSData *data = UIImagePNGRepresentation(self.stuInfoCell.headImg.image);
        //上传的参数(上传图片，以文件流的格式)
        [formData appendPartWithFileData:data name:@"file" fileName:@"badge.png"mimeType:@"image/png"];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        
        if (dic[@"success"]) {
            // 判断是否存在
            if (self.imgagBLock) {
                self.imgagBLock(self.stuInfoCell.headImg.image);
            }
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

-(MyMemberInfoModel *)myMemberInfoModel{
    if (!_myMemberInfoModel) {
        _myMemberInfoModel = [[MyMemberInfoModel alloc]init];
    }
    return _myMemberInfoModel;
}
-(MyMemberInfoViewModel *)myMemberInfoViewModel{
    if (!_myMemberInfoViewModel) {
        _myMemberInfoViewModel = [[MyMemberInfoViewModel alloc]init];
    }
    return _myMemberInfoViewModel;
}

@end
