//
//  DetailViewController.m
//  CData
//
//  Created by Hussain  on 23/3/16.
//  Copyright © 2016 Hussain . All rights reserved.
//

#import "DetailViewController.h"
#import "Appdelegate.h"
@interface DetailViewController ()

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
            
        // Update the view.
        [self configureView];
    }
}


- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        self.detailDescriptionLabel.text = [[self.detailItem valueForKey:@"name"] description];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)searchPerson:(id)sender{
    AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    NSManagedObjectContext *context = appDelegate.managedObjectContext;
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"Event" inManagedObjectContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    [request setEntity:entityDesc];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(name contains[cd] %@)",self.detailDescriptionTxt.text];
    [request setPredicate:predicate];
    NSArray *searchResults = [context executeFetchRequest:request error:nil];
    NSString *nameStr = nil;
    if (searchResults && searchResults.count){
    NSManagedObject *managedObject = searchResults[0];
    nameStr = [managedObject valueForKey:@"name"];
    }
    else{
    nameStr = @"No Results Found";
    }
    [self.detailDescriptionLabel setText:nameStr];
}

@end
