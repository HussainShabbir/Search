//
//  DetailViewController.h
//  CData
//
//  Created by Hussain  on 23/3/16.
//  Copyright © 2016 Hussain . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UITextField *detailDescriptionTxt;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (strong, nonatomic) IBOutlet UILabel *findLabel;
@end

