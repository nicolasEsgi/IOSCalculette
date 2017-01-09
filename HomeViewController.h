//
//  HomeViewController.h
//  IOSCalculette
//
//  Created by Nico on 02/01/2017.
//  Copyright © 2017 Nico. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController{
    @private
    float nbr1_;
    float nbr2_;
    unsigned int ope_;
    unsigned int comma_;
    float commaNumber_;
    unsigned int countComma_;
    float sousNumber_;
    unsigned int nbNeg_;
}
@property (weak, nonatomic) IBOutlet UILabel *txtLabel;

@property (assign, nonatomic)float nbr1;
@property (assign, nonatomic)float nbr2;
@property (assign, nonatomic)unsigned int ope;
@property (assign, nonatomic)unsigned int comma;
@property (assign, nonatomic)float commaNumber;
@property (assign, nonatomic)unsigned int countComma;
@property (assign, nonatomic)float sousNumber;
@property (assign, nonatomic)unsigned int nbNeg;

- (void)treatmentWithNumber:(unsigned int)number;
- (void)treatmentWithNumberComma:(unsigned int)numberComma;
- (void)btnActionWithNumber:(unsigned int)number;
- (void)reinitOpe;

@end
