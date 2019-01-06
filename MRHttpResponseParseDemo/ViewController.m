//
//  ViewController.m
//  MRHttpResponseParseDemo
//
//  Created by Mr.li on 2019/1/6.
//  Copyright © 2019 Mr.li. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+MRHttpResponseParse.h"
#import "Model3.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"TestData.plist" ofType:nil]];
    NSTimeInterval startTime = [[NSDate date] timeIntervalSince1970];
    NSDictionary *dictionary2 = [dic parseWithPath:@"NSDictionary:Dictionary.Dictionary2"];
    float aFloat = [[dic parseWithPath:@"Float:Float"] floatValue];
    int aInt = [[dic parseWithPath:@"Int:Int"] intValue];
    NSString *aString = [dic parseWithPath:@"String:String"];
    BOOL aBool = [[dic parseWithPath:@"Bool:Bool"] boolValue];
    
    NSInteger IntInDic2 = [[dic parseWithPath:@"int:Dictionary.Dictionary2.IntInDic2"] intValue];
    NSInteger NumInDic3 = [[dic parseWithPath:@"int:Dictionary.Dictionary2.Dictionary3.NumInDic3"] intValue];
    NSString *StrInDic3 = [dic parseWithPath:@"string:Dictionary.Dictionary2.Dictionary3.StrInDic3"];
    NSDictionary *aDic = [dic parseWithPath:@"dictionary:"];
    NSArray *model1s = [dic parseWithPath:@"Model1:Dictionary.Dictionary2.ArrayInDic2"];
    NSArray *model2s = [dic parseWithPath:@"Model2:Dictionary.ArrayInDictionary"];
    NSArray *model3s = [dic parseWithPath:@"Model3:Dictionary.ArrayInDictionary[0].list"];
    Model3 *model3 = [dic parseWithPath:@"Model3:Dictionary.ArrayInDictionary[0].list[-010]"];
    NSDictionary *dictionary = [dic parseWithPath:@"NSDictionary:Dictionary.ArrayInDictionary[0].list[-21]"];
    NSDictionary *arrayWrongType = [dic parseWithPath:@"NSDictionary:Dictionary.ArrayInDictionary[0].list21]"];
    NSDictionary *arrayWrongType2 = [dic parseWithPath:@"NSDictionary:Dictionary.ArrayInDictionary[0].list[21"];
    NSDictionary *transgress = [dic parseWithPath:@"NSDictionary:Dictionary.ArrayInDictionary[0].list[23]"];
    CGFloat seconds = [[NSDate date] timeIntervalSince1970] - startTime;
    NSLog(@"%@", [NSString stringWithFormat:@"耗时:%.5f", seconds]);
    // Do any additional setup after loading the view, typically from a nib.
}


@end
