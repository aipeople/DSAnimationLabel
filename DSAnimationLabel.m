//
//  DSAnimationLabel.m
//  Caloriemeter
//
//  Created by 蘇 on 12/12/19.
//  Copyright (c) 2012年 蘇. All rights reserved.
//

#import "DSAnimationLabel.h"

static NSString *DSDictionaryKey_StartIndex = @"startIndex";
static NSString *DSDictionaryKey_EndIndex = @"EndIndex";

@implementation DSAnimationLabel

- (DSAnimationLabel *)initWithFrame:(CGRect)frame andStrings:(NSArray *) strings{
    
    self = [super initWithFrame:frame];
    if (self) {
        frameNum = 0;
        self.stringArray = [NSMutableArray arrayWithArray:strings];
        self.text = [self.stringArray objectAtIndex:0];
        self.animateSpeed = 1.0f;
    }
    return self;
}

- (void)startAnimation {
    
    [self startAnimationFromIndex:0 toIndex:[self.stringArray count] -1];
}

- (void)startAnimationFromIndex:(NSInteger)startIndex toIndex:(NSInteger)endIndex {
    
    self.text = [self.stringArray objectAtIndex:startIndex];
    NSDictionary *tempDictionary = @{DSDictionaryKey_StartIndex : [NSNumber numberWithInteger:startIndex], DSDictionaryKey_EndIndex : [NSNumber numberWithInteger:endIndex]};
    animationTimer = [NSTimer scheduledTimerWithTimeInterval:self.animateSpeed target:self selector:@selector(animation) userInfo:tempDictionary repeats:YES];
}

- (void)stopAnimationWithString:(NSString *)string {
    
    [animationTimer invalidate];
    animationTimer = nil;
    
    self.text = string;
    frameNum = 0;
}

- (void)stopAnimationWithIndex:(NSInteger)index {
    
    [animationTimer invalidate];
    animationTimer = nil;
    
    self.text = [self.stringArray objectAtIndex:index];
    frameNum = 0;
}

- (void)stopAnimation {
    
    [animationTimer invalidate];
    animationTimer = nil;
    
    frameNum = 0;
}
- (void)animation {
    
    NSDictionary *rangeDictionary =  animationTimer.userInfo;
    int startIndex = [rangeDictionary[DSDictionaryKey_StartIndex] intValue];
    int endIndex   = [rangeDictionary[DSDictionaryKey_EndIndex] intValue];
    self.text = [self.stringArray objectAtIndex: frameNum%(endIndex -startIndex +1) +startIndex];
    
    frameNum ++;
}

@end
