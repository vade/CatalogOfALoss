//
//  Poem.m
//  Poem
//
//  Created by vade on 5/8/15.
//  Copyright (c) 2015 Larissa. All rights reserved.
//

#import "Poem.h"

@implementation Poem

- (id) initWithPoemFile:(NSURL*)poemURL
{
    self = [super init];
    if(self)
    {

        NSAttributedString* poemAttributedString = [[NSAttributedString alloc] initWithFileURL:poemURL options:nil documentAttributes:nil error:nil];
        // Underlying Attributed String for our Poem that isnt broken up by lines
        self.poem = poemAttributedString;

        // Enumerate our string by lines and make new attibuted strings for every string
        NSMutableArray* attributedStringsFromLines = [NSMutableArray new];
        
        NSString* underlyingPoemString = poemAttributedString.string;
        
        [underlyingPoemString enumerateSubstringsInRange:NSMakeRange(0, underlyingPoemString.length - 1)
                                             options:NSStringEnumerationByLines
                                          usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop){
                                              
                                              if(substringRange.length > 0 )
                                              {
                                                  NSAttributedString* poemLineAttributedString = [poemAttributedString attributedSubstringFromRange:substringRange];
                                                  
                                                  [attributedStringsFromLines addObject:poemLineAttributedString];
                                              }
                                          }];
        
        // Make our Mutable Array a simple immutable copy, and assign that to our attributedLines
        self.attributedLines = [attributedStringsFromLines copy];
        
        self.poemTitle = self.attributedLines[0];
        
    }
    return self;
}


@end
