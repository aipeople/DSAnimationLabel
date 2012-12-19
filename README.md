DSAnimationLabel
================

Animation Label

ex:

    NSArray *tempArray = [[NSArray alloc] initWithObjects:@"test1", @"test2", @"test3", nil];
    
    DSAnimationLabel *testString = [[DSAnimationLabel alloc] initWithFrame:CGRectMake(0, 0, 320, 24) andStrings:tempArray];
    [self.view addSubview:testString];
    
    [testString startAnimation];
    
    //...
    
    [testString stopAnimation];
