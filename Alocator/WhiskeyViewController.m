//
//  WhiskeyViewController.m
//  Alocator
//
//  Created by Fusion on 6/12/15.
//  Copyright (c) 2015 Jason Kuang. All rights reserved.
//

#import "WhiskeyViewController.h"

@interface WhiskeyViewController ()

@end

@implementation WhiskeyViewController

- (IBAction)sliderValueDidChange:(UISlider *)sender {
    NSLog(@"Slider value changed to %f", sender.value);
        
    //Whiskey (2 glasses)
    int numberOfWhiskey = self.beerCountSlider.value;
    float numberOfWhiskeyGlassesForEquivalentAlcoholAmount = [self calculateGlassesOfWhiskey:numberOfWhiskey alcoholByVolume:[self.whiskeyPercentTextField.text floatValue]];
    NSString *titleStringWhiskey = [NSString stringWithFormat:(@"Whiskey (%.1f glasses)"),numberOfWhiskeyGlassesForEquivalentAlcoholAmount];
    self.title = titleStringWhiskey;
    [self.whiskeyPercentTextField resignFirstResponder];
}

- (void)buttonPressed:(UIButton *)sender; {
    [self.beerPercentTextField resignFirstResponder];
    
    int numberOfBeers = self.beerCountSlider.value;
    
    float numberOfWhiskeyGlassesForEquivalentAlcoholAmount = [self calculateGlassesOfWhiskey:numberOfBeers alcoholByVolume:[self.whiskeyPercentTextField.text floatValue]];
    
    NSString *beerText;
    
    if (numberOfBeers == 1) {
        beerText = NSLocalizedString(@"beer", @"singular beer");
    } else {
        beerText = NSLocalizedString(@"beers", @"plural of beer");
    }
    
    NSString *whiskeyText;
    
    if (numberOfWhiskeyGlassesForEquivalentAlcoholAmount == 1) {
        whiskeyText = NSLocalizedString(@"shot", @"singular shot");
    } else {
        whiskeyText = NSLocalizedString(@"shots", @"plural of shot");
    }
    NSString *resultText = [NSString stringWithFormat:NSLocalizedString(@"%d %@ (with %.2f%% alcohol) contains as much alcohol as %.1f %@ of whiskey.", nil), numberOfBeers, beerText, [self.whiskeyPercentTextField.text floatValue], numberOfWhiskeyGlassesForEquivalentAlcoholAmount, whiskeyText];
    self.resultLabel.text = resultText;
}


- (float)calculateGlassesOfWhiskey:(int)numberOfBeers alcoholByVolume:(float)alcoholByVolume {
    
    int ouncesInOneBeerGlass = 12; //assume 12 oz. bottle
    float alcoholPercentageOfBeer = alcoholByVolume / 100;
    float ouncesOfAlcoholPerBeer = ouncesInOneBeerGlass * alcoholPercentageOfBeer;
    float ouncesOfAlcoholTotal = ouncesOfAlcoholPerBeer * numberOfBeers;
    // now, calculate the equivalent amount of whiskey...
    float ouncesInOneWhiskeyGlass = 1;  //   1oz of shot
    float alcoholPercentageOfWhiskey = 0.4;  // 80 proof
    float ouncesOfAlcoholPerWhiskeyGlass = ouncesInOneWhiskeyGlass * alcoholPercentageOfWhiskey;
    float numberOfWhiskeyGlassesForEquivalentAlcoholAmount = ouncesOfAlcoholTotal / ouncesOfAlcoholPerWhiskeyGlass;
    
    return numberOfWhiskeyGlassesForEquivalentAlcoholAmount;
}

@end
