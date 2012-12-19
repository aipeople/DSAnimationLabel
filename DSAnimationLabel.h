//
//  DSAnimationLabel.h
//  Caloriemeter
//
//  Created by 蘇
//  Copyright (c) 2012年 蘇. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DSAnimationLabel : UILabel{
    
    int frameNum;
    NSTimer *animationTimer;
}
@property (nonatomic, readwrite) float animateSpeed;
@property (nonatomic, strong) NSMutableArray *stringArray;

- (DSAnimationLabel *)initWithFrame:(CGRect)frame andStrings:(NSArray *) strings;
- (void)startAnimationFromIndex:(NSInteger)startIndex toIndex:(NSInteger)endIndex;
- (void)startAnimation;
- (void)stopAnimationWithString:(NSString *)string;
- (void)stopAnimationWithIndex:(NSInteger)index;
- (void)stopAnimation;
@end
