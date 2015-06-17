//
//  ViewController.m
//  Alocator
//
//  Created by Fusion on 6/11/15.
//  Copyright (c) 2015 Jason Kuang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Alcolator";
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)textFieldDidChange:(UITextField *)sender {
    NSString *enteredText = sender.text;
    float enterNumber = [enteredText floatValue];
    if (enterNumber == 0) {
        //The user type 0, or something that's not a number, so clear the field.
        sender.text = nil;
    }
}

- (IBAction)sliderValueDidChange:(UISlider *)sender {
    NSLog(@"Slider value changed to %f", sender.value);
    //Wine (2 glasses)
    int numberOfBeers = self.beerCountSlider.value;
    float numberOfWineGlassesForEquivalentAlcoholAmount = [self calculateGlassesOfWine:numberOfBeers alcoholByVolume:[self.beerPercentTextField.text floatValue]];
    NSString *titleString = [NSString stringWithFormat:@"Wine (%.1f glasses)",numberOfWineGlassesForEquivalentAlcoholAmount];
    self.title = titleString;
    [self.beerPercentTextField resignFirstResponder];
}

- (IBAction)buttonPressed:(UIButton *)sender {
    [self.beerPercentTextField resignFirstResponder];
    //first, calculate how much alcohol is in all those beer...
    int numberOfBeers = self.beerCountSlider.value;
    float numberOfWineGlassesForEquivalentAlcoholAmount = [self calculateGlassesOfWine:numberOfBeers alcoholByVolume:[self.beerPercentTextField.text floatValue]];
    // decide whether to use "beer"/"beers" and "glass"/"glasses"
    NSString *beerText;
    if (self.beerCountSlider.value == 1) {
        beerText = NSLocalizedString(@"beer", @"singular beer");
    } else {
        beerText = NSLocalizedString(@"beers", @"plural of beer");
    }
    NSString *wineText;
    if (numberOfWineGlassesForEquivalentAlcoholAmount == 1) {
        wineText = NSLocalizedString(@"glass", @"singular glass");
    } else {
        wineText = NSLocalizedString(@"glasses", @"plural of glass");
    }
    // generate the result text, and display it on the label
    NSString *resultText = [NSString stringWithFormat:NSLocalizedString(@"%d %@ (with %.2f%% alcohol) contains as much alcohol as %.1f %@ of wine.", nil), numberOfBeers, beerText,  [self.beerPercentTextField.text floatValue], numberOfWineGlassesForEquivalentAlcoholAmount, wineText];
    self.resultLabel.text = resultText;
}
- (IBAction)tapGestureDidFire:(UITapGestureRecognizer *)sender {
    [self.beerPercentTextField resignFirstResponder];
}

- (float)calculateGlassesOfWine:(int) numberOfBeers alcoholByVolume:(float) alcoholByVolume {
    
    int ouncesInOneBeerGlass = 12; //assume 12 oz. bottle
    float alcoholPercentageOfBeer = alcoholByVolume / 100;
    float ouncesOfAlcoholPerBeer = ouncesInOneBeerGlass * alcoholPercentageOfBeer;
    float ouncesOfAlcoholTotal = ouncesOfAlcoholPerBeer * numberOfBeers;
    // now, calculate the equivalent amount of wine...
    float ouncesInOneWineGlass = 5;  // wine glasses are usually 5oz
    float alcoholPercentageOfWine = 0.13;  // 13% is average
    float ouncesOfAlcoholPerWineGlass = ouncesInOneWineGlass * alcoholPercentageOfWine;
    float numberOfWhiskeyGlassesForEquivalentAlcoholAmount = ouncesOfAlcoholTotal / ouncesOfAlcoholPerWineGlass;
    
    return numberOfWhiskeyGlassesForEquivalentAlcoholAmount;
}

@end
