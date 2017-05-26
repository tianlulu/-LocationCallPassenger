//
//  KCAnnotation.h
//  coreLocation
//
//  Created by iMac on 17/4/22.
//  Copyright © 2017年 JinTaiJI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface KCAnnotation : NSObject<MKAnnotation>
@property (nonatomic) CLLocationCoordinate2D coordinate;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *subtitle;

@end
