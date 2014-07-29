//
//  ViewController.m
//  RainboxTable
//
//  Created by Nicolas Semenas on 28/07/14.
//  Copyright (c) 2014 Nicolas Semenas. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *colorTableView;
@property NSMutableArray *colors;


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.colors = [NSMutableArray arrayWithObjects:
                   [UIColor redColor],
                   [UIColor blueColor],
                   [UIColor greenColor], nil];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onAddRandomColor:(id)sender {
    
    float red = (float)rand()/RAND_MAX;
    float blue = (float)rand()/RAND_MAX;
    float green = (float)rand()/RAND_MAX;
    
    UIColor *color = [UIColor colorWithRed:red green:green blue:blue alpha:1.0f];
    
    [self.colors addObject:color];
    [self.colorTableView reloadData];
    
    


}

#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
 
    return self.colors.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell;
    cell = [tableView dequeueReusableCellWithIdentifier:@"somethingUsefulID"];
    cell.textLabel.text = [NSString stringWithFormat:@"Row %i", indexPath.row];

    cell.backgroundColor = [self.colors objectAtIndex: indexPath.row];
    
    return cell;

    
}


@end
