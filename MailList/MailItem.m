//
//  MailItem.m
//  MailList
//
//  Created by OurEDA on 2018/3/14.
//  Copyright © 2018年 OurEDA. All rights reserved.
//

#import "MailItem.h"

@implementation MailItem
- (instancetype)initWithName:(NSString *)aName phone:(NSString *)aPhone email:(NSString *)anEmail description:(NSString *)aDescription {
    self = [super init];
    if (self) {
        self.name = aName;
        self.phone = aPhone;
        self.email = anEmail;
        self.myDescription = aDescription;
    }

    return self;
}

+ (instancetype)itemWithName:(NSString *)aName phone:(NSString *)aPhone email:(NSString *)anEmail description:(NSString *)aDescription {
    return [[self alloc] initWithName:aName phone:aPhone email:anEmail description:aDescription];
}

- (NSDictionary *)toDictionary {
    NSDictionary *myItem = @{@"name": self.name, @"phone": self.phone,
            @"email": self.email, @"description": self.myDescription};
    return myItem;
}

+ (MailItem *) toMailItem: (NSDictionary *)d{
    MailItem *mailItem = [[MailItem alloc] initWithName:d[@"name"] phone:d[@"phone"]
                                                  email:d[@"email"] description:d[@"description"]];
    return mailItem;
}


@end
