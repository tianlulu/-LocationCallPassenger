//
//  PinPassengerTableViewCell.m
//  coreLocation
//
//  Created by iMac on 17/4/22.
//  Copyright © 2017年 JinTaiJI. All rights reserved.
//

#import "PinPassengerTableViewCell.h"
#import "Masonry.h"

@implementation PinPassengerTableViewCell

/*
+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *identifier = @"passengerCell";
    //先从缓存池中找可用的cell
    PinPassengerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if(cell == nil){
        //没找到就创建个新的
        cell = [[PinPassengerTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}*/

//通过代码自定义的cell需要重写以下方法‘可以添加额外的控件
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initUI];
    }
    return self;
}

- (void)initUI{
    self.passengerNameLabel = [[UILabel alloc]init];
    self.passengerNameLabel.font = [UIFont systemFontOfSize:14];
    self.passengerNameLabel.textColor = [UIColor whiteColor];
    [self addSubview:self.passengerNameLabel];
    
    self.passengerPhoneLabel = [[UILabel alloc]init];
    self.passengerPhoneLabel.font = [UIFont systemFontOfSize:14];
    self.passengerPhoneLabel.textColor = [UIColor whiteColor];
    [self addSubview:self.passengerPhoneLabel];
    
    self.callButton = [[UIButton alloc]init];
    [self.callButton setBackgroundImage:[UIImage imageNamed:@"小tel"] forState:UIControlStateNormal];
    [self.callButton setBackgroundImage:[UIImage imageNamed:@"小tel-h"] forState:UIControlStateNormal];
    [self.callButton addTarget:self action:@selector(callPassenger) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.callButton];
    
    [self.passengerNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(0.5);
        make.centerX.equalTo(self);
    }];
    
    [self.passengerPhoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.passengerPhoneLabel.mas_right).offset(5);
        make.centerX.equalTo(self);
    }];
    
    [self.callButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(60, 60));
        make.left.equalTo(self.passengerPhoneLabel.mas_right).offset(5);
        make.centerY.equalTo(self);
    }];
}
- (void)callPassenger{
    
}

@end
