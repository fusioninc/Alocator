//
//  WhiskeyViewController.h
//  Alocator
//
//  Created by Fusion on 6/12/15.
//  Copyright (c) 2015 Jason Kuang. All rights reserved.
//

#import "ViewController.h"

@interface WhiskeyViewController : ViewController

@property (weak, nonatomic) IBOutlet UISlider *whiskeyCountSlider;
@property (weak, nonatomic) IBOutlet UITextField *whiskeyPercentTextField;

- (float)calculateGlassesOfWhiskey:(int) numberOfBeers alcoholByVolume:(float) alcoholByVolume;

@end

