//
//  WorksDB.m
//  base
//
//  Created by 宇宙神帝 on 15/8/16.
//  Copyright (c) 2015年 kakalee. All rights reserved.
//

#import "WorksModel.h"

@implementation WorksModel

//将dictionary转化为WorksModel对象
+(id)createFromDictionary:(NSDictionary *)dictionary {
    WorksModel *worksModel = [WorksModel new];
    if(worksModel) {
        worksModel.worksid = dictionary[@"worksid"];
        worksModel.userid = dictionary[@"userid"];
        worksModel.user_face_url = dictionary[@"user_face_url"];
        worksModel.name = dictionary[@"name"];
        worksModel.mainPic_url = dictionary[@"mainPic_url"];
        worksModel.artist_name = dictionary[@"artist_name"];
        [worksModel setThumbUrl];
    }
    return worksModel;
}

//缩略图地址特殊处理
-(void)setThumbUrl {
    NSString *lastPathComponent = self.mainPic_url.lastPathComponent;
    self.thumbUrl = [self.mainPic_url stringByReplacingOccurrencesOfString:lastPathComponent withString:[NSString stringWithFormat:@"200x200/%@", lastPathComponent]];
}
@end
