//
//  HomeViewController.m
//  IOSCalculette
//
//  Created by Nico on 02/01/2017.
//  Copyright © 2017 Nico. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

@synthesize nbr1 = nbr1_;
@synthesize nbr2 = nbr2_;
@synthesize ope = ope_;
@synthesize comma = comma_;
@synthesize commaNumber = commaNumber_;
@synthesize countComma = countComma_;
@synthesize sousNumber = sousNumber_;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.nbr1 = 0;
    self.nbr2 = 0;
    self.ope = 0;
    self.comma = 0;
    self.countComma = 0;
    self.sousNumber = 0;
    self.commaNumber = 0;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)reinitOpe{
    self.commaNumber = 0;
    self.comma = 0;
    self.countComma =0 ;
    self.sousNumber = 0;
}

- (IBAction)btnAdd:(id)sender {
    self.ope = 1;
    _txtLabel.text = @"+";
    [self reinitOpe];
}

- (IBAction)btnLess:(id)sender {
    self.ope = 2;
    _txtLabel.text = @"-";
    [self reinitOpe];
}

- (IBAction)btnMultiply:(id)sender {
    self.ope = 3;
    _txtLabel.text = @"*";
    [self reinitOpe];
}

- (IBAction)btnDivision:(id)sender {
    self.ope = 4;
    _txtLabel.text = @"/";
    [self reinitOpe];
}

- (void)treatmentWithNumber:(unsigned int)number{
    NSString* str;
    if(self.ope != 0){
        if(self.nbr2 != 0){
            self.nbr2 *= 10;
            self.nbr2 += number;
            str = [NSString stringWithFormat:@"%g", self.nbr2];
            _txtLabel.text = str;
        }else{
            self.nbr2 = number;
            str = [NSString stringWithFormat:@"%g", self.nbr2];
            _txtLabel.text = str;
        }
    }else{
        if(self.nbr1 != 0){
            self.nbr1 *= 10;
            self.nbr1 += number;
            str = [NSString stringWithFormat:@"%g", self.nbr1];
            _txtLabel.text = str;
        }else{
            self.nbr1 = number;
            str = [NSString stringWithFormat:@"%g", self.nbr1];
            _txtLabel.text = str;
        }
    }
}
- (void)treatmentWithNumberComma:(unsigned int)numberComma{
    NSString* str;
    if(self.ope != 0){
        self.nbr2 -= self.sousNumber;
    }else{
        self.nbr1 -= self.sousNumber;
    }
    
    self.countComma += 1;
    
    self.commaNumber *= 10;
    self.commaNumber += numberComma;
    int multi = 1;
    float n = self.commaNumber;
    int i;
    for (i = 1; i <= self.countComma; i++) {
        multi *= 10;
    }
    
    n /= multi;
    self.sousNumber = n;
    
    str = [NSString stringWithFormat:@"%g", self.sousNumber
           ];
    
    if(self.ope != 0){
        self.nbr2 += self.sousNumber;
        str = [NSString stringWithFormat:@"%g", self.nbr2];
        _txtLabel.text = str;
        
    }else{
        self.nbr1 += self.sousNumber;
        str = [NSString stringWithFormat:@"%g", self.nbr1];
        _txtLabel.text = str;
    }
}


- (void) btnActionWithNumber:(unsigned int)number{
    if(self.comma == 1){
        [self treatmentWithNumberComma:number];
    }else{
        [self treatmentWithNumber:number];
    }
}

- (IBAction)btn0:(id)sender {
    unsigned int number = 0;
    [self btnActionWithNumber:number];
}

- (IBAction)bnt1:(id)sender {
    unsigned int number = 1;
    [self btnActionWithNumber:number];
}

- (IBAction)btn2:(id)sender {
    unsigned int number = 2;
    [self btnActionWithNumber:number];
}
- (IBAction)btn3:(id)sender {
    unsigned int number = 3;
    [self btnActionWithNumber:number];
}
- (IBAction)btn4:(id)sender {
    unsigned int number = 4;
    [self btnActionWithNumber:number];
}
- (IBAction)btn5:(id)sender {
    unsigned int number = 5;
    [self btnActionWithNumber:number];
}
- (IBAction)btn6:(id)sender {
    unsigned int number = 6;
    [self btnActionWithNumber:number];
}
- (IBAction)btn7:(id)sender {
    unsigned int number = 7;
    [self btnActionWithNumber:number];
}
- (IBAction)btn8:(id)sender {
    unsigned int number = 8;
    [self btnActionWithNumber:number];
}
- (IBAction)btn9:(id)sender {
    unsigned int number = 9;
    [self btnActionWithNumber:number];
}
- (IBAction)btnEqual:(id)sender {
    NSString* str;
    switch (self.ope) {
        case 1:
            self.nbr1 = self.nbr1 + self.nbr2;
            break;
        case 2:
            self.nbr1 = self.nbr1 - self.nbr2;
            break;
        case 3:
            self.nbr1 = self.nbr1 * self.nbr2;
            break;
        case 4:
            self.nbr1 = self.nbr1 / self.nbr2;
            break;
        default:
            break;
    }
    str = [NSString stringWithFormat:@"%g", self.nbr1];
    _txtLabel.text = str;

    self.nbr2 = 0;
    self.ope = 0;
    self.comma = 0;
    self.commaNumber = 0;
    self.countComma = 0;
    self.sousNumber = 0;
}
- (IBAction)btnDot:(id)sender {
    self.comma = 1;
}
- (IBAction)btnCancel:(id)sender {
    NSString* str;
    if(self.ope != 0){
        self.nbr2 = 0;
        str = [NSString stringWithFormat:@"%g", self.nbr2];
        _txtLabel.text = str;
    }else{
        self.nbr1 = 0;
        str = [NSString stringWithFormat:@"%g", self.nbr1];
        _txtLabel.text = str;
    }
    self.comma = 0;
    self.commaNumber = 0;
    self.countComma = 0;
    self.countComma = 0;
}

- (IBAction)btnAC:(id)sender {
    self.nbr1 = 0;
    self.nbr2 = 0;
    self.ope = 0;
    self.comma = 0;
    self.commaNumber = 0;
    self.countComma = 0;
    NSString* str;
    str = [NSString stringWithFormat:@"%g", self.nbr1];
    _txtLabel.text = str;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
