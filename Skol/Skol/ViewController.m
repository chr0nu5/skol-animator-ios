//
//  ViewController.m
//  Skol
//
//  Created by Elliot on 7/25/16.
//  Copyright © 2016 FSociety. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:255/255.0 green:209/255.0 blue:10/255.0 alpha:1];
    
    //------------ APP Título
    
    UIView *titleBox = [[UIView alloc] init];
    titleBox.frame = CGRectMake(0, 0, self.view.frame.size.width, 110);
    titleBox.backgroundColor = [UIColor darkGrayColor];
    [self.view addSubview:titleBox];
    
    UIView *titleBoxLine = [[UIView alloc] init];
    titleBoxLine.frame = CGRectMake(0, titleBox.frame.size.height, self.view.frame.size.width, 2);
    titleBoxLine.backgroundColor = [UIColor blackColor];
    [self.view addSubview:titleBoxLine];
    
    UILabel *title = [[UILabel alloc] init];
    title.frame = CGRectMake(0, 10, self.view.frame.size.width, 100);
    title.text = @"SKOL LIVE SITE";
    title.textColor = [UIColor whiteColor];
    title.textAlignment = NSTextAlignmentCenter;
    title.font = [UIFont fontWithName:@"Helvetica" size:25];
    [self.view addSubview:title];
    
    
    //------------ Comandos Admin
    UILabel *txtDanger = [[UILabel alloc] init];
    txtDanger.frame = CGRectMake(10, title.frame.origin.y+title.frame.size.height+10, self.view.frame.size.width-20, 50);
    //txtDanger.backgroundColor = [UIColor grayColor];
    txtDanger.text = @"Danger Zone";
    txtDanger.textColor = [UIColor blackColor];
    txtDanger.textAlignment = NSTextAlignmentLeft;
    txtDanger.font = [UIFont fontWithName:@"Helvetica" size:19];
    [self.view addSubview:txtDanger];
    
    
    float btnWidth = (self.view.frame.size.width-20-50)/6;
    
    UIButton *btnStop = [[UIButton alloc] init];
    btnStop.frame = CGRectMake(10, txtDanger.frame.origin.y+txtDanger.frame.size.height-5, btnWidth, 40);
    //btnStop.backgroundColor = [UIColor blackColor];
    [btnStop setTitle:@"❌" forState:UIControlStateNormal];
    btnStop.titleLabel.font = [UIFont fontWithName: @"Helvetica" size:40];
    [self.view addSubview:btnStop];
    
    UIButton *btnDisable = [[UIButton alloc] init];
    btnDisable.frame = CGRectMake(10+btnWidth+10, txtDanger.frame.origin.y+txtDanger.frame.size.height-5, btnWidth, 40);
    //btnDisable.backgroundColor = [UIColor blackColor];
    [btnDisable setTitle:@"🌬" forState:UIControlStateNormal];
    btnDisable.titleLabel.font = [UIFont fontWithName: @"Helvetica" size:40];
    [self.view addSubview:btnDisable];
    
    UIButton *btnCalibrate = [[UIButton alloc] init];
    btnCalibrate.frame = CGRectMake(10+(btnWidth+10)*2, txtDanger.frame.origin.y+txtDanger.frame.size.height-5, btnWidth, 40);
    //btnCalibrate.backgroundColor = [UIColor blackColor];
    [btnCalibrate setTitle:@"⚖" forState:UIControlStateNormal];
    btnCalibrate.titleLabel.font = [UIFont fontWithName: @"Helvetica" size:40];
    [self.view addSubview:btnCalibrate];
    
    UIButton *btnReset = [[UIButton alloc] init];
    btnReset.frame = CGRectMake(10+(btnWidth+10)*3, txtDanger.frame.origin.y+txtDanger.frame.size.height-5, btnWidth, 40);
    //btnReset.backgroundColor = [UIColor blackColor];
    [btnReset setTitle:@"🔄" forState:UIControlStateNormal];
    btnReset.titleLabel.font = [UIFont fontWithName: @"Helvetica" size:40];
    [self.view addSubview:btnReset];
    
    UIButton *btnCurrentZero = [[UIButton alloc] init];
    btnCurrentZero.frame = CGRectMake(10+(btnWidth+10)*4, txtDanger.frame.origin.y+txtDanger.frame.size.height-5, btnWidth, 40);
    //btnCurrentZero.backgroundColor = [UIColor blackColor];
    [btnCurrentZero setTitle:@"🏁" forState:UIControlStateNormal];
    btnCurrentZero.titleLabel.font = [UIFont fontWithName: @"Helvetica" size:40];
    [self.view addSubview:btnCurrentZero];
    
    UIButton *btnHalt = [[UIButton alloc] init];
    btnHalt.frame = CGRectMake(10+(btnWidth+10)*5,txtDanger.frame.origin.y+txtDanger.frame.size.height-5, btnWidth, 40);
    //btnHalt.backgroundColor = [UIColor blackColor];
    [btnHalt setTitle:@"💩" forState:UIControlStateNormal];
    btnHalt.titleLabel.font = [UIFont fontWithName: @"Helvetica" size:40];
    [self.view addSubview:btnHalt];
    
    
    //------------ Comandos Unicast
    UILabel *txtUnicast = [[UILabel alloc] init];
    txtUnicast.frame = CGRectMake(10, btnHalt.frame.origin.y+btnHalt.frame.size.height+15, self.view.frame.size.width-20, 50);
    //txtUnicast.backgroundColor = [UIColor grayColor];
    txtUnicast.text = @"Unicast";
    txtUnicast.textColor = [UIColor blackColor];
    txtUnicast.textAlignment = NSTextAlignmentLeft;
    txtUnicast.font = [UIFont fontWithName:@"Helvetica" size:19];
    [self.view addSubview:txtUnicast];
    
    
    NSArray *walls = [[NSArray alloc] initWithObjects:@"top", @"left", @"right", @"front", nil];
    UISegmentedControl *wallSelector = [[UISegmentedControl alloc] initWithItems:walls];
    wallSelector.frame = CGRectMake(10, txtUnicast.frame.origin.y+txtUnicast.frame.size.height-5, 300, 40);
    //wallSelector.backgroundColor = [UIColor blackColor];
    [self.view addSubview:wallSelector];
    
    UITextField *unicastX = [[UITextField alloc] init];
    unicastX.frame = CGRectMake(10, wallSelector.frame.origin.y+txtUnicast.frame.size.height+5, 50, 50);
    unicastX.backgroundColor = [UIColor whiteColor];
    unicastX.textColor = [UIColor darkGrayColor];
    unicastX.font = [UIFont fontWithName:@"Helvetica" size:15];
    unicastX.keyboardType = UIKeyboardTypeNumberPad;
    unicastX.placeholder = @"X";
    unicastX.textAlignment = NSTextAlignmentCenter;
    unicastX.layer.borderWidth = 1;
    unicastX.layer.borderColor = [UIColor grayColor].CGColor;
    [self.view addSubview:unicastX];
    
    UITextField *unicastY = [[UITextField alloc] init];
    unicastY.frame = CGRectMake(10+50+10, wallSelector.frame.origin.y+txtUnicast.frame.size.height+5, 50, 50);
    unicastY.backgroundColor = [UIColor whiteColor];
    unicastY.textColor = [UIColor darkGrayColor];
    unicastY.font = [UIFont fontWithName:@"Helvetica" size:15];
    unicastY.keyboardType = UIKeyboardTypeNumberPad;
    unicastY.placeholder = @"Y";
    unicastY.textAlignment = NSTextAlignmentCenter;
    unicastY.layer.borderWidth = 1;
    unicastY.layer.borderColor = [UIColor grayColor].CGColor;
    [self.view addSubview:unicastY];
    
    UITextField *unicastCommand = [[UITextField alloc] init];
    unicastCommand.frame = CGRectMake(10+50+10+50+10, wallSelector.frame.origin.y+txtUnicast.frame.size.height+5, 70, 50);
    unicastCommand.backgroundColor = [UIColor whiteColor];
    unicastCommand.textColor = [UIColor darkGrayColor];
    unicastCommand.font = [UIFont fontWithName:@"Helvetica" size:15];
    unicastCommand.keyboardType = UIKeyboardTypeNumberPad;
    unicastCommand.placeholder = @"0x00";
    unicastCommand.textAlignment = NSTextAlignmentCenter;
    unicastCommand.layer.borderWidth = 1;
    unicastCommand.layer.borderColor = [UIColor grayColor].CGColor;
    [self.view addSubview:unicastCommand];
    
    UIButton *btnUnicast = [[UIButton alloc] init];
    btnUnicast.frame = CGRectMake(10+50+10+50+10+70+20,wallSelector.frame.origin.y+txtUnicast.frame.size.height+10, 55, 40);
    btnUnicast.backgroundColor = [UIColor blackColor];
    [btnUnicast setTitle:@"GO!" forState:UIControlStateNormal];
    btnUnicast.titleLabel.font = [UIFont fontWithName: @"Helvetica" size:14];
    [self.view addSubview:btnUnicast];

    
    
    /*
    UIButton *btnFaceSelector = [[UIButton alloc] init];
    btnFaceSelector.frame = CGRectMake(10+50+10+50+10, txtUnicast.frame.origin.y+txtUnicast.frame.size.height-5, 60, 40);
    btnFaceSelector.backgroundColor = [UIColor blackColor];
    [btnFaceSelector setTitle:@"Teto" forState:UIControlStateNormal];
    btnFaceSelector.titleLabel.font = [UIFont fontWithName: @"Helvetica" size:19];
    [self.view addSubview:btnFaceSelector];
     */
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
