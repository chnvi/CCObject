//
//  User.h
//  thething
//
//  Created by wutan on 15/11/2.
//  Copyright © 2015年 lbxd. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 用户 基于NSUserDefaults存储
 */
@interface User : NSObject<NSCoding>

@property (nonatomic, retain) NSNumber *id;
@property (nonatomic, retain) NSString *nickname;
@property (nonatomic, retain) NSNumber *device;
@property (nonatomic, retain) NSString *cid;
@property (nonatomic, retain) NSString *password;
@property (nonatomic, retain) NSString *token;
@property (nonatomic, retain) NSNumber *sex;

//@property (nonatomic, retain) NSString *lastAvatar;
@property (nonatomic, retain) NSString *avatar;
@property (nonatomic, retain) NSString *mobile;
@property (nonatomic, retain) NSString *birthday;
@property (nonatomic, retain) NSNumber *cloud;
@property (nonatomic, retain) NSNumber *createTime;
@property (nonatomic, retain) NSNumber *lastLoginTime;

@property (nonatomic, retain) NSString *qqId;
@property (nonatomic, retain) NSString *wechatId;
@property (nonatomic, retain) NSString *weiboId;



+(User*)currentUser;
+(void)clearUser;
-(void)save;

-(BOOL)isCurrentUser; //判断一个 user 是否为当前用户

@end
