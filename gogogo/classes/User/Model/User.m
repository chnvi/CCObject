//
//  User.m
//  thething
//
//  Created by wutan on 15/11/2.
//  Copyright © 2015年 lbxd. All rights reserved.
//

#import "User.h"

#define USER_KEY @"kUserDefault"

@implementation User

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self.id = [aDecoder decodeObjectForKey:@"id"];
    self.nickname = [aDecoder decodeObjectForKey:@"nickname"];
    self.device = [aDecoder decodeObjectForKey:@"device"];
    self.cid = [aDecoder decodeObjectForKey:@"cid"];
    self.password = [aDecoder decodeObjectForKey:@"password"];
    self.token = [aDecoder decodeObjectForKey:@"token"];
    self.sex = [aDecoder decodeObjectForKey:@"sex"];
    self.avatar = [aDecoder decodeObjectForKey:@"avatar"];
    self.mobile = [aDecoder decodeObjectForKey:@"mobile"];
    self.birthday = [aDecoder decodeObjectForKey:@"birthday"];
    self.cloud = [aDecoder decodeObjectForKey:@"cloud"];
    self.createTime = [aDecoder decodeObjectForKey:@"createTime"];
    self.lastLoginTime = [aDecoder decodeObjectForKey:@"lastLoginTime"];
//    self.lastAvatar = [aDecoder decodeObjectForKey:@"lastAvatar"];
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.id forKey:@"id"];
    [aCoder encodeObject:self.nickname forKey:@"nickname"];
    [aCoder encodeObject:self.device forKey:@"device"];
    [aCoder encodeObject:self.cid forKey:@"cid"];
    [aCoder encodeObject:self.password forKey:@"password"];
    [aCoder encodeObject:self.token forKey:@"token"];
    [aCoder encodeObject:self.sex forKey:@"sex"];
    [aCoder encodeObject:self.avatar forKey:@"avatar"];
    [aCoder encodeObject:self.mobile forKey:@"mobile"];
    [aCoder encodeObject:self.birthday forKey:@"birthday"];
    [aCoder encodeObject:self.cloud forKey:@"cloud"];
    [aCoder encodeObject:self.createTime forKey:@"createTime"];
    [aCoder encodeObject:self.lastLoginTime forKey:@"lastLoginTime"];
//    [aCoder encodeObject:self.lastAvatar forKey:@"lastAvatar"];
}

+(User *)currentUser
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [userDefaults objectForKey:USER_KEY];
    User *user;
    if(data == nil)
    {
        user = [[User alloc] init];
    }
    else
    {
        user = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    }
    return user;
//    return [User sharedUser];
}

//+(User *)sharedUser{
//    
//    static User *user;
//    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
//    NSData *data = [userDefaults objectForKey:USER_KEY];
////    
////    static dispatch_once_t onceToken;
////    dispatch_once(&onceToken, ^{
//        if(data == nil)
//        {
//            user = [[User alloc] init];
//        }
//        else
//        {
//            user = [NSKeyedUnarchiver unarchiveObjectWithData:data];
//        }
////    });
//
//    return user;
//}

+(void)clearUser
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults removeObjectForKey:USER_KEY];
    [userDefaults synchronize];
}

-(void)save
{
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:data forKey:USER_KEY];
    [userDefaults synchronize];
}

//+(BOOL)isCurrentUser: (User *)user {
//    
//    User *curUser = [User currentUser];
//    if ([curUser.id isEqual:user.id]) {
//        return YES;
//    }
//    return NO;
//}

-(BOOL)isCurrentUser{
    User *curUser = [User currentUser];
    if ([curUser.id isEqual:self.id]) {
        return YES;
    }
    return NO;
}

@end
