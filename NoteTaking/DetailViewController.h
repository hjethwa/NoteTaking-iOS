//
//  DetailViewController.h
//  NoteTaking
//
//  Created by Harshal Jethwa on 2014-05-26.
//  Copyright (c) 2014 Harshal Jethwa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UITextView *mTextView;
@end
