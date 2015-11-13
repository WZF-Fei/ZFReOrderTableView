# ZFReOrderTableView
Can reorder the sections and rows.

实现对不同section或row重新排序。

## Example:

<p align="center" >
<img src="https://github.com/WZF-Fei/ZFReOrderTableView/blob/master/ZFReOrderTableViewTests/ZFReOrderTableView.gif" width="266" height="500"/>
</p>

##Usage

Copy ZFReOrderTableView.h and ZFReOrderTableView.m in your project.

```
    const CGFloat Width = self.view.bounds.size.width;
    const CGFloat Height = self.view.bounds.size.height;
    
    ZFReOrderTableView *ReOrderView = [[ZFReOrderTableView alloc] initWithFrame:CGRectMake(0, 20, Width, Height - 20)
                                                                    withObjects:self.objects
                                                                     canReorder:YES];
    ReOrderView.tableView.delegate = self;
    ReOrderView.tableView.dataSource = self;
    [self.view addSubview:ReOrderView];
```

if you want't drag the UITableViewCell to reorder the cell,you can set the methond of canReorder NO.

##License

Usage is provided under the MIT License. See LICENSE for the full details.
