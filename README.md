# ZFReOrderTableView
Can reorder the sections and rows.

##Useage

copy ZFReOrderTableView.h and ZFReOrderTableView.m in your project.

```
    ZFReOrderTableView *ReOrderView = [[ZFReOrderTableView alloc] initWithFrame:CGRectMake(0, 20, Width, Height - 20)
                                                                    withObjects:self.objects
                                                                     canReorder:YES];
    ReOrderView.tableView.delegate = self;
    ReOrderView.tableView.dataSource = self;
    [self.view addSubview:ReOrderView];
```
