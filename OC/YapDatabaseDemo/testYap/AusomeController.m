//
//  AusomeController.m
//  testYap
//
//  Created by hjp on 16/10/26.
//  Copyright © 2016年 hengqian. All rights reserved.
//


#import "AusomeController.h"
#import "Manager.h"
#import <YapDatabaseView.h>
#import "HQDBHelper+Ausome.h"
#import "SessionTable.h"
#import "AusomeCell.h"
#import "Ausome.h"

#import "AusomeDataSource.h"

#import "DetailViewController.h"

#define ScreenBounds [UIScreen mainScreen].bounds
@interface AusomeController ()<UITableViewDelegate,AusomeDataSourceDelegate>

/** UITableView*/
@property (nonatomic , weak) UITableView *tableView;

/** 数据源*/
@property (nonatomic , strong) AusomeDataSource *dataSource;
@end

@implementation AusomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.dataSource = [[AusomeDataSource alloc] init];
    

    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenBounds.size.width, ScreenBounds.size.height- 64) style:UITableViewStylePlain];
    self.tableView = tableView;
    [self.view addSubview:tableView];
    tableView.delegate = self;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 50;
    
    
    
    
    tableView.dataSource = self.dataSource;
    self.dataSource.delegate = self;
    

    
    UIBarButtonItem *itemRight1 = [[UIBarButtonItem alloc] initWithTitle:@"随机修改" style:UIBarButtonItemStylePlain target:self action:@selector(randomFixSessionTable)];
     UIBarButtonItem *itemRight2 = [[UIBarButtonItem alloc] initWithTitle:@"删除" style:UIBarButtonItemStylePlain target:self action:@selector(clearSessionTable)];
    self.navigationItem.rightBarButtonItems = @[itemRight1,itemRight2];
    
    UIButton *fixTitleView = [UIButton buttonWithType:UIButtonTypeCustom];
    [fixTitleView setTitle:@"修改显示范围" forState:UIControlStateNormal];
    [fixTitleView setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [fixTitleView addTarget:self action:@selector(midifyRange) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = fixTitleView;
}


- (void)clearSessionTable
{
    [[HQDBHelper creatRWConnection] readWriteWithBlock:^(YapDatabaseReadWriteTransaction * _Nonnull transaction) {
        
        [transaction removeAllObjectsInCollection:NSStringFromClass([SessionTable class])];
    }];
}
- (void)randomFixSessionTable
{
    
    [self.dataSource randomModifySomeInfo];
}


- (void)midifyRange
{
    [self.dataSource modifyRange];
    
    [self.tableView reloadData];
}



#pragma mark - AusomeDataSourceDelegate

- (void)tableviewSectionChanges:(NSArray *)sectionChanges rowChanges:(NSArray *)rowChanges
{
    [self.tableView beginUpdates];
    /*
     *** Terminating app due to uncaught exception 'NSInternalInconsistencyException', reason: 'Invalid update: invalid number of rows in section 0.  The number of rows contained in an existing section after the update (5) must be equal to the number of rows contained in that section before the update (5), plus or minus the number of rows inserted or deleted from that section (1 inserted, 3 deleted) and plus or minus the number of rows moved into or out of that section (0 moved in, 0 moved out).'
     */
    for (YapDatabaseViewRowChange *rowChange in rowChanges)
    {
        switch (rowChange.type)
        {
            case YapDatabaseViewChangeDelete :
            {
                [self.tableView deleteRowsAtIndexPaths:@[ rowChange.indexPath ]
                                      withRowAnimation:UITableViewRowAnimationAutomatic];
                break;
            }
            case YapDatabaseViewChangeInsert :
            {
                // 无法及时排序
                [self.tableView insertRowsAtIndexPaths:@[rowChange.newIndexPath]
                                      withRowAnimation:UITableViewRowAnimationAutomatic];
                // chongpai
                //                [self.tableView reloadData];
                break;
            }
            case YapDatabaseViewChangeMove :
            {
                [self.tableView deleteRowsAtIndexPaths:@[ rowChange.indexPath ]
                                      withRowAnimation:UITableViewRowAnimationAutomatic];
                [self.tableView insertRowsAtIndexPaths:@[ rowChange.newIndexPath ]
                                      withRowAnimation:UITableViewRowAnimationAutomatic];
                break;
            }
            case YapDatabaseViewChangeUpdate :
            {
                [self.tableView reloadRowsAtIndexPaths:@[ rowChange.indexPath ]
                                      withRowAnimation:UITableViewRowAnimationNone];
                break;
            }
        }
    }
    
    [self.tableView endUpdates];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForKey:(NSString *)key{
   
    AusomeCell *cell = [tableView dequeueReusableCellWithIdentifier:ausomeCell];
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([AusomeCell class]) owner:nil options:nil].firstObject;
    }
    
    cell.ausome = self.dataSource.ausomeStore[key];
    
    return cell;
}

#pragma mark - Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    
    AusomeCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    DetailViewController *controller = [DetailViewController new];
    
    controller.sessionId = cell.ausome.session.sessionId;
    
    [self.navigationController pushViewController:controller animated:YES];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
