//
//  NSObject+MRHttpResponseParse.m
//  MRRequestTest
//
//  Created by Mr.li on 2019/1/4.
//  Copyright © 2019 Mr.li. All rights reserved.
//
#define MRHttpResponseParseLog(log) NSLog(@"MRHttpResponseParse内部提示:%@", log)

#import "NSObject+MRHttpResponseParse.h"
#import "YYModel.h"

@implementation NSObject (MRHttpResponseParse)

- (id)parseWithPath:(NSString *)path {
    NSString *tPath = path;
    NSString *typeSeperator = @":";
    //path error
    if (![tPath isKindOfClass:[NSString class]] ||
        ([(NSString *)tPath length]==0) ||
        ([(NSString *)tPath componentsSeparatedByString:typeSeperator].count<2) ||
        ([(NSString *)tPath componentsSeparatedByString:typeSeperator].firstObject.length==0)) {
        MRHttpResponseParseLog(@"解析地址格式错误");
        return nil;
    } else {
        //get real paths
        NSArray *components = [tPath componentsSeparatedByString:typeSeperator];
        //type
        NSString *type = [components objectAtIndex:0];
        //nodes
        NSArray *nodes = [[tPath substringFromIndex:[type stringByAppendingString:typeSeperator].length] componentsSeparatedByString:@"."];
        NSMutableArray *correctNodes = [NSMutableArray arrayWithArray:nodes];
        for (int i=0; i<correctNodes.count;) {
            if ([(NSString *)[correctNodes objectAtIndex:i] length]==0) {
                [correctNodes removeObjectAtIndex:i];
                continue;
            }
            i++;
        }
        nodes = correctNodes;
        //get data
        {
            id resultObj = self;
            @autoreleasepool {
                for (int nodeIndex=0; nodeIndex<nodes.count; nodeIndex++) {
                    if (!resultObj) {
                        break;
                    }
                    resultObj = [self objFromDic:resultObj withPath:[nodes objectAtIndex:nodeIndex]];
                }
            }
            if (!resultObj) {
                return nil;
            } else if ([resultObj isKindOfClass:[NSArray class]]) {
                //array
                NSArray *resultArray = (NSArray *)resultObj;
                if ([type isEqualToString:@"NSMutableArray"] ||
                    [type isEqualToString:@"MutableArray"] ||
                    [type isEqualToString:@"mutableArray"] ||
                    [type isEqualToString:@"mutablearray"] ||
                    [type isEqualToString:@"mArray"] ||
                    [type isEqualToString:@"marray"] ||
                    [type isEqualToString:@"NSArray"] ||
                    [type isEqualToString:@"Array"] ||
                    [type isEqualToString:@"array"]) {
                    return resultArray;
                }
                //Dic2Model in Array
                NSMutableArray *models = [NSMutableArray arrayWithCapacity:0];
                @autoreleasepool {
                    for (int index=0; index<resultArray.count; index++) {
                        id model = [NSClassFromString(type) yy_modelWithDictionary:[resultArray objectAtIndex:index]];
                        if (model) {
                            [models addObject:model];
                        }
                    }
                }
                return models;
            } else if ([resultObj isKindOfClass:[NSDictionary class]]) {
                //dic
                if ([type isEqualToString:@"NSMutableDictionary"] ||
                    [type isEqualToString:@"MutableDictionary"] ||
                    [type isEqualToString:@"mutableDictionary"] ||
                    [type isEqualToString:@"mutabledictionary"] ||
                    [type isEqualToString:@"mDictionary"] ||
                    [type isEqualToString:@"mdictionary"] ||
                    [type isEqualToString:@"NSDictionary"] ||
                    [type isEqualToString:@"Dictionary"] ||
                    [type isEqualToString:@"dictionary"]) {
                    return resultObj;
                }
                //Dic2Model
                id model = [NSClassFromString(type) yy_modelWithDictionary:resultObj];
                if (!model) {
                    model = @"";
                }
                return model;
            } else {
                return [NSString stringWithFormat:@"%@", resultObj];
            }
        }
    }
}

- (id)objFromDic:(NSDictionary *)dic withPath:(NSString *)path {
    if ([dic isKindOfClass:[NSDictionary class]]) {
        NSString *leftSquare = @"[";
        NSString *rightSquare = @"]";
        if (([path rangeOfString:leftSquare].location != NSNotFound) ||
            ([path rangeOfString:rightSquare].location != NSNotFound)) {
            if (([path rangeOfString:leftSquare].location == NSNotFound) ||
                ([path rangeOfString:rightSquare].location == NSNotFound)) {
                MRHttpResponseParseLog(([NSString stringWithFormat:@"数组格式设置错误--%@", path]));
                return nil;
            }
            NSString *key = [path substringToIndex:[path rangeOfString:leftSquare].location];
            NSInteger index = abs((int)[[[path substringFromIndex:[key stringByAppendingString:leftSquare].length] substringWithRange:NSMakeRange(0, ([path rangeOfString:rightSquare].location-[key stringByAppendingString:leftSquare].length))] integerValue]);
            NSArray *objs = [dic objectForKey:key];
            if ([objs isKindOfClass:[NSArray class]]) {
                //有此条数据
                if (index<objs.count) {
                    return [objs objectAtIndex:index];
                } else {
                    MRHttpResponseParseLog(([NSString stringWithFormat:@"数组越界--%@", path]));
                }
            }
            return nil;
        }
        return [dic objectForKey:path];
    }
    return nil;
}

@end
