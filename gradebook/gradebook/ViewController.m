//
//  ViewController.m
//  gradebook
//
//  Created by Alex Jiang on 10/7/19.
//  Copyright © 2019 Alex Jiang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //every time we go back to this interface we need to set this back to -1 every time
    self.segue.selectedSegmentIndex = -1;
    //init an object
    self.book = [[NSMutableArray alloc] init];
    self.count = 0;
    self.prev.enabled = NO;
    //hardcoding student info
    //Models are the student's types
    
    //example
    
    
    Model * stu1 = [[Model alloc]init];
    stu1.name = @"alex";
    stu1.address = @"aaaa";
    stu1.midterm = 100;
    stu1.finalexam = 100;
    stu1.hw1 = 10;
    stu1.hw2 = 10;
    //NSLog(@"%@",stu1.name);
    stu1.hw3 = 10;
    stu1.photo = @"eeyore.png";
    /*
    Model * stu2 = [[Model alloc]init];
    stu2.name = @"alex2";
    stu2.address = @"aaaa2";
    stu2.midterm = 9;
    stu2.finalexam = 3;
    stu2.hw1 = 5;
    stu2.hw2 = 12;
    stu2.hw3 = 0;
     */
    //stu2.photo = @"fatpooh.png";
    
    //self.addressfill.text = stu1.address;
    [self.book addObject: stu1];
    //[self.book addObject: stu2];
    [self display_students: self.book[self.count]];
    //[self display_students: stu2];
    //int track = [self.book count] -1;
    //NSLog(@"%d",track);
    if ([self.book count] == 1) {
        self.next.enabled = NO;
    }
    self.slider.maximumValue = [self.book count]-1;
    
    
    
    // Do any additional setup after loading the view.
}

- (void) display_students:(Model *)student{
    self.namefill.text = student.name;
    self.addressfill.text = student.address;
    self.midtermfill.text = [NSString stringWithFormat: @"%d", student.midterm];
    self.finalfill.text = [NSString stringWithFormat: @"%d", student.finalexam];
    self.hw1fill.text = [NSString stringWithFormat: @"%d", student.hw1];
    self.hw2fill.text = [NSString stringWithFormat: @"%d", student.hw2];
    self.hw3fill.text = [NSString stringWithFormat: @"%d", student.hw3];
    //self.photofill.text = student.photo;
}

- (IBAction)prevstudent:(id)sender {
    self.next.enabled = YES;
    self.count -= 1;
    if (self.count < 0){
        self.prev.enabled = NO;
        self.count = 0;
    }
    self.slider.value = self.count;
    [self display_students: self.book[self.count]];
    if (self.count == 0){
        self.prev.enabled = NO;
    }
}

- (IBAction)nextstudent:(id)sender {
    self.prev.enabled = YES;
    if (self.count == [self.book count]-1){
        self.next.enabled = NO;
        return;
    }
    else{
        self.count += 1;
    }
    self.slider.value = self.count;
    [self display_students: self.book[self.count]];
    if (self.count == [self.book count]-1){
        self.next.enabled = NO;
    }
}


- (IBAction)sliderid:(id)sender {
    self.count = (int)(self.slider.value+0.5);
    self.prev.enabled = YES;
    self.next.enabled = YES;
    if (self.count == [self.book count]-1){
        self.next.enabled = NO;
    }
    else if (self.count == 0){
        self.prev.enabled = NO;
        self.count = 0;
    }
    NSLog(@"%f %d",self.slider.value, self.count);
    [self display_students: self.book[self.count]];
    /*
    if (self.count == [self.book count]-1){
        self.next.enabled = NO;
    }
    else if (self.count == 0){
            self.prev.enabled = NO;
    }
    */
    
}







- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"toupdateornew"]){
        StudentInfoViewController *siVC = segue.destinationViewController;
        siVC.isadd = self.isadd;
        siVC.book = self.book;
        siVC.model = self.book[self.count];
        // siVC.parent = self;
    }
    else{
        PhotoViewController *photoVC = segue.destinationViewController;
        photoVC.model = self.book[self.count];
    }
}

- (void) reset{
    self.segue.selectedSegmentIndex = -1;
}

- (IBAction)toupdate:(UISegmentedControl *)sender {
    if (sender.selectedSegmentIndex == 2){
        //NSLog(@"%i",sender.selectedSegmentIndex);
        self.isadd = TRUE;
        [self performSegueWithIdentifier:(@"toupdateornew") sender:(sender)];
    }
    if (sender.selectedSegmentIndex == 0){
        self.isadd = FALSE;
        [self performSegueWithIdentifier:(@"toupdateornew") sender:(sender)];
    }
    else{
        [self performSegueWithIdentifier:(@"todetails") sender:(sender)];
    }
}











@end
