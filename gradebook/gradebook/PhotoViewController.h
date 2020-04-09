//
//  PhotoViewController.h
//  gradebook
//
//  Created by Alex Jiang on 10/9/19.
//  Copyright © 2019 Alex Jiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "Model.h"

NS_ASSUME_NONNULL_BEGIN

@interface PhotoViewController : UIViewController

@property Model *model;
@property BOOL isadd;
@property float avg;
@property (strong, nonatomic) NSMutableArray *book;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *back;
@property (weak, nonatomic) IBOutlet UILabel *studentfill;
@property (weak, nonatomic) IBOutlet UILabel *addressfill;
@property (weak, nonatomic) IBOutlet UILabel *avgfill;
@property (weak, nonatomic) IBOutlet UIImageView *image;





@end

NS_ASSUME_NONNULL_END
