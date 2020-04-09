//
//  PhotoViewController.m
//  gradebook
//
//  Created by Alex Jiang on 10/9/19.
//  Copyright © 2019 Alex Jiang. All rights reserved.
//

#import "PhotoViewController.h"

@interface PhotoViewController ()

@end

@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.model.midterm == -999 || self.model.finalexam == -999 || self.model.hw1 == -999 || self.model.hw2 == -999 || self.model.hw3 == -999){
        self.avgfill.text = @"pending";
    }
    else{
        self.avg = self.model.midterm * 0.3 + self.model.finalexam * 0.4 + self.model.hw1+self.model.hw2+self.model.hw3;
        self.avgfill.text = [NSString stringWithFormat: @"%.2f", self.avg];
    }
   // self.avg = self.model.midterm * 0.3 + self.model.finalexam * 0.4 + self.model.hw1+self.model.hw2+self.model.hw3;
    if (self.model.photo.length == 0){
        //self.model.photo = @"blank_profile_picture.png";
        self.image.image = [UIImage imageNamed:@"blank_profile_picture.png"];
    }
    
    else if ([UIImage imageNamed:(self.model.photo)] == Nil)
    {
        self.image.image = [UIImage imageNamed:@"blank_profile_picture.png"];

    }
    
    else{
        //self.image.image = [UIImage imageNamed:@"blank_profile_picture.png"];
        self.image.image = [UIImage imageNamed:(self.model.photo)];
    }
    self.studentfill.text = self.model.name;
    self.addressfill.text = self.model.address;
    //self.avgfill.text = [NSString stringWithFormat: @"%f", self.avg];
    // Do any additional setup after loading the view.
}


- (IBAction)goback:(id)sender {
    ViewController * parent = self.presentingViewController;
    [parent reset];
    [self dismissViewControllerAnimated:YES completion:nil];
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
