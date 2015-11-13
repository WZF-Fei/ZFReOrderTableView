//
//  ViewController.m
//  ZFReOrderTableView
//
//  Created by macOne on 15/11/13.
//  Copyright © 2015年 WZF. All rights reserved.
//

#import "ViewController.h"
#import "ZFReOrderTableView.h"

#define kUIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface ViewController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) NSMutableArray *objects;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imageView.image = [UIImage imageNamed:@"3.jpg"];
    [self.view addSubview:imageView];
    
    self.objects = [[NSMutableArray alloc] init];
    
    NSMutableArray *section1 = [self newSectionWithIndex:1 withCellCount:0];
    NSMutableArray *section2 = [self newSectionWithIndex:2 withCellCount:20];
    NSMutableArray *section3 = [self newSectionWithIndex:3 withCellCount:0];
    [self.objects addObject:section1];
    [self.objects addObject:section2];
    [self.objects addObject:section3];
    
    const CGFloat Width = self.view.bounds.size.width;
    const CGFloat Height = self.view.bounds.size.height;
    
    ZFReOrderTableView *ReOrderView = [[ZFReOrderTableView alloc] initWithFrame:CGRectMake(0, 20, Width, Height - 20)
                                                                    withObjects:self.objects
                                                                     canReorder:YES];
    ReOrderView.tableView.delegate = self;
    ReOrderView.tableView.dataSource = self;
    [self.view addSubview:ReOrderView];
}


-(NSMutableArray *)newSectionWithIndex:(NSUInteger)sectionIndex withCellCount:(NSUInteger)cellCount{
    
    NSMutableArray *array = [[NSMutableArray alloc]init];
    NSUInteger counter = 0;
    
    for (counter = 0; counter < cellCount; counter++) {
        [array addObject:[[NSString alloc] initWithFormat:@"Section %lu Cell %lu",(unsigned long)sectionIndex,(unsigned long)counter+1]];
    }
    return array;
}

#pragma mark - UITableViewDataSource

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"CellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    NSMutableArray *sectionArray = [self.objects objectAtIndex:indexPath.section];
    cell.textLabel.font = [UIFont systemFontOfSize:16.0f];
    cell.textLabel.textColor = [UIColor purpleColor];
    cell.textLabel.text = sectionArray[indexPath.row];
    cell.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.6];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.objects[section] count];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.objects count];;
}

#define SECTION_HEIGHT 30.0

#pragma mark - UITableViewDelegate

// 设置section的高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return SECTION_HEIGHT;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, SECTION_HEIGHT)];
    UILabel *leftLine = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 3, SECTION_HEIGHT)];
    [view addSubview:leftLine];
    
    UILabel *headerTitle = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 100, SECTION_HEIGHT)];
    headerTitle.text = [NSString stringWithFormat:@"Section %ld",section +1];
    headerTitle.font = [UIFont systemFontOfSize:14];
    [view addSubview:headerTitle];
    
    if (section == 0) {
        
        leftLine.backgroundColor = [UIColor greenColor];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(self.view.bounds.size.width - 100, 0, 100, SECTION_HEIGHT)];
        label.text = @"⭐️";
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:14];
        [view addSubview:label];
    }
    else{
        
        if (section % 3 == 0) {
            leftLine.backgroundColor = [UIColor greenColor];
        }
        else if (section % 3 == 1)
        {
            leftLine.backgroundColor = [UIColor yellowColor];
        }
        else if (section % 3 == 2)
        {
            leftLine.backgroundColor = [UIColor redColor];
        }
        
    }
    
    view.backgroundColor = kUIColorFromRGB(0x9BCB3D);
    return view;
}


@end
