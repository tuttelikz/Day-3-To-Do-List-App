//
//  ViewController.m
//  Day 3 To Do List App
//
//  Created by Sanzhar Askaruly on 6/11/15.
//  Copyright (c) 2015 Sanzhar Askaruly. All rights reserved.
//

#import "ViewController.h"
#import "AddTaskViewController.h"
#import "DisplayTaskViewController.h"

@interface ViewController () <AddTaskViewControllerDelegate, UITableViewDataSource, UITableViewDelegate, DisplayTaskViewControllerDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *tasks;

@end

@implementation ViewController
- (IBAction)editButtonPressed:(id)sender {
    if (self.tableView.editing) {
        [self.tableView setEditing:NO animated:YES];
    } else {
        [self.tableView setEditing:YES animated:YES];
    }
}
-(void)didAddTask:(Task *)task {
    [self.tasks addObject:task];
    [self.navigationController popViewControllerAnimated:YES];
    [self.tableView reloadData];
    [self saveTasks];
}
-(void)didEditTask:(Task *)task {
    [self.tasks addObject:task];
    [self.navigationController popViewControllerAnimated:YES];
    [self.tableView reloadData];
    [self saveTasks];
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.destinationViewController isKindOfClass:[AddTaskViewController class]]) {
        AddTaskViewController *nextController = segue.destinationViewController;
        nextController.delegate = self;
    }
    if([segue.destinationViewController isKindOfClass:[DisplayTaskViewController class]]) {
        DisplayTaskViewController *nextController = segue.destinationViewController;
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        nextController.task = [self.tasks objectAtIndex:indexPath.row];
        nextController.delegate = self;
    }
}
-(NSDictionary *) taskAsDictionary: (Task *) task {
    NSDictionary *dict = @{TASK_TITLE: task.title, TASK_DESCR: task.descr, TASK_DATE: task.date, TASK_COMPLETION: @(task.isCompleted)};
    return dict;
}

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

-(Task *) taskFromDictionary: (NSDictionary *) dict {
    return [[Task alloc] initWithData:dict];
}

-(void) saveTasks {
    NSMutableArray *dicts = [NSMutableArray new];
    for (int i=0; i<[self.tasks count]; i++) {
        [dicts addObject:[self taskAsDictionary:self.tasks[i]]];
    }
    [[NSUserDefaults standardUserDefaults] setObject:dicts forKey:TASK_OBJECTS_KEY];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(BOOL) isDate: (NSDate *)date GreaterThan: (NSDate *)toDate {
    NSTimeInterval dateInterval = [date timeIntervalSince1970];
    NSTimeInterval todateInterval = [toDate timeIntervalSince1970];
    if (dateInterval>todateInterval) return YES; else return NO;
}


-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.tasks removeObjectAtIndex:indexPath.row];
        [self saveTasks];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}
-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    Task *task = self.tasks[sourceIndexPath.row];
    [self.tasks removeObjectAtIndex:sourceIndexPath.row];
    [self.tasks insertObject:task atIndex:destinationIndexPath.row];
    [self saveTasks];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.tasks count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    Task *task = self.tasks[indexPath.row];
    cell.textLabel.text = task.title;
    
    UIImage *image = task.image;        //This is where we implement image
    cell.imageView.image = image;
    
    
    
    
    NSDateFormatter *formatter = [NSDateFormatter new];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *stringFromDate = [formatter stringFromDate:task.date];
    cell.detailTextLabel.text = stringFromDate;
    
    BOOL isOverDue = [self isDate:[NSDate date] GreaterThan:task.date];
    if (task.isCompleted) cell.backgroundColor = [UIColor greenColor];
    else if (isOverDue) cell.backgroundColor = [UIColor redColor];
    else cell.backgroundColor = [UIColor yellowColor];
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //[self performSegueWithIdentifier:@"displaySegue" sender:self];
}


-(void) updateTaskCompletion: (Task *) task {
    if (task.isCompleted) task.isCompleted = NO; else task.isCompleted = YES;
    [self saveTasks];
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tasks = [NSMutableArray new];
    NSArray *dicts = [[NSUserDefaults standardUserDefaults]arrayForKey:TASK_OBJECTS_KEY];
    for (NSDictionary *dict in dicts) {
        [self.tasks addObject:[self taskFromDictionary:dict]];
    }
    // Do any additional setup after loading the view, typically from a nib.
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
