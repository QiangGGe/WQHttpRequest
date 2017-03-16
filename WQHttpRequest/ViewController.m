//
//  ViewController.m
//  WQHttpRequest
//
//  Created by qiangWang on 17/3/16.
//  Copyright © 2017年 qiangWang. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *url = @"http://10.0.0.55:9000/task";
    NSDictionary *parameter = @{@"day":@"2017-03-16"};
    
    [self testPostRequestWithURLString:url parameter:parameter];
    
}


- (void)testPostRequestWithURLString:(NSString *)urlString parameter:(NSDictionary *)parameter{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //申明请求的数据是json类型
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    //申明返回的结果是json类型
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    //超时时间设置
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = 30;
    
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html",@"text/json",@"text/javascript",@"text/plain", nil];
    
    [manager POST:urlString parameters:parameter progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"请求成功-->%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求失败-->%@",error.localizedDescription);
    }];
}

@end
