//
//  Model2.m
//  MRRequestTest
//
//  Created by Mr.li on 2019/1/4.
//  Copyright © 2019 Mr.li. All rights reserved.
//

#import "Model2.h"

@implementation Model2

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
             @"name" : @"name",
             @"title": @"title"
             };
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"list" : [Model3 class]
            };
}

@end
