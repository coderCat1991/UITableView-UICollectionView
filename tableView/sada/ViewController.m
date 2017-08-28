//
//  ViewController.m
//  dsfadsfdsf
//
//  Created by 李龙 on 2017/8/25.
//  Copyright © 2017年 李龙. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *collectionView;
@end

@implementation ViewController

static NSString *verticalflag = @"verticalflag";

- (void)viewDidLoad {
    [super viewDidLoad];
//    // Do any additional setup after loading the view, typically from a nib.
//    
//    
    CGFloat llscreenW =  [UIScreen mainScreen].bounds.size.width;
    CGFloat llscreenH =  [UIScreen mainScreen].bounds.size.height;
//
    
    UITableView *clView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, llscreenW,llscreenH)  style:UITableViewStylePlain];
    self.collectionView = clView;
    
    
    clView.backgroundColor = [UIColor cyanColor];
    //设置代理
    clView.delegate = self;
    clView.dataSource = self;
    
    
    clView.pagingEnabled = YES;
    
    //注册UICollectionView
    [clView registerClass:[UITableViewCell class] forCellReuseIdentifier:verticalflag];
    
    
    
    [self.view addSubview:clView];
    
    
}


#pragma mark UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:verticalflag forIndexPath:indexPath];
    
    /*
     UITbaleView在iphone5,6商,一样:
     屏幕上显示第一个cell的时候, 这个方法里打印的是的indexPath.row是0.
     屏幕上显示第二个cell的时候, 这个方法里打印的是的indexPath.row是1.
     屏幕上显示第三个cell的时候, 这个方法里打印的是的indexPath.row是2.
     屏幕上显示第四个cell的时候, 这个方法里打印的是的indexPath.row是3.
     然后当你反向往回滑动的时候,这个方法里打印的是的indexPath.row是正常的,屏幕上显示哪个,indexPath.row就打印哪个.
     */
    
    NSLog(@"🐳🐳🐳🐳🐳🐳🐳🐳🐳🐳🐳🐳🐳🐳🐳🐳🐳🐳🐳🐳🐳indexPath.row:%zd",indexPath.row);

    cell.textLabel.text  = [NSString stringWithFormat:@"%zd页面",indexPath.row];
    cell.backgroundColor = [UIColor cyanColor];
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [UIScreen mainScreen].bounds.size.height;
}











@end
