//
//  WorksCell.m
//  base
//
//  Created by 宇宙神帝 on 15/8/16.
//  Copyright (c) 2015年 kakalee. All rights reserved.
//

#import "WorksCell.h"
#import "UIImageView+WebCache.h"

@interface WorksCell () {
    IBOutlet UIImageView *_picture;
    IBOutlet UILabel *_artist;
    IBOutlet UILabel *_name;
}

@end

@implementation WorksCell 

- (void)awakeFromNib {
    // Initialization code
}

-(void)setWorksModel:(WorksModel *)worksModel {
    _worksModel = worksModel;
    [_picture sd_setImageWithURL:[NSURL URLWithString:_worksModel.thumbUrl]];
    _artist.text = _worksModel.artist_name;
    _name.text = _worksModel.name;
}

@end
