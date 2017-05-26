//
//  CustomPassengerAnnatationView.h
//  coreLocation
//
//  Created by iMac on 17/4/24.
//  Copyright © 2017年 JinTaiJI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyAnnotation.h"

@protocol CustomPassengerAnnatationViewDelegate;
@interface CustomPassengerAnnatationView : MKAnnotationView
@property (nonatomic,strong)UILabel *passengerNameLabel;
@property (nonatomic,strong)UILabel *passengerPhoneLabel;
@property (nonatomic,strong)UIButton *callButton;
@property (nonatomic,strong)UIView *contentView;

- (id)initWithAnnotation:(id<MKAnnotation>)annotation
         reuseIdentifier:(NSString *)reuseIdentifier
                delegate:(id<CustomPassengerAnnatationViewDelegate>)delegate;
@end

@protocol CallOutAnnotationViewDelegate <NSObject>
- (void)didSelectAnnotationView:(CustomPassengerAnnatationView *)view;
@end
