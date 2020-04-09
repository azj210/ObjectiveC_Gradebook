//
//  StudentInfoViewController.m
//  gradebook
//
//  Created by Alex Jiang on 10/9/19.
//  Copyright © 2019 Alex Jiang. All rights reserved.
//

#import "StudentInfoViewController.h"
#import "Model.h"

@interface StudentInfoViewController ()

@property (weak, nonatomic) IBOutlet UITextField *namefill;
@property (weak, nonatomic) IBOutlet UITextField *addressfill;
@property (weak, nonatomic) IBOutlet UITextField *midtermfill;
@property (weak, nonatomic) IBOutlet UITextField *finalfill;
@property (weak, nonatomic) IBOutlet UITextField *hw1fill;
@property (weak, nonatomic) IBOutlet UITextField *hw2fill;
@property (weak, nonatomic) IBOutlet UITextField *hw3fill;
@property (weak, nonatomic) IBOutlet UITextField *photofill;


@end

@implementation StudentInfoViewController


- (IBAction)submittapped:(UIButton *)sender {
    ViewController * parent = self.presentingViewController;
    if (([self.addressfill.text isEqualToString:@""]) ||  ([self.namefill.text isEqualToString:@""])){
        return;
    }
    if (self.isadd == TRUE) {
        Model * stu1 = [[Model alloc]init];
        stu1.name = self.namefill.text;
        stu1.address = self.addressfill.text;
        
        if ([self.midtermfill.text isEqualToString:@""]){
            self.midtermfill.text = @"";
            stu1.midterm = -999;
        }
        else{
            stu1.midterm = [self.midtermfill.text floatValue];
        }
        
        if ([self.finalfill.text isEqualToString:@""]){
            self.finalfill.text = @"";
            stu1.finalexam = -999;
        }
        else{
            stu1.finalexam = [self.finalfill.text floatValue];
        }
        
        if ([self.hw1fill.text isEqualToString:@""]){
            self.hw1fill.text = @"";
            stu1.hw1 = -999;
        }
        else{
            stu1.hw1 = [self.hw1fill.text intValue];
        }
        
        if ([self.hw2fill.text isEqualToString:@""]){
            self.hw2fill.text = @"";
            stu1.hw2 = -999;
        }
        else{
            stu1.hw2 = [self.hw2fill.text intValue];
        }
        
        if ([self.hw3fill.text isEqualToString:@""]){
            self.hw3fill.text = @"";
            stu1.hw3 = -999;
        }
        else{
            stu1.hw3 = [self.hw3fill.text intValue];
        }
        
        stu1.photo = self.photofill.text;
        [self.book addObject: stu1];
        parent.slider.maximumValue += 1;
        parent.next.enabled = YES;
    }
    else {
        self.model.name = self.namefill.text;
        self.model.address = self.addressfill.text;
        if ([self.midtermfill.text isEqualToString:@""]){
            self.midtermfill.text = @"";
            self.model.midterm = -999;
        }
        else{
            self.model.midterm = [self.midtermfill.text floatValue];
        }
        if ([self.finalfill.text isEqualToString:@""]){
            self.finalfill.text = @"";
            self.model.finalexam = -999;
        }
        else{
            self.model.finalexam = [self.finalfill.text floatValue];
        }
        if ([self.hw1fill.text isEqualToString:@""]){
            self.hw1fill.text = @"";
            self.model.hw1 = -999;
        }
        else{
            self.model.hw1 = [self.hw1fill.text intValue];
        }
        if ([self.hw2fill.text isEqualToString:@""]){
            self.hw2fill.text = @"";
            self.model.hw2 = -999;
        }
        else{
            self.model.hw2 = [self.hw2fill.text intValue];
        }
        if ([self.hw3fill.text isEqualToString:@""]){
            self.hw3fill.text = @"";
            self.model.hw3 = -999;
        }
        else{
            self.model.hw3 = [self.hw3fill.text intValue];
        }
        self.model.photo = self.photofill.text;
        
        //ViewController * parent = self.presentingViewController;
        [parent display_students: self.model];
    }
    [parent reset];
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.isadd == FALSE){
        self.namefill.text =  self.model.name;
        self.addressfill.text = self.model.address;
        self.midtermfill.text = [NSString stringWithFormat: @"%d", self.model.midterm];
        self.finalfill.text = [NSString stringWithFormat: @"%d", self.model.finalexam];
        self.hw1fill.text = [NSString stringWithFormat: @"%d", self.model.hw1];
        self.hw2fill.text = [NSString stringWithFormat: @"%d", self.model.hw2];
        self.hw3fill.text = [NSString stringWithFormat: @"%d", self.model.hw3];
        self.photofill.text = self.model.photo;
    }

    // Do any additional setup after loading the view.
}


- (IBAction)goback:(id)sender {
    ViewController * parent = self.presentingViewController;
    [parent reset];
    [self dismissViewControllerAnimated:YES completion:nil];
}
/*
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSLog(@"starting seque %@",segue.identifier);
    if ([segue.identifier isEqualToString:@"completeSignIn"]){
        self.model.name = self.namefill.text;
        self.model.address = self.addressfill.text;
        self.model.midterm = self.midtermfill.text;
        self.model.finalexam = self.finalfill.text;
        self.model.hw1 = self.hw1fill.text;
        self.model.hw2 = self.hw2fill.text;
        self.model.hw3 = self.hw3fill.text;
        self.model.photo = self.photofill.text;
    }
        
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
