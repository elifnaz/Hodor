//
//  QuotesTableViewController.m
//  QuotesTableView
//
//  Created by Elif Naz Aydin on 10/25/15.
//  Copyright © 2015 Elif Aydin. All rights reserved.
//

#import "QuotesTableViewController.h"

@interface QuotesTableViewController ()


@end

@implementation QuotesTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.model = [QuotesModel sharedModel];
    
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    
    return [self.model numberOfQuotes];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    static NSString *CellIdentifier = @"TableCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    NSDictionary *quote = [self.model quoteAtIndex:indexPath.row];

    if (cell == nil)
    {
        
        cell = [[UITableViewCell alloc] initWithFrame:CGRectZero];
    }
    
 
    cell.textLabel.text = quote[@"quote"];
    cell.detailTextLabel.text = quote[@"author"];
    
    
    
    return cell;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete from the model
        
     
        [self.model removeQuoteAtIndex:indexPath.row];
        
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        
       // [tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    AddQuoteViewController *inputVC = segue.destinationViewController;
    inputVC.completionHandler = ^(NSString *quote, NSString *author) {
        if (quote != nil && author != nil) {
            NSUInteger index = [self.model numberOfQuotes];
            
            [self.model insertQuote:quote author:author atIndex:index];

        
            NSArray *path = [NSArray arrayWithObject:[NSIndexPath indexPathForRow:[self.model numberOfQuotes] -1  inSection:0]];
            
            [[self tableView] insertRowsAtIndexPaths:path withRowAnimation:UITableViewRowAnimationTop];
            
        }
        [self dismissViewControllerAnimated:YES completion:nil];
    };
}
- (void) viewWillAppear: (BOOL) animated {
    [super viewWillAppear: animated];
    [self.tableView reloadData];
}

@end


