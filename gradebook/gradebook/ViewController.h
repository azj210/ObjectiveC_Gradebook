//
//  ViewController.h
//  gradebook
//
//  Created by Alex Jiang on 10/7/19.
//  Copyright © 2019 Alex Jiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"
#import "StudentInfoViewController.h"
#import "PhotoViewController.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UISegmentedControl *segue;
@property (weak, nonatomic) IBOutlet UILabel *namefill;
@property (weak, nonatomic) IBOutlet UILabel *addressfill;
@property (weak, nonatomic) IBOutlet UILabel *midtermfill;
@property (weak, nonatomic) IBOutlet UILabel *finalfill;
@property (weak, nonatomic) IBOutlet UILabel *hw1fill;
@property (weak, nonatomic) IBOutlet UILabel *hw2fill;
@property (weak, nonatomic) IBOutlet UILabel *hw3fill;
@property (weak, nonatomic) IBOutlet UIButton *prev;
@property (weak, nonatomic) IBOutlet UIButton *next;
@property (weak, nonatomic) IBOutlet UISlider *slider;

@property BOOL isadd;
@property int count;
@property NSMutableArray * book;

- (void) display_students:(Model *)student;
- (void) reset;


@end

