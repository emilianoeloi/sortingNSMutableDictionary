//
//  iOSDevTableViewController.m
//  ExperimentoUm
//
//  Created by Emiliano Barbosa on 05/02/15.
//  Copyright (c) 2015 Pontomobi. All rights reserved.
//

#import "iOSDevTableViewController.h"
#import "Enumeration.h"

@interface iOSDevTableViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSMutableDictionary *develepersList;
@property (weak, nonatomic) IBOutlet UITableView *developers;
@property (nonatomic, strong) NSArray *sortedKeys;

@end

@implementation iOSDevTableViewController

- (IBAction)sorting:(id)sender forEvent:(UIEvent *)event {
    NSArray *keys;
    switch (((UISegmentedControl *)sender).selectedSegmentIndex)
    {
        case AscendingSorting:
            _sortedKeys = [_develepersList keysSortedByValueUsingSelector:@selector(compare:)];
            break;
        case DescendingSorting:
            _sortedKeys = [_develepersList keysSortedByValueUsingComparator:^NSComparisonResult(id obj1, id obj2) {
                return [obj2 compare:obj1];
            }];
            break;
        case WithoutSorting:
        default:
            _sortedKeys = [_develepersList allKeys];
            break; 
    }
    [_developers reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _develepersList = [[NSMutableDictionary alloc]init];
    
    [_develepersList setValue:@"ma Márcia" forKey:@"35"];
    [_develepersList setValue:@"fi Filipe" forKey:@"17"];
    [_develepersList setValue:@"ed Eduardo" forKey:@"13"];
    [_develepersList setValue:@"ma Marco Túlio" forKey:@"14"];
    [_develepersList setValue:@"je Jean" forKey:@"17"];
    [_develepersList setValue:@"ma Marlon" forKey:@"40"];
    [_develepersList setValue:@"ra Rafael Coelho" forKey:@"78"];
    [_develepersList setValue:@"em Emiliano" forKey:@"444"];
    [_develepersList setValue:@"th Thiago Alves" forKey:@"65"];
    
    _developers.dataSource = self;
    _developers.delegate = self;
    
    [self sorting:[[UISegmentedControl alloc]init] forEvent:nil];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return _develepersList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ioddevelopersCell_ID"    forIndexPath:indexPath];
    
    NSString *key = [_sortedKeys objectAtIndex:indexPath.row];
    
    NSString *devName = [_develepersList valueForKey:key];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%d %@ %@",indexPath.row, key, devName];
    
    return cell;
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
