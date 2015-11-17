//
//  FavoritesTableViewController.m
//  Lab5
//
//  Created by Elif Naz Aydin on 11/9/15.
//  Copyright © 2015 Elif Aydin. All rights reserved.
//

#import "FavoritesTableViewController.h"


@interface FavoritesTableViewController ()

@end

@implementation FavoritesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.model = [QuotesModel sharedModel];
    
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
}

- (void) viewWillAppear: (BOOL) animated {
    [super viewWillAppear: animated];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.model numberOfFavorites];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    static NSString *CellIdentifier = @"FavCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        
        cell = [[UITableViewCell alloc] initWithFrame:CGRectZero];
    }
    NSDictionary *quote = [self.model favoriteAtIndex:indexPath.row];

    cell.textLabel.text = quote[@"quote"];
    cell.detailTextLabel.text = quote[@"author"];
    
    return cell;
}



- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {

        [self.model removeFavoriteAtIndex:indexPath.row];
        

        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
      
        
    }
}


@end