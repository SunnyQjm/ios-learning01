//
//  MailItem.h
//  MailList
//
//  Created by OurEDA on 2018/3/14.
//  Copyright © 2018年 OurEDA. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MailItem : NSObject

@property(nonatomic, copy) NSString *name;

@property(nonatomic, copy) NSString *phone;

@property(nonatomic, copy) NSString *email;

@property(nonatomic, copy) NSString *myDescription;

- (instancetype)initWithName:(NSString *)aName phone:(NSString *)aPhone email:(NSString *)anEmail description:(NSString *)aDescription;

+ (instancetype)itemWithName:(NSString *)aName phone:(NSString *)aPhone email:(NSString *)anEmail description:(NSString *)aDescription;

- (NSDictionary *) toDictionary;

+ (MailItem *) toMailItem: (NSDictionary *)d;
@end
