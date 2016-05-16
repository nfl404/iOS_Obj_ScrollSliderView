//
//  NJTool.h
//  iOS_Obj_ScrollSliderView
//
//  Created by Mr nie on 16/5/16.
//  Copyright © 2016年 程序猿:NiePlus   博客地址:http://nieplus.blog.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NJTool : NSObject

#define WIDTH  self.view.frame.size.width
#define HEIGHT  self.view.frame.size.height

#define ScreenBounds [UIScreen mainScreen].bounds
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width

#pragma mark - 颜色

#define RGBA(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
#define RGB(r,g,b)    [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define UIColorWithHex(x) RGB(((x)&0xFF0000) >> 16, ((x)&0xFF00) >> 8 ,  ((x)&0xFF))

#pragma mark - 设备
//判断是否为ios7.0
#define IsIOS7 ([[[UIDevice currentDevice] systemVersion] doubleValue] < 7.1 ? YES : NO)
//判断是否为ios8
#define IsIOS8 ([[[UIDevice currentDevice] systemVersion] floatValue] >=8.0 ? YES : NO)
//判断是否是ios9
#define IsIOS9 ([[[UIDevice currentDevice] systemVersion] floatValue] >=9.0 ? YES : NO)
//判断是否为iPhone5之后的设备
#define IsIphone5_later ([UIScreen mainScreen].bounds.size.height > 568 ? YES : NO)
#define IsIphone4    ([UIScreen mainScreen].bounds.size.height == 480 ? YES : NO)
#define IsIphone6p   ([UIScreen mainScreen].bounds.size.height == 736 ? YES : NO)
#define IsIphone5   ([UIScreen mainScreen].bounds.size.height == 568 ? YES : NO)
//设备的高
#define SCREEN_SIZE [UIScreen mainScreen].bounds.size
#define SHeight [UIScreen mainScreen].bounds.size.height
#define SWidth [UIScreen mainScreen].bounds.size.width

#pragma mark - 颜色转换
//十六进制颜色转化为UIColor
+ (UIColor *)colorWithHexString: (NSString *)color;
//背景色
+ (UIColor *)bgColor;
//黑色字体
+ (UIColor *)titleBlackColor;
//灰色字体
+ (UIColor *)titleGrayColor;
//    //日期的灰色
+ (UIColor *)titleGrayColorForDate;
//    //内容的灰色
//+ (UIColor *)titleGrayColorForcontent;
//label橘色的背景
+ (UIColor *)bgOrangeColorForLabel;
//label红色的背景
+ (UIColor *)bgRedColorForLabel;
//label蓝色的背景
+ (UIColor *)bgBlueColorForLabel;
// button蓝色背景
+ (UIColor *)bgBlueColorForButton;

/** 分割线的颜色*/
+ (UIColor *)separatorColor;

#pragma mark- 时间处理

//获取今天日期
+ (NSString *)getToday;
//获取现在的时间
+ (NSString *)getNowTime;
//将时间转换为时间戳
+ (NSTimeInterval)timeToTimestamp:(NSString *)timeStr;
//时间戳转换为时间
+ (NSString *)timestampToTime:(NSTimeInterval)timestamp;
+ (NSString *)timestampToTimeWithWord:(NSTimeInterval)timestamp;

#pragma mark- 对象处理

//将对象装换为dic
+ (NSMutableDictionary *)dictFromObject:(id)object;
//将一个数组转换为json格式
+ (NSString *)jsonFromArray:(NSArray *)array;
//将一个数组里的对象转换为字典
+ (NSArray *)arrayFormObjectArray:(NSArray *)array;
//判断字典是否有某key值
+(BOOL)dicContainsKey:(NSDictionary *)dic keyValue:(NSString *)key;
//判断对象是否为空
+(BOOL)objectIsEmpty:(id)object;
//把空的的字符串转换为@“”
+(NSString *)EmptyObjectContainEmptyString:(id)object;
//判断手机号是否有效
+ (BOOL)isMobileNumber:(NSString *)mobileNum;
//校验银行卡卡号
+ (BOOL)isBankNumber:(NSString *)bankNum;
//校验身份证号码
+ (BOOL)checkIdentityCardNo:(NSString*)cardNo;
//校验是否为中文
+ (BOOL)isChinese:(NSString *)str;

//判断邀请码是否正确;
+ (BOOL)isNumberOrNil:(NSString *)recommendedTelStr;
+ (BOOL)isRightPassworld:(NSString *)passWorld;


////得到加密后的参数
//+ (NSDictionary *)getParameters:(id)params;
////将加密后的数据解密后转换为字符串
//+ (NSString *)dataToStringwithdata:(NSData*)data;
////将加密后的数据解密后转换为字典
//+ (NSDictionary *)dataToDictionary:(NSData *)data;
//转化成带逗号的钱数
+ (NSString *)numFormaterWithNUmber:(NSNumber *)number;
+ (NSString *)floatFormaterWithNUmber:(NSNumber *)number;
//带逗号的钱数 转化 成float
+ (float)stringFormaterToFloat:(NSString *)string;


@end
