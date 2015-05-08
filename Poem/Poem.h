//
//  Poem.h
//  Poem
//
//  Created by vade on 5/8/15.
//  Copyright (c) 2015 Larissa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Poem : NSObject
@property (atomic, readwrite, strong) NSArray* attributedLines;
@property (atomic, readwrite, strong) NSAttributedString* poem;
@property (atomic, readwrite, strong) NSAttributedString* poemTitle;

- (id) initWithPoemFile:(NSURL*)poemURL NS_DESIGNATED_INITIALIZER;

@end
