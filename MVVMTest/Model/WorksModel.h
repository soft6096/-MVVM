//
//  WorksDB.h
//  base
//
//  Created by 宇宙神帝 on 15/8/16.
//  Copyright (c) 2015年 kakalee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WorksModel : NSObject

@property (nonatomic, strong) NSString * worksid;
@property (nonatomic, strong) NSString * userid;
@property (nonatomic, strong) NSString * user_face_url;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSString * mainPic_url;
@property (nonatomic, strong) NSString * artist_name;
@property (nonatomic, strong) NSString * thumbUrl;

+(id)createFromDictionary:(NSDictionary *)dictionary;
@end
