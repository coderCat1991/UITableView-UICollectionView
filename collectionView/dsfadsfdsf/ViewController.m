//
//  ViewController.m
//  dsfadsfdsf
//
//  Created by 李龙 on 2017/8/25.
//  Copyright © 2017年 李龙. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong) UICollectionView *collectionView;
@end

@implementation ViewController

static NSString *verticalflag = @"verticalflag";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
   CGFloat llscreenW =  [UIScreen mainScreen].bounds.size.width;
   CGFloat llscreenH =  [UIScreen mainScreen].bounds.size.height;
    
    //******UICollectionViewFlowLayout*********
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    flowLayout.itemSize = [UIScreen mainScreen].bounds.size;
    
    //    //清空行距
    flowLayout.minimumLineSpacing = 0;
    //    //设置滚动方向
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    
    
    
    UICollectionView *clView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, llscreenW,llscreenH ) collectionViewLayout:flowLayout];
    self.collectionView = clView;
    
    
    clView.backgroundColor = [UIColor cyanColor];
    //赋值全局参数
    clView.collectionViewLayout = flowLayout;
    
    //设置代理
    clView.delegate = self;
    clView.dataSource = self;
    
    
    //注册UICollectionView
    [clView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:verticalflag];
    //分页效果
    self.collectionView.pagingEnabled = YES;
    self.collectionView.bounces = NO;
    
    
    clView.showsVerticalScrollIndicator = YES;

    
    [self.view addSubview:clView];
    
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 4;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    /*
     在iphone5上:
     屏幕上显示第一个cell的时候, 这个方法里打印的是的indexPath.row是0.
     屏幕上显示第二个cell的时候, 这个方法里打印的是的indexPath.row是1,2.
     屏幕上显示第三个cell的时候, 这个方法里打印的是的indexPath.row是 3.
     屏幕上显示第四个cell的时候,不打印.
     然后当你反向往回滑动的时候,这个方法里打印的是的indexPath.row是1.
     
     
     然而在iphone6上:
     屏幕上显示第一个cell的时候, 这个方法里打印的是的indexPath.row是0.
     屏幕上显示第二个cell的时候, 这个方法里打印的是的indexPath.row是1.
     屏幕上显示第三个cell的时候, 这个方法里打印的是的indexPath.row是2.
     屏幕上显示第四个cell的时候, 这个方法里打印的是的indexPath.row是3.
     然后当你反向往回滑动的时候,这个方法里打印的是的indexPath.row是正常的,屏幕上显示哪个,indexPath.row就打印哪个.
     

     tableView就不是这样的.我记得刚开始学习tableView的时候, 都是说的屏幕显示哪个, 就对应加载哪个. 加载哪个这个是 UICollectionView 的加载机制? 和缓存机制有关系吗?

     */
    
    
    
    NSLog(@"🐳🐳🐳🐳🐳🐳🐳🐳🐳🐳🐳🐳🐳🐳🐳🐳🐳🐳🐳🐳🐳indexPath.row:%zd",indexPath.row);
    
    
    
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:verticalflag forIndexPath:indexPath];
    [cell.contentView addSubview:({
    
        UILabel *labelName = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
        labelName.text = [NSString stringWithFormat:@"%zd页面",indexPath.row];
        labelName.font = [UIFont systemFontOfSize:14];
        labelName.textAlignment = NSTextAlignmentCenter;
        labelName.backgroundColor = [UIColor redColor];
        labelName;
    })];
    return cell;
}




- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld",indexPath.row);
}











@end
