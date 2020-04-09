//
//  StudentInfoViewController.h
//  gradebook
//
//  Created by Alex Jiang on 10/9/19.
//  Copyright © 2019 Alex Jiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
// @class ViewController;

NS_ASSUME_NONNULL_BEGIN
@class Model;

@interface StudentInfoViewController : UIViewController

@property (strong, nonatomic) Model *model;
@property (strong, nonatomic) NSMutableArray *tracker;
@property (strong, nonatomic) NSMutableArray *book;
@property BOOL isadd;
// @property  ViewController *parent;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *back;


@property (weak, nonatomic) IBOutlet UIButton *submit;




@end

NS_ASSUME_NONNULL_END
