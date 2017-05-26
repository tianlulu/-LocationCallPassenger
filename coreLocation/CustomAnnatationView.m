//
//  CustomPassengerAnnatationView.m
//  coreLocation
//
//  Created by iMac on 17/4/24.
//  Copyright © 2017年 JinTaiJI. All rights reserved.
//

#import "CustomPassengerAnnatationView.h"
#import "Masonry.h"

@interface CustomPassengerAnnatationView()
@property (nonatomic,weak)id<CustomPassengerAnnatationViewDelegate>delegate;
@end

@implementation CustomPassengerAnnatationView
- (id)initWithAnnotation:(id<MKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier delegate:(id<CustomPassengerAnnatationViewDelegate>)delegate {
    self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.canShowCallout = NO;
        self.centerOffset = CGPointMake(0, -55);
        self.frame = CGRectMake(0, 0, 150, 40);
        if (delegate) {
            self.delegate = delegate;
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction)];
            [self addGestureRecognizer:tap];
        }
        [self initUI];
    }
    return self;
}


- (void)tapAction{
    //点击cell
    if ([_delegate respondsToSelector:@selector(didSelectAnnotationView:)]) {
        [_delegate didSelectAnnotationView:self];
    }
}


- (void)initUI{
    UIView *contentView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 45)];
    [self addSubview:contentView];
    contentView.backgroundColor = [UIColor lightGrayColor];
    self.contentView = contentView;
    
    self.passengerNameLabel = [[UILabel alloc]init];
    self.passengerNameLabel.font = [UIFont systemFontOfSize:14];
    self.passengerNameLabel.textColor = [UIColor whiteColor];
    self.passengerPhoneLabel.backgroundColor = [UIColor redColor];
    [contentView addSubview:self.passengerNameLabel];
    
    self.passengerPhoneLabel = [[UILabel alloc]init];
    self.passengerPhoneLabel.font = [UIFont systemFontOfSize:14];
    self.passengerPhoneLabel.textColor = [UIColor whiteColor];
    [contentView addSubview:self.passengerPhoneLabel];
    
    self.callButton = [[UIButton alloc]init];
    [self.callButton setBackgroundImage:[UIImage imageNamed:@"小tel"] forState:UIControlStateNormal];
    [self.callButton setBackgroundImage:[UIImage imageNamed:@"小tel-h"] forState:UIControlStateNormal];
    //[self.callButton addTarget:self action:@selector(callPassenger) forControlEvents:UIControlEventTouchUpInside];
    [contentView addSubview:self.callButton];
    
    
    [self.passengerNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(contentView).offset(0.5);
        make.centerY.equalTo(contentView);
    }];
    
    [self.passengerPhoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.passengerNameLabel.mas_right).offset(5);
        make.centerY.equalTo(contentView);
    }];
    
    [self.callButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(45, 45));
        make.centerY.equalTo(contentView);
        make.left.equalTo(self.passengerPhoneLabel.mas_right).offset(15);
    }];
    
}

- (void)callPassenger{
    
}
@end
