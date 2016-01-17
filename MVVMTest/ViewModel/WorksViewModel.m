//
//  WorksViewModel.m
//  MVVMTest
//
//  Created by 宇宙神帝 on 16/1/16.
//  Copyright © 2016年 宇宙神帝. All rights reserved.
//

#import "WorksViewModel.h"
#import "WorksModel.h"

@implementation WorksViewModel

-(void)refresh:(BOOL)isHeader {
    
    if (isHeader) {
        _page = 1;
        _isEnd = false;
    }
    
    NSDictionary *parameter = @{@"page":[NSString stringWithFormat:@"%d", _page]};
    
    [NetRequestClass NetRequestPOSTWithRequestURL:@"http://182.92.107.35/api/getWorksList" WithParameter:parameter WithReturnValeuBlock:^(id returnValue) {
        DDLog(@"%@", returnValue);
        [self fetchValueSuccessWithDic:returnValue isHeader:isHeader];
        
    } WithErrorCodeBlock:^(id errorCode) {
        DDLog(@"%@", errorCode);
        [self errorCodeWithDic:errorCode];
        
    } WithFailureBlock:^{
        [self netFailure];
        DDLog(@"网络异常");
        
    }];
}


#pragma 获取到正确的数据，对正确的数据进行处理
//如果isHeader为true就是下拉刷新 不是追加数据 而是要_worksData重建对象了x
-(void)fetchValueSuccessWithDic: (NSDictionary *) returnValue isHeader:(BOOL)isHeader {
    NSNumber *errNo = returnValue[@"errno"];
    
    if(errNo.intValue == 0) {
        _page++;
        NSDictionary *data = returnValue[@"data"];
        NSNumber *isEnd = returnValue[@"isEnd"];
        _isEnd = isEnd.boolValue;
        NSArray *worksList = data[@"worksList"];
        if(isHeader) {
            _worksData = [NSMutableArray new];
        }
        for (NSDictionary *works in worksList) {
            [_worksData addObject:[WorksModel createFromDictionary:works]];
        }
        self.returnBlock(_worksData);
    }
    
    //接口返回错误
    else {
        self.errorBlock(returnValue);
    }
}

#pragma 对ErrorCode进行处理
-(void) errorCodeWithDic: (NSDictionary *) errorDic
{
    self.errorBlock(errorDic);
}

#pragma 对网路异常进行处理
-(void) netFailure
{
    self.failureBlock();
}
@end
