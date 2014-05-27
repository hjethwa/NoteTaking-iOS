//
//  DetailViewController.m
//  NoteTaking
//
//  Created by Harshal Jethwa on 2014-05-26.
//  Copyright (c) 2014 Harshal Jethwa. All rights reserved.
//

#import "DetailViewController.h"
#import "Data.h"

@interface DetailViewController ()
- (void)configureView;
@end

@implementation DetailViewController

@synthesize mTextView;

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        [Data setCurrentKey:_detailItem];
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    NSString *currentNote = [[Data getAllNotes] objectForKey:[Data getCurrentKey]];
    if(![currentNote isEqualToString:kDefaultText]){
        self.mTextView.text = currentNote;
    } else {
        self.mTextView.text = @"";
    }
    [self.mTextView becomeFirstResponder];
}

- (void) viewWillDisappear:(BOOL)animated
{
    if (![self.mTextView.text isEqualToString:@""]){
        [Data setNoteForCurrentKey:self.mTextView.text];
    } else {
        [Data removeNoteForKey:[Data getCurrentKey]];
    }
    [Data saveNotes];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
