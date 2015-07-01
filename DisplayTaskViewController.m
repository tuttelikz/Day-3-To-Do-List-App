//
//  DisplayTaskViewController.m
//  Day 3 To Do List App
//
//  Created by Sanzhar Askaruly on 6/11/15.
//  Copyright (c) 2015 Sanzhar Askaruly. All rights reserved.
//

#import "DisplayTaskViewController.h"
#import "Task.h"
#import "ViewController.h"

@interface DisplayTaskViewController ()
@property (strong, nonatomic) IBOutlet UITextField *titleTextField;
@property (strong, nonatomic) IBOutlet UITextField *descriptionTextField;
@property (strong, nonatomic) IBOutlet UISwitch *theSwitch;



@end

@implementation DisplayTaskViewController 


- (void)viewDidLoad {
    [super viewDidLoad];
   
    //[self.delegate didEditTask:self.task];
    // Do any additional setup after loading the view.
}
- (IBAction)theSwitchChanged:(id)sender {
    if (self.theSwitch.on) {
        self.task.isCompleted = YES;
    }
    else self.task.isCompleted = NO;
}

- (IBAction)savePressed:(id)sender {
    self.task.title = self.titleTextField.text;
    self.task.descr = self.descriptionTextField.text;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
