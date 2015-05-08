//
//  ViewController.m
//  Poem
//
//  Created by vade on 5/8/15.
//  Copyright (c) 2015 Larissa. All rights reserved.
//

#import "BasePoemViewController.h"
#import "Poem.h"

@interface BasePoemViewController ()
@property (atomic, readwrite, strong) Poem* poem;
@property (atomic, readwrite, strong) IBOutlet UITextView* poemTextView;
@property (atomic, readwrite, strong) IBOutlet UILabel* poemTextTitleLabel;

@property (atomic, readwrite, strong) IBOutlet UITapGestureRecognizer* tapGestureRecognizer;
@end

@implementation BasePoemViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Ensure our Gesture Recognizer is hoooked up appropriately.
    [self.poemTextView addGestureRecognizer:self.tapGestureRecognizer];
    
    // Do any additional setup after loading the view, typically from a nib.

    NSURL* poem1URL = [[NSBundle mainBundle] URLForResource:@"Poem1" withExtension:@"rtf"];
    self.poem = [[Poem alloc] initWithPoemFile:poem1URL];
    
    self.poemTextView.attributedText = nil;
    self.poemTextTitleLabel.attributedText = self.poem.poemTitle;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

static NSUInteger tapCount = 0;
- (IBAction)tapToAppendLine:(id)sender
{
    NSLog(@"Tapped our text view %i", tapCount);
    
    // Copy our Mutable String we have in our poem text
    NSMutableAttributedString* poemAttributedString = [self.poemTextView.attributedText mutableCopy];
    
    [poemAttributedString appendAttributedString:self.poem.attributedLines[tapCount]];

    self.poemTextView.attributedText = poemAttributedString;
    
    tapCount++;

}

@end
