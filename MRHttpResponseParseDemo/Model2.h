//
//  Model2.h
//  MRRequestTest
//
//  Created by Mr.li on 2019/1/4.
//  Copyright © 2019 Mr.li. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YYModel.h"
#import "Model3.h"

NS_ASSUME_NONNULL_BEGIN

@interface Model2 : NSObject

@property (nonatomic, copy) NSString    *name;
@property (nonatomic, copy) NSString    *title;
@property (nonatomic, strong)NSArray<Model3 *>    *list;

@end

NS_ASSUME_NONNULL_END
