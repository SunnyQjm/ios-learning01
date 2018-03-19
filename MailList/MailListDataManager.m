//
// Created by OurEDA on 2018/3/17.
// Copyright (c) 2018 OurEDA. All rights reserved.
//

#import "MailListDataManager.h"


@implementation MailListDataManager {

}

static MailListDataManager * instance = nil;

- (void)initData:(NSString *)myPath {
    //沙盒获取路径
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = pathArray[0];
    //获取文件的完整路径
    NSString *filePath = [path stringByAppendingPathComponent:myPath];//没有会自动创建
    NSLog(@"file patch%@",filePath);
    plistPath = filePath;
    mailList = [[NSMutableDictionary alloc]initWithContentsOfFile:filePath];
    NSLog(@"%@", mailList == nil ? @"nil" : @"not nil");
    if(mailList == nil){        //第一次读取初始数据
        /**
        * 获取数据
        */
        NSString *plistPath = [[NSBundle mainBundle] pathForResource:myPath ofType:@"plist"];
        mailList = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
        [self saveToPlist];
    }
}

- (BOOL)add:(NSDictionary *)item {
    [mailList setValue:item forKey:[NSString stringWithFormat:@"item%d", (int) [mailList count]]];
    return [self saveToPlist];
}

- (BOOL)update:(NSString *)key withItem:(NSDictionary *)item {
    [mailList setValue:item forKey:key];
    return [self saveToPlist];
}

- (BOOL)remove:(NSString *)key {
    [mailList removeObjectForKey:key];
    return [self saveToPlist];
}

- (BOOL)saveToPlist{
    BOOL result = [[mailList copy] writeToFile:plistPath atomically:YES];
    NSLog(@"%@", mailList);
    NSLog(@"%@", plistPath);
    NSLog(@"%@", result ? @"save success" : @"save fail");
    return result;
}

- (NSMutableDictionary *)getMailList {
    return mailList;
}



+ (MailListDataManager *)getInstance {
    if(instance == nil){
        instance = [[MailListDataManager alloc] init];
    }
    return instance;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    if (instance == nil) {
        instance = (MailListDataManager *) [super allocWithZone:zone];
    }
    return instance;
}

//重写copy方法中会调用的copyWithZone方法，确保单例实例复制时不会重新创建
-(id) copyWithZone:(struct _NSZone *)zone
{
    return instance;
}

@end