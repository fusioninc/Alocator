//
//  ViewController.h
//  Alocator
//
//  Created by Fusion on 6/11/15.
//  Copyright (c) 2015 Jason Kuang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *beerPercentTextField;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (weak, nonatomic) IBOutlet UISlider *beerCountSlider;

- (void)buttonPressed:(UIButton *)sender;
- (float)calculateGlassesOfWine:(int) numberOfBeers alcoholByVolume:(float) alcoholByVolume;

@end

