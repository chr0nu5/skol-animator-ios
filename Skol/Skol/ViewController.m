//
//  ViewController.m
//  Skol
//
//  Created by Elliot on 7/25/16.
//  Copyright © 2016 FSociety. All rights reserved.
//

#import "ViewController.h"
#import <MyoKit/MyoKit.h>

@interface ViewController ()

@end

@implementation ViewController

//myo
- (void)chooseMyo {
    // Note that when the settings view controller is presented to the user, it must be in a UINavigationController.
    UINavigationController *controller = [TLMSettingsViewController settingsInNavigationController];
    // Present the settings view controller modally.
    [self presentViewController:controller animated:YES completion:nil];
}

- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer {
    [unicastY resignFirstResponder];
    [unicastX resignFirstResponder];
    [unicastCommand resignFirstResponder];
    [scrollText resignFirstResponder];
}


- (void)stopAll:(id)sender {
   UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"CUIDADO" message:@"ARE YOU SURE???? \n\nTHIS WILL STOP THE CURRENT ANIMATION(S)" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [clientSocket emit:@"stop"];
        [alert dismissViewControllerAnimated:YES completion:nil];
    }];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"CANCEL" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [alert dismissViewControllerAnimated:YES completion:nil];
    }];
    [alert addAction:ok];
    [alert addAction:cancel];
    [self presentViewController:alert animated:YES completion:nil];
   
}

- (void)disable:(id)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"CUIDADO" message:@"ARE YOU SURE???? \n\nTHIS WILL DISABLE ALL MOTORS" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [clientSocket emit:@"animation" args:@[@0xFF]];
        [alert dismissViewControllerAnimated:YES completion:nil];
    }];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"CANCEL" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [alert dismissViewControllerAnimated:YES completion:nil];
    }];
    [alert addAction:ok];
    [alert addAction:cancel];
    [self presentViewController:alert animated:YES completion:nil];
    
}

- (void)random:(id)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"CUIDADO" message:@"ARE YOU SURE???? \n\nTHIS WILL ROTATE ALL THE MOTORS TO A RANDOM POSITION" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        NSDictionary *args = [[NSDictionary alloc] initWithObjects:@[@"RandomPosition"] forKeys:@[@"animation"]];
        [clientSocket emit:@"animation" args:@[args]];
        [alert dismissViewControllerAnimated:YES completion:nil];
    }];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"CANCEL" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [alert dismissViewControllerAnimated:YES completion:nil];
    }];
    [alert addAction:ok];
    [alert addAction:cancel];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)calibrate:(id)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"CUIDADO" message:@"ARE YOU SURE???? \n\nTHIS WILL CALIBRATE ALL THE MOTORS" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [clientSocket emit:@"animation" args:@[@0xFE]];
        [alert dismissViewControllerAnimated:YES completion:nil];
    }];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"CANCEL" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [alert dismissViewControllerAnimated:YES completion:nil];
    }];
    [alert addAction:ok];
    [alert addAction:cancel];
    [self presentViewController:alert animated:YES completion:nil];
    
}

- (void)reset:(id)sender {
   UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"CUIDADO" message:@"ARE YOU SURE???? \n\nTHIS WILL RESET ALL  MOTORS" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [clientSocket emit:@"animation" args:@[@0xFC]];
        [alert dismissViewControllerAnimated:YES completion:nil];
    }];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"CANCEL" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [alert dismissViewControllerAnimated:YES completion:nil];
    }];
    [alert addAction:ok];
    [alert addAction:cancel];
    [self presentViewController:alert animated:YES completion:nil];
    
}

- (void)currentZero:(id)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"CUIDADO" message:@"ARE YOU SURE???? \n\nTHIS WILL SET THE CURRENT ANGLE TO ACT AS ZERO" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [clientSocket emit:@"animation" args:@[@0xFD]];
        [alert dismissViewControllerAnimated:YES completion:nil];
    }];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"CANCEL" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [alert dismissViewControllerAnimated:YES completion:nil];
    }];
    [alert addAction:ok];
    [alert addAction:cancel];
    [self presentViewController:alert animated:YES completion:nil];
    
}

- (void)autoPilotStatus:(UISwitch*)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"CUIDADO" message:@"ARE YOU SURE???? \n\nTHIS WILL START/STOP AUTOPILOT " preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        
        if ([sender isOn]) {
            [clientSocket emit:@"auto_pilot"];
        } else {
            [clientSocket emit:@"stop"];
        }
        
    }];
   
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"CANCEL" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [alert dismissViewControllerAnimated:YES completion:^{
            dispatch_async(dispatch_get_main_queue(), ^{
            [pilotSwitch setOn:NO];
            });
        }];
    }];
    [alert addAction:ok];
    [alert addAction:cancel];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)unicast:(id)sender {
    int wall= wallSelector.selectedSegmentIndex;
    NSString *wallName = @"";
    if (wall == 0) {
        wallName = @"roof";
    } else if (wall == 1) {
        wallName = @"leftWall";
    } else if (wall == 2){
        wallName = @"rightWall";
    } else if (wall == 3) {
        wallName = @"frontWall";
    }
    NSNumber *x= [NSNumber numberWithInt:[unicastX.text intValue]];
    NSNumber *y= [NSNumber numberWithInt:[unicastY.text intValue]];
    NSNumber *command= [NSNumber numberWithInt:[unicastCommand.text intValue]];
    NSDictionary *args = [[NSDictionary alloc] initWithObjects:@[x,y,command, wallName] forKeys:@[@"x",@"y",@"command",@"wall"]];
    [clientSocket emit:@"unicast" args:@[args]];
}


- (void)angleChange:(UISlider*)sender {
    int angle = [[NSString stringWithFormat:@"%.0f", sender.value*40 ] intValue];
    int finalAngle = angle*9;
    txtAngleNumb.text = [NSString stringWithFormat:@"%dº", finalAngle];
}

- (void)angle:(id)sender {
    NSNumber *angle= [NSNumber numberWithInt: [[NSString stringWithFormat:@"%.0f", angles.value*40+20] intValue]];
    NSDictionary *args = [[NSDictionary alloc] initWithObjects:@[@"BasicAngle", angle] forKeys:@[@"animation", @"angle"]];
    NSLog(@"%@", args);
    [clientSocket emit:@"animation" args:@[args]];
}

- (void)text:(id)sender {
    NSString *text = scrollText.text;
    NSDictionary *args;
    if ([scrollTextSwitch isOn]) {
        args = [[NSDictionary alloc] initWithObjects:@[@"ScrollText", text, @1] forKeys:@[@"animation", @"message", @"continuous"]];
    } else {
        args = [[NSDictionary alloc] initWithObjects:@[@"ScrollText", text, @0] forKeys:@[@"animation", @"message", @"continuous"]];
    }
    [clientSocket emit:@"animation" args:@[args]];
}


- (void)scoreboard:(id)sender {
    NSString *text1 = scoreboardTxt1.text;
    NSString *text2 = scoreboardTxt2.text;
    NSString *text3 = scoreboardTxt3.text;
    NSString *text4 = scoreboardTxt4.text;
    NSDictionary *args = [[NSDictionary alloc] initWithObjects:@[@"ScoreBoard", text1, text2, text3, text4] forKeys:@[@"animation", @"country1", @"score1", @"country2", @"score2"]];
    [clientSocket emit:@"animation" args:@[args]];
}

- (void)ola:(UISegmentedControl*)sender {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"CUIDADO" message:@"ARE YOU SURE???? \n\nTHIS WILL ANIMATE SOMETHING" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        
        int olatype= olaSelect.selectedSegmentIndex;
        NSString *type = @"";
        if (olatype == 0) {
            type = @"little";
        } else if (olatype == 1) {
            type = @"full";
        } else if (olatype == 2){
            type = @"vertical";
        }
        NSDictionary *args = [[NSDictionary alloc] initWithObjects:@[@"Ola", type] forKeys:@[@"animation",@"type"]];
        [clientSocket emit:@"animation" args:@[args]];
    }];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"CANCEL" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [alert dismissViewControllerAnimated:YES completion:nil];
    }];
    [alert addAction:ok];
    [alert addAction:cancel];
    [self presentViewController:alert animated:YES completion:nil];
    
    
}


- (void)idle1:(UISegmentedControl*)sender {
   UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"CUIDADO" message:@"ARE YOU SURE???? \n\nTHIS WILL ANIMATE SOMETHING" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        
        int idleType= idleSelect1.selectedSegmentIndex;
        NSString *type = @"";
        if (idleType == 0) {
            type = @"shuffle";
        } else if (idleType == 1) {
            type = @"live";
        } else if (idleType == 2){
            type = @"breathing";
        } else if (idleType == 3) {
            type = @"reel";
        }
        NSDictionary *args = [[NSDictionary alloc] initWithObjects:@[@"Idle", type] forKeys:@[@"animation",@"type"]];
        [clientSocket emit:@"animation" args:@[args]];
        
        [idleSelect2 setSelectedSegmentIndex:UISegmentedControlNoSegment];
        
        
        [alert dismissViewControllerAnimated:YES completion:nil];
    }];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"CANCEL" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [alert dismissViewControllerAnimated:YES completion:nil];
    }];
    [alert addAction:ok];
    [alert addAction:cancel];
    [self presentViewController:alert animated:YES completion:nil];
    
    
}

- (void)idle2:(UISegmentedControl*)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"CUIDADO" message:@"ARE YOU SURE???? \n\nTHIS WILL ANIMATE SOMETHING" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        
        int idleType= idleSelect2.selectedSegmentIndex;
        NSString *type = @"";
        if (idleType == 0) {
            type = @"open";
        } else if (idleType == 1) {
            type = @"spiral";
        } else if (idleType == 2){
            type = @"brendacadente";
        }
        NSDictionary *args = [[NSDictionary alloc] initWithObjects:@[@"Idle", type] forKeys:@[@"animation",@"type"]];
        [clientSocket emit:@"animation" args:@[args]];
        
        [idleSelect1 setSelectedSegmentIndex:UISegmentedControlNoSegment];
        
        
        [alert dismissViewControllerAnimated:YES completion:nil];
    }];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"CANCEL" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [alert dismissViewControllerAnimated:YES completion:nil];
    }];
    [alert addAction:ok];
    [alert addAction:cancel];
    [self presentViewController:alert animated:YES completion:nil];
    
    
    
    
}

- (void)musicStatus:(id)sender {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"CUIDADO" message:@"ARE YOU SURE???? \n\nTHIS WILL START/STOP MUSIC MODE " preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        
        if ([sender isOn]) {
            NSDictionary *args = [[NSDictionary alloc] initWithObjects:@[@"Music", @"equalizer"] forKeys:@[@"animation", @"type"]];
            [clientSocket emit:@"animation" args:@[args]];
        } else {
            [clientSocket emit:@"stop"];
        }
        
    }];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"CANCEL" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [alert dismissViewControllerAnimated:YES completion:nil];
    }];
    [alert addAction:ok];
    [alert addAction:cancel];
    [self presentViewController:alert animated:YES completion:nil];

}

- (void)lidarStatus:(id)sender {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"CUIDADO" message:@"ARE YOU SURE???? \n\nTHIS WILL START/STOP LIDAR MODE " preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        
        if ([sender isOn]) {
            NSDictionary *args = [[NSDictionary alloc] initWithObjects:@[@"enable_lidar", @1] forKeys:@[@"animation", @"enabled"]];
            [clientSocket emit:@"animation" args:@[args]];
        } else {
            NSDictionary *args = [[NSDictionary alloc] initWithObjects:@[@"enable_lidar", @0] forKeys:@[@"animation", @"enabled"]];
            [clientSocket emit:@"animation" args:@[args]];
        }
        
    }];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"CANCEL" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [alert dismissViewControllerAnimated:YES completion:nil];
    }];
    [alert addAction:ok];
    [alert addAction:cancel];
    [self presentViewController:alert animated:YES completion:nil];
    
}

- (void)myoParear:(id)sender {
    if ([sender isOn]) {
        [self chooseMyo];
    } else {
        
    }
    
}

- (void)myoJedi:(id)sender {
    if ([sender isOn]) {
        [clientSocket emit:@"double_tap"];
    } else {
        [clientSocket emit:@"double_tap"];
    }
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //self.view.backgroundColor = [UIColor colorWithRed:255/255.0 green:209/255.0 blue:10/255.0 alpha:1];
    
    // initialize the socket.io connection
    [SIOSocket socketWithHost: @"http://192.168.42.10:3000" response: ^(SIOSocket *socket) {
        clientSocket = socket;
        
        //check the correct event from the server
        [clientSocket on:@"statuspilot" callback:^(SIOParameterArray *args) {
            pilotNext.text = [args firstObject];
        }];
        
    }];
    
    // initialize the myo notifications on notification center
    // Data notifications are received through NSNotificationCenter.
    // Posted whenever a TLMMyo connects
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didConnectDevice:)
                                                 name:TLMHubDidConnectDeviceNotification
                                               object:nil];
    // Posted whenever a TLMMyo disconnects.
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didDisconnectDevice:)
                                                 name:TLMHubDidDisconnectDeviceNotification
                                               object:nil];
    // Posted whenever the user does a successful Sync Gesture.
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didSyncArm:)
                                                 name:TLMMyoDidReceiveArmSyncEventNotification
                                               object:nil];
    // Posted whenever Myo loses sync with an arm (when Myo is taken off, or moved enough on the user's arm).
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didUnsyncArm:)
                                                 name:TLMMyoDidReceiveArmUnsyncEventNotification
                                               object:nil];
    // Posted whenever Myo is unlocked and the application uses TLMLockingPolicyStandard.
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didUnlockDevice:)
                                                 name:TLMMyoDidReceiveUnlockEventNotification
                                               object:nil];
    // Posted whenever Myo is locked and the application uses TLMLockingPolicyStandard.
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didLockDevice:)
                                                 name:TLMMyoDidReceiveLockEventNotification
                                               object:nil];
    // Posted when a new orientation event is available from a TLMMyo. Notifications are posted at a rate of 50 Hz.
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didReceiveOrientationEvent:)
                                                 name:TLMMyoDidReceiveOrientationEventNotification
                                               object:nil];
    // Posted when a new pose is available from a TLMMyo.
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didReceivePoseChange:)
                                                 name:TLMMyoDidReceivePoseChangedNotification
                                               object:nil];
    
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:scrollView];
    
    
    
    //------------ APP Título
    
    UIView *titleBox = [[UIView alloc] init];
    titleBox.frame = CGRectMake(0, 0, self.view.frame.size.width, 110);
    titleBox.backgroundColor = [UIColor darkGrayColor];
    [scrollView addSubview:titleBox];
    
    UIView *titleBoxLine = [[UIView alloc] init];
    titleBoxLine.frame = CGRectMake(0, titleBox.frame.size.height, self.view.frame.size.width, 2);
    titleBoxLine.backgroundColor = [UIColor blackColor];
    [scrollView addSubview:titleBoxLine];
    
    UILabel *title = [[UILabel alloc] init];
    title.frame = CGRectMake(0, 10, self.view.frame.size.width, 100);
    title.text = @"SKOL LIVE SITE";
    title.textColor = [UIColor whiteColor];
    title.textAlignment = NSTextAlignmentCenter;
    title.font = [UIFont fontWithName:@"Helvetica" size:25];
    [scrollView addSubview:title];
    
    
    //------------ Comandos Admin
    UILabel *txtDanger = [[UILabel alloc] init];
    txtDanger.frame = CGRectMake(10, title.frame.origin.y+title.frame.size.height+10, self.view.frame.size.width-20, 50);
    //txtDanger.backgroundColor = [UIColor grayColor];
    txtDanger.text = @"Danger Zone";
    txtDanger.textColor = [UIColor blackColor];
    txtDanger.textAlignment = NSTextAlignmentLeft;
    txtDanger.font = [UIFont fontWithName:@"Helvetica" size:19];
    [scrollView addSubview:txtDanger];
    
    
    float btnWidth = (self.view.frame.size.width-20-50)/6;
    
    UIButton *btnStop = [[UIButton alloc] init];
    btnStop.frame = CGRectMake(10, txtDanger.frame.origin.y+txtDanger.frame.size.height-5, btnWidth, 40);
    //btnStop.backgroundColor = [UIColor blackColor];
    [btnStop setTitle:@"🚨" forState:UIControlStateNormal];
    btnStop.titleLabel.font = [UIFont fontWithName: @"Helvetica" size:40];
    [btnStop addTarget:self action:@selector(stopAll:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:btnStop];
    
    UIButton *btnDisable = [[UIButton alloc] init];
    btnDisable.frame = CGRectMake(10+btnWidth+10, txtDanger.frame.origin.y+txtDanger.frame.size.height-5, btnWidth, 40);
    //btnDisable.backgroundColor = [UIColor blackColor];
    [btnDisable setTitle:@"🌬" forState:UIControlStateNormal];
    btnDisable.titleLabel.font = [UIFont fontWithName: @"Helvetica" size:40];
    [btnDisable addTarget:self action:@selector(disable:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:btnDisable];
    
    UIButton *btnRandom = [[UIButton alloc] init];
    btnRandom.frame = CGRectMake(10+(btnWidth+10)*2,txtDanger.frame.origin.y+txtDanger.frame.size.height-5, btnWidth, 40);
    [btnRandom setTitle:@"🎛" forState:UIControlStateNormal];
    btnRandom.titleLabel.font = [UIFont fontWithName: @"Helvetica" size:40];
    [btnRandom addTarget:self action:@selector(random:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:btnRandom];
    
    UIButton *btnCalibrate = [[UIButton alloc] init];
    btnCalibrate.frame = CGRectMake(10+(btnWidth+10)*3, txtDanger.frame.origin.y+txtDanger.frame.size.height-5, btnWidth, 40);
    //btnCalibrate.backgroundColor = [UIColor blackColor];
    [btnCalibrate setTitle:@"⚖" forState:UIControlStateNormal];
    btnCalibrate.titleLabel.font = [UIFont fontWithName: @"Helvetica" size:40];
    [btnCalibrate addTarget:self action:@selector(calibrate:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:btnCalibrate];
    
    UIButton *btnReset = [[UIButton alloc] init];
    btnReset.frame = CGRectMake(10+(btnWidth+10)*4, txtDanger.frame.origin.y+txtDanger.frame.size.height-5, btnWidth, 40);
    //btnReset.backgroundColor = [UIColor blackColor];
    [btnReset setTitle:@"🔄" forState:UIControlStateNormal];
    btnReset.titleLabel.font = [UIFont fontWithName: @"Helvetica" size:40];
    [btnReset addTarget:self action:@selector(reset:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:btnReset];
    
    UIButton *btnCurrentZero = [[UIButton alloc] init];
    btnCurrentZero.frame = CGRectMake(10+(btnWidth+10)*5, txtDanger.frame.origin.y+txtDanger.frame.size.height-5, btnWidth, 40);
    //btnCurrentZero.backgroundColor = [UIColor blackColor];
    [btnCurrentZero setTitle:@"🏁" forState:UIControlStateNormal];
    btnCurrentZero.titleLabel.font = [UIFont fontWithName: @"Helvetica" size:40];
    [btnCurrentZero addTarget:self action:@selector(currentZero:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:btnCurrentZero];
    
    
    //------------ Piloto Automático
    UILabel *txtPilot = [[UILabel alloc] init];
    txtPilot.frame = CGRectMake(10, btnCurrentZero.frame.origin.y+btnCurrentZero.frame.size.height+15, self.view.frame.size.width-20, 50);
    txtPilot.text = @"Autopilot";
    txtPilot.textColor = [UIColor blackColor];
    txtPilot.textAlignment = NSTextAlignmentLeft;
    txtPilot.font = [UIFont fontWithName:@"Helvetica" size:19];
    [scrollView addSubview:txtPilot];
    
    UILabel *pilotOn = [[UILabel alloc] init];
    pilotOn.frame = CGRectMake(10, txtPilot.frame.origin.y+txtPilot.frame.size.height - 5, 50, 30);
    pilotOn.text = @"Ligar";
    pilotOn.textColor = [UIColor blackColor];
    pilotOn.textAlignment = NSTextAlignmentLeft;
    pilotOn.font = [UIFont fontWithName:@"Helvetica" size:15];
    [scrollView addSubview:pilotOn];
    
    pilotSwitch = [[UISwitch alloc] init];
    pilotSwitch.frame = CGRectMake(pilotOn.frame.size.width+15, txtPilot.frame.origin.y + txtPilot.frame.size.height - 5, 1, 1);
    [pilotSwitch addTarget:self action:@selector(autoPilotStatus:) forControlEvents:UIControlEventValueChanged];
    [scrollView addSubview:pilotSwitch];
    
    pilotNext = [[UILabel alloc] init];
    pilotNext.frame = CGRectMake(10, pilotSwitch.frame.origin.y+pilotSwitch.frame.size.height + 10, self.view.frame.size.width - 20, 30);
    pilotNext.text = @"Status...";
    pilotNext.textColor = [UIColor darkGrayColor];
    pilotNext.textAlignment = NSTextAlignmentLeft;
    pilotNext.font = [UIFont fontWithName:@"Helvetica" size:13];
    [scrollView addSubview:pilotNext];
    
    
    //------------ Comandos Unicast
    UILabel *txtUnicast = [[UILabel alloc] init];
    txtUnicast.frame = CGRectMake(10, pilotNext.frame.origin.y+pilotNext.frame.size.height+15, self.view.frame.size.width-20, 50);
    //txtUnicast.backgroundColor = [UIColor grayColor];
    txtUnicast.text = @"Unicast";
    txtUnicast.textColor = [UIColor blackColor];
    txtUnicast.textAlignment = NSTextAlignmentLeft;
    txtUnicast.font = [UIFont fontWithName:@"Helvetica" size:19];
    [scrollView addSubview:txtUnicast];
    
    
    NSArray *walls = [[NSArray alloc] initWithObjects:@"top", @"left", @"right", @"front", nil];
    wallSelector = [[UISegmentedControl alloc] initWithItems:walls];
    wallSelector.frame = CGRectMake(10, txtUnicast.frame.origin.y+txtUnicast.frame.size.height-5, 300, 40);
    [wallSelector addTarget:self action:@selector(unicast:) forControlEvents:UIControlEventValueChanged];
    [scrollView addSubview:wallSelector];
    
    unicastX = [[UITextField alloc] init];
    unicastX.frame = CGRectMake(10, wallSelector.frame.origin.y+txtUnicast.frame.size.height+5, 50, 50);
    unicastX.backgroundColor = [UIColor whiteColor];
    unicastX.textColor = [UIColor darkGrayColor];
    unicastX.font = [UIFont fontWithName:@"Helvetica" size:15];
    unicastX.keyboardType = UIKeyboardTypeNumberPad;
    unicastX.placeholder = @"X";
    unicastX.textAlignment = NSTextAlignmentCenter;
    unicastX.layer.borderWidth = 1;
    unicastX.layer.borderColor = [UIColor grayColor].CGColor;
    [scrollView addSubview:unicastX];
    
    unicastY = [[UITextField alloc] init];
    unicastY.frame = CGRectMake(10+50+10, wallSelector.frame.origin.y+txtUnicast.frame.size.height+5, 50, 50);
    unicastY.backgroundColor = [UIColor whiteColor];
    unicastY.textColor = [UIColor darkGrayColor];
    unicastY.font = [UIFont fontWithName:@"Helvetica" size:15];
    unicastY.keyboardType = UIKeyboardTypeNumberPad;
    unicastY.placeholder = @"Y";
    unicastY.textAlignment = NSTextAlignmentCenter;
    unicastY.layer.borderWidth = 1;
    unicastY.layer.borderColor = [UIColor grayColor].CGColor;
    [scrollView addSubview:unicastY];
    
    unicastCommand = [[UITextField alloc] init];
    unicastCommand.frame = CGRectMake(10+50+10+50+10, wallSelector.frame.origin.y+txtUnicast.frame.size.height+5, 70, 50);
    unicastCommand.backgroundColor = [UIColor whiteColor];
    unicastCommand.textColor = [UIColor darkGrayColor];
    unicastCommand.font = [UIFont fontWithName:@"Helvetica" size:15];
    unicastCommand.keyboardType = UIKeyboardTypeNumberPad;
    unicastCommand.placeholder = @"20";
    unicastCommand.textAlignment = NSTextAlignmentCenter;
    unicastCommand.layer.borderWidth = 1;
    unicastCommand.layer.borderColor = [UIColor grayColor].CGColor;
    [scrollView addSubview:unicastCommand];
    
    UIButton *btnUnicast = [[UIButton alloc] init];
    btnUnicast.frame = CGRectMake(10+50+10+50+10+70+20,wallSelector.frame.origin.y+txtUnicast.frame.size.height+10, 55, 40);
    btnUnicast.backgroundColor = [UIColor blackColor];
    [btnUnicast setTitle:@"GO!" forState:UIControlStateNormal];
    btnUnicast.titleLabel.font = [UIFont fontWithName: @"Helvetica" size:14];
    [btnUnicast addTarget:self action:@selector(unicast:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:btnUnicast];
    
    
    
    //------------ Angulos
    UILabel *txtAngle = [[UILabel alloc] init];
    txtAngle.frame = CGRectMake(10, btnUnicast.frame.origin.y+btnUnicast.frame.size.height+15, self.view.frame.size.width-20, 50);
    //txtUnicast.backgroundColor = [UIColor grayColor];
    txtAngle.text = @"Angles";
    txtAngle.textColor = [UIColor blackColor];
    txtAngle.textAlignment = NSTextAlignmentLeft;
    txtAngle.font = [UIFont fontWithName:@"Helvetica" size:19];
    [scrollView addSubview:txtAngle];
    
    btnAngle = [[UIButton alloc] init];
    btnAngle.frame = CGRectMake( self.view.frame.size.width - 55 - 10,txtAngle.frame.origin.y+txtAngle.frame.size.height-10, 55, 40);
    btnAngle.backgroundColor = [UIColor blackColor];
    [btnAngle setTitle:@"GO!" forState:UIControlStateNormal];
    btnAngle.titleLabel.font = [UIFont fontWithName: @"Helvetica" size:14];
    [btnAngle addTarget:self action:@selector(angle:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:btnAngle];
    
    txtAngleNumb = [[UILabel alloc] init];
    txtAngleNumb.frame = CGRectMake(btnAngle.frame.origin.x - 50 - 10, txtAngle.frame.origin.y+txtAngle.frame.size.height-5, 50, 30);
    txtAngleNumb.text = @"0º";
    txtAngleNumb.textColor = [UIColor blackColor];
    txtAngleNumb.textAlignment = NSTextAlignmentCenter;
    txtAngleNumb.font = [UIFont fontWithName:@"Helvetica" size:15];
    [scrollView addSubview:txtAngleNumb];
    
    angles = [[UISlider alloc] init];
    angles.frame = CGRectMake(10, txtAngle.frame.origin.y+txtAngle.frame.size.height+6 , txtAngleNumb.frame.origin.x - 10 - 10 , 10);
    [angles addTarget:self action:@selector(angleChange:) forControlEvents:UIControlEventValueChanged];
    [scrollView addSubview:angles];
    
    
  
    
    
    
    
    
    //------------ Texto
    UILabel *txtTexts = [[UILabel alloc] init];
    txtTexts.frame = CGRectMake(10, angles.frame.origin.y+angles.frame.size.height+15, self.view.frame.size.width-20, 50);
    //txtTexts.backgroundColor = [UIColor grayColor];
    txtTexts.text = @"Scroll Text";
    txtTexts.textColor = [UIColor blackColor];
    txtTexts.textAlignment = NSTextAlignmentLeft;
    txtTexts.font = [UIFont fontWithName:@"Helvetica" size:19];
    [scrollView addSubview:txtTexts];
    
    scrollText = [[UITextField alloc] init];
    scrollText.frame = CGRectMake(10, txtTexts.frame.origin.y+txtTexts.frame.size.height, 300, 40);
    scrollText.backgroundColor = [UIColor whiteColor];
    scrollText.textColor = [UIColor darkGrayColor];
    scrollText.font = [UIFont fontWithName:@"Helvetica" size:15];
    scrollText.placeholder = @"Your text here";
    scrollText.text = @"Skol";
    scrollText.textAlignment = NSTextAlignmentLeft;
    scrollText.layer.borderWidth = 1;
    scrollText.layer.borderColor = [UIColor grayColor].CGColor;
    [scrollView addSubview:scrollText];
    
    UILabel *scrollTextSwitchTxt = [[UILabel alloc] init];
    scrollTextSwitchTxt.frame = CGRectMake(10, scrollText.frame.origin.y+scrollText.frame.size.height + 20, 70, 30);
    //scrollTextSwitchTxt.backgroundColor = [UIColor grayColor];
    scrollTextSwitchTxt.text = @"Contínuo";
    scrollTextSwitchTxt.textColor = [UIColor blackColor];
    scrollTextSwitchTxt.textAlignment = NSTextAlignmentLeft;
    scrollTextSwitchTxt.font = [UIFont fontWithName:@"Helvetica" size:15];
    [scrollView addSubview:scrollTextSwitchTxt];
    
    scrollTextSwitch = [[UISwitch alloc] init];
    scrollTextSwitch.frame = CGRectMake(scrollTextSwitchTxt.frame.size.width+15, scrollText.frame.origin.y + scrollText.frame.size.height + 20, 1, 1);
    [scrollView addSubview:scrollTextSwitch];
    
    scrollTextBtn = [[UIButton alloc] init];
    scrollTextBtn.frame = CGRectMake(scrollTextSwitchTxt.frame.size.width + scrollTextSwitch.frame.size.width + 40, scrollText.frame.origin.y + scrollText.frame.size.height + 15, 55, 40);
    scrollTextBtn.backgroundColor = [UIColor blackColor];
    [scrollTextBtn setTitle:@"GO!" forState:UIControlStateNormal];
    scrollTextBtn.titleLabel.font = [UIFont fontWithName: @"Helvetica" size:14];
    [scrollTextBtn addTarget:self action:@selector(text:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:scrollTextBtn];
    
    
    //------------ Scoreboard
    UILabel *txtScoreboard = [[UILabel alloc] init];
    txtScoreboard.frame = CGRectMake(10, scrollTextBtn.frame.origin.y+scrollTextBtn.frame.size.height+15, self.view.frame.size.width-20, 50);
    //txtTexts.backgroundColor = [UIColor grayColor];
    txtScoreboard.text = @"Scoreboard";
    txtScoreboard.textColor = [UIColor blackColor];
    txtScoreboard.textAlignment = NSTextAlignmentLeft;
    txtScoreboard.font = [UIFont fontWithName:@"Helvetica" size:19];
    [scrollView addSubview:txtScoreboard];
    
    
    scoreboardTxt1 = [[UITextField alloc] init];
    scoreboardTxt1.frame = CGRectMake(10, txtScoreboard.frame.origin.y+txtScoreboard.frame.size.height, 300, 40);
    scoreboardTxt1.backgroundColor = [UIColor whiteColor];
    scoreboardTxt1.textColor = [UIColor darkGrayColor];
    scoreboardTxt1.font = [UIFont fontWithName:@"Helvetica" size:15];
    scoreboardTxt1.placeholder = @"Texto 1";
    scoreboardTxt1.textAlignment = NSTextAlignmentLeft;
    scoreboardTxt1.layer.borderWidth = 1;
    scoreboardTxt1.layer.borderColor = [UIColor grayColor].CGColor;
    [scrollView addSubview:scoreboardTxt1];
    
    scoreboardTxt2 = [[UITextField alloc] init];
    scoreboardTxt2.frame = CGRectMake(10, scoreboardTxt1.frame.origin.y+scoreboardTxt1.frame.size.height + 10, 300, 40);
    scoreboardTxt2.backgroundColor = [UIColor whiteColor];
    scoreboardTxt2.textColor = [UIColor darkGrayColor];
    scoreboardTxt2.font = [UIFont fontWithName:@"Helvetica" size:15];
    scoreboardTxt2.placeholder = @"Texto 2";
    scoreboardTxt2.textAlignment = NSTextAlignmentLeft;
    scoreboardTxt2.layer.borderWidth = 1;
    scoreboardTxt2.layer.borderColor = [UIColor grayColor].CGColor;
    [scrollView addSubview:scoreboardTxt2];
    
    scoreboardTxt3 = [[UITextField alloc] init];
    scoreboardTxt3.frame = CGRectMake(10, scoreboardTxt2.frame.origin.y+scoreboardTxt2.frame.size.height + 10, 300, 40);
    scoreboardTxt3.backgroundColor = [UIColor whiteColor];
    scoreboardTxt3.textColor = [UIColor darkGrayColor];
    scoreboardTxt3.font = [UIFont fontWithName:@"Helvetica" size:15];
    scoreboardTxt3.placeholder = @"Texto 3";
    scoreboardTxt3.textAlignment = NSTextAlignmentLeft;
    scoreboardTxt3.layer.borderWidth = 1;
    scoreboardTxt3.layer.borderColor = [UIColor grayColor].CGColor;
    [scrollView addSubview:scoreboardTxt3];
    
    scoreboardTxt4 = [[UITextField alloc] init];
    scoreboardTxt4.frame = CGRectMake(10, scoreboardTxt3.frame.origin.y+scoreboardTxt3.frame.size.height + 10, 300, 40);
    scoreboardTxt4.backgroundColor = [UIColor whiteColor];
    scoreboardTxt4.textColor = [UIColor darkGrayColor];
    scoreboardTxt4.font = [UIFont fontWithName:@"Helvetica" size:15];
    scoreboardTxt4.placeholder = @"Texto 4";
    scoreboardTxt4.textAlignment = NSTextAlignmentLeft;
    scoreboardTxt4.layer.borderWidth = 1;
    scoreboardTxt4.layer.borderColor = [UIColor grayColor].CGColor;
    [scrollView addSubview:scoreboardTxt4];
    
    UIButton *scrollTextscoreboardBtn = [[UIButton alloc] init];
    scrollTextscoreboardBtn.frame = CGRectMake(10, scoreboardTxt4.frame.origin.y + scoreboardTxt4.frame.size.height + 15, 55, 40);
    scrollTextscoreboardBtn.backgroundColor = [UIColor blackColor];
    [scrollTextscoreboardBtn setTitle:@"GO!" forState:UIControlStateNormal];
    scrollTextscoreboardBtn.titleLabel.font = [UIFont fontWithName: @"Helvetica" size:14];
    [scrollTextscoreboardBtn addTarget:self action:@selector(scoreboard:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:scrollTextscoreboardBtn];
    
    
    //------------ Ola
    UILabel *txtOla = [[UILabel alloc] init];
    txtOla.frame = CGRectMake(10, scrollTextscoreboardBtn.frame.origin.y+scrollTextscoreboardBtn.frame.size.height+15, self.view.frame.size.width-20, 50);
    txtOla.text = @"Ola";
    txtOla.textColor = [UIColor blackColor];
    txtOla.textAlignment = NSTextAlignmentLeft;
    txtOla.font = [UIFont fontWithName:@"Helvetica" size:19];
    [scrollView addSubview:txtOla];
    
    NSArray *olas = [[NSArray alloc] initWithObjects:@"45º", @"45º U", @"Vertical", nil];
    olaSelect = [[UISegmentedControl alloc] initWithItems:olas];
    olaSelect.frame = CGRectMake(10, txtOla.frame.origin.y+txtOla.frame.size.height-5, 300, 40);
    [olaSelect addTarget:self action:@selector(ola:) forControlEvents:UIControlEventValueChanged];
    [scrollView addSubview:olaSelect];
    
    
    //------------ Idle
    UILabel *txtIdle = [[UILabel alloc] init];
    txtIdle.frame = CGRectMake(10, olaSelect.frame.origin.y+olaSelect.frame.size.height+15, self.view.frame.size.width-20, 50);
    txtIdle.text = @"Idle";
    txtIdle.textColor = [UIColor blackColor];
    txtIdle.textAlignment = NSTextAlignmentLeft;
    txtIdle.font = [UIFont fontWithName:@"Helvetica" size:19];
    [scrollView addSubview:txtIdle];
    
    
    NSArray *idles = [[NSArray alloc] initWithObjects:@"Random", @"Live", @"Breathe", @"Reel", nil];
    idleSelect1 = [[UISegmentedControl alloc] initWithItems:idles];
    idleSelect1.frame = CGRectMake(10, txtIdle.frame.origin.y+txtIdle.frame.size.height-5, 300, 40);
    [idleSelect1 addTarget:self action:@selector(idle1:) forControlEvents:UIControlEventValueChanged];
    [scrollView addSubview:idleSelect1];
    
    NSArray *idles2 = [[NSArray alloc] initWithObjects:@"Linear", @"Spiral", @"Brendas", nil];
    idleSelect2 = [[UISegmentedControl alloc] initWithItems:idles2];
    idleSelect2.frame = CGRectMake(10, idleSelect1.frame.origin.y+idleSelect1.frame.size.height + 10, 300, 40);
    [idleSelect2 addTarget:self action:@selector(idle2:) forControlEvents:UIControlEventValueChanged];
    [scrollView addSubview:idleSelect2];
    
    
    //------------ Musica
    UILabel *txtMusic = [[UILabel alloc] init];
    txtMusic.frame = CGRectMake(10, idleSelect2.frame.origin.y+idleSelect2.frame.size.height+15, self.view.frame.size.width-20, 50);
    txtMusic.text = @"Music Mode";
    txtMusic.textColor = [UIColor blackColor];
    txtMusic.textAlignment = NSTextAlignmentLeft;
    txtMusic.font = [UIFont fontWithName:@"Helvetica" size:19];
    [scrollView addSubview:txtMusic];
    
    UILabel *musicBtn = [[UILabel alloc] init];
    musicBtn.frame = CGRectMake(10, txtMusic.frame.origin.y+txtMusic.frame.size.height - 5, 90, 30);
    musicBtn.text = @"Let's Shake";
    musicBtn.textColor = [UIColor blackColor];
    musicBtn.textAlignment = NSTextAlignmentLeft;
    musicBtn.font = [UIFont fontWithName:@"Helvetica" size:15];
    [scrollView addSubview:musicBtn];
    
    musicSwitch = [[UISwitch alloc] init];
    musicSwitch.frame = CGRectMake(musicBtn.frame.size.width+15, txtMusic.frame.origin.y + txtMusic.frame.size.height - 5, 1, 1);
    [musicSwitch addTarget:self action:@selector(musicStatus:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:musicSwitch];
    
    
    //------------ Lidar
    UILabel *txtLidar = [[UILabel alloc] init];
    txtLidar.frame = CGRectMake(10, musicSwitch.frame.origin.y+musicSwitch.frame.size.height+15, self.view.frame.size.width-20, 50);
    txtLidar.text = @"Lidar Mode";
    txtLidar.textColor = [UIColor blackColor];
    txtLidar.textAlignment = NSTextAlignmentLeft;
    txtLidar.font = [UIFont fontWithName:@"Helvetica" size:19];
    [scrollView addSubview:txtLidar];
    
    UILabel *lidarBtn = [[UILabel alloc] init];
    lidarBtn.frame = CGRectMake(10, txtLidar.frame.origin.y+txtLidar.frame.size.height - 5, 90, 30);
    lidarBtn.text = @"Let's Dance";
    lidarBtn.textColor = [UIColor blackColor];
    lidarBtn.textAlignment = NSTextAlignmentLeft;
    lidarBtn.font = [UIFont fontWithName:@"Helvetica" size:15];
    [scrollView addSubview:lidarBtn];
    
    lidarSwitch = [[UISwitch alloc] init];
    lidarSwitch.frame = CGRectMake(lidarBtn.frame.size.width+15, txtLidar.frame.origin.y + txtLidar.frame.size.height - 5, 1, 1);
    [lidarSwitch addTarget:self action:@selector(lidarStatus:) forControlEvents:UIControlEventValueChanged];
    [scrollView addSubview:lidarSwitch];
    
    
    
    //------------ Myo
    UILabel *txtMyo = [[UILabel alloc] init];
    txtMyo.frame = CGRectMake(10, lidarSwitch.frame.origin.y+lidarSwitch.frame.size.height+15, self.view.frame.size.width-20, 50);
    txtMyo.text = @"Myo";
    txtMyo.textColor = [UIColor blackColor];
    txtMyo.textAlignment = NSTextAlignmentLeft;
    txtMyo.font = [UIFont fontWithName:@"Helvetica" size:19];
    [scrollView addSubview:txtMyo];
    
    UILabel *myoParear = [[UILabel alloc] init];
    myoParear.frame = CGRectMake(10, txtMyo.frame.origin.y+txtMyo.frame.size.height - 5, 90, 30);
    myoParear.text = @"Parear";
    myoParear.textColor = [UIColor blackColor];
    myoParear.textAlignment = NSTextAlignmentLeft;
    myoParear.font = [UIFont fontWithName:@"Helvetica" size:15];
    [scrollView addSubview:myoParear];
    
    myoSwitch = [[UISwitch alloc] init];
    myoSwitch.frame = CGRectMake(myoParear.frame.size.width+15, txtMyo.frame.origin.y + txtMyo.frame.size.height - 5, 1, 1);
    [myoSwitch addTarget:self action:@selector(myoParear:) forControlEvents:UIControlEventValueChanged];
    [scrollView addSubview:myoSwitch];
    
    UILabel *myoFollow = [[UILabel alloc] init];
    myoFollow.frame = CGRectMake(10, myoSwitch.frame.origin.y+myoSwitch.frame.size.height + 15, 90, 30);
    myoFollow.text = @"Follow me";
    myoFollow.textColor = [UIColor blackColor];
    myoFollow.textAlignment = NSTextAlignmentLeft;
    myoFollow.font = [UIFont fontWithName:@"Helvetica" size:15];
    [scrollView addSubview:myoFollow];
    
    myoFollowSwitch = [[UISwitch alloc] init];
    myoFollowSwitch.frame = CGRectMake(myoFollow.frame.size.width+15, myoSwitch.frame.origin.y + myoSwitch.frame.size.height + 15, 1, 1);
    [myoFollowSwitch addTarget:self action:@selector(myoJedi:) forControlEvents:UIControlEventValueChanged];
    [scrollView addSubview:myoFollowSwitch];
    
    
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width, myoFollowSwitch.frame.origin.y+myoFollowSwitch.frame.size.height+15);
    
    UITapGestureRecognizer *singleFingerTap =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(handleSingleTap:)];
    [self.view addGestureRecognizer:singleFingerTap];
    
}

//myo
#pragma mark - NSNotificationCenter Methods
- (void)didConnectDevice:(NSNotification *)notification {
    
    NSLog(@"Perform the Sync Gesture");
    NSLog(@"Hello Myo");
}

- (void)didDisconnectDevice:(NSNotification *)notification {
    // Remove the text from our labels when the Myo has disconnected.
    NSLog(@"Good bye Myo");
}

- (void)didUnlockDevice:(NSNotification *)notification {
    // Update the label to reflect Myo's lock state.
    NSLog(@"Unlocked");
}

- (void)didLockDevice:(NSNotification *)notification {
    // Update the label to reflect Myo's lock state.
    NSLog(@"Locked");
}

- (void)didSyncArm:(NSNotification *)notification {
    // Retrieve the arm event from the notification's userInfo with the kTLMKeyArmSyncEvent key.
    TLMArmSyncEvent *armEvent = notification.userInfo[kTLMKeyArmSyncEvent];
    // Update the armLabel with arm information.
    NSString *armString = armEvent.arm == TLMArmRight ? @"Right" : @"Left";
    NSString *directionString = armEvent.xDirection == TLMArmXDirectionTowardWrist ? @"Toward Wrist" : @"Toward Elbow";
    NSLog(@"Arm: %@ X-Direction: %@", armString, directionString);
    NSLog(@"Locked");
}

- (void)didUnsyncArm:(NSNotification *)notification {
    // Reset the labels.
    NSLog(@"Perform the Sync Gesture");
    NSLog(@"Hello Myo");
}

- (void)didReceiveOrientationEvent:(NSNotification *)notification {
    // Retrieve the quaternion w x y z from the myo
    TLMOrientationEvent *orientationEvent = notification.userInfo[kTLMKeyOrientationEvent];
    if ([myoFollowSwitch isOn]) {
        [clientSocket emit:@"quaternion" args:@[[[NSDictionary alloc] initWithObjects:@[[NSString stringWithFormat:@"%f",orientationEvent.quaternion.x],[NSString stringWithFormat:@"%f",orientationEvent.quaternion.y],[NSString stringWithFormat:@"%f",orientationEvent.quaternion.z],[NSString stringWithFormat:@"%f",orientationEvent.quaternion.w]] forKeys:@[@"x",@"y",@"z",@"w"]]]];
    }

}

- (void)didReceivePoseChange:(NSNotification *)notification {
    // Retrieve the pose from the NSNotification's userInfo with the kTLMKeyPose key.
    TLMPose *pose = notification.userInfo[kTLMKeyPose];
    NSDictionary *args;
    // Handle the cases of the TLMPoseType enumeration, and change the color of helloLabel based on the pose we receive.
    switch (pose.type) {
        case TLMPoseTypeUnknown:
            NSLog(@"unknown");
            break;
        case TLMPoseTypeRest:
            NSLog(@"resting");
            break;
        case TLMPoseTypeDoubleTap:
            // Changes helloLabel's font to Helvetica Neue when the user is in a rest or unknown pose.
            //[clientSocket emit:@"double_tap"];
            NSLog(@"double_tap");
            break;
        case TLMPoseTypeFist:
            // Changes helloLabel's font to Noteworthy when the user is in a fist pose.
            args = [[NSDictionary alloc] initWithObjects:@[@"pose",@"fist"] forKeys:@[@"type",@"pose"]];
            [clientSocket emit:@"myo" args:@[args]];
            NSLog(@"fist");
            break;
        case TLMPoseTypeWaveIn:
            // Changes helloLabel's font to Courier New when the user is in a wave in pose.
            args = [[NSDictionary alloc] initWithObjects:@[@"Music",@"boom"] forKeys:@[@"animation",@"type"]];
            [clientSocket emit:@"animation" args:@[args]];
            NSLog(@"wave_in");
            break;
        case TLMPoseTypeWaveOut:
            // Changes helloLabel's font to Snell Roundhand when the user is in a wave out pose.
            args = [[NSDictionary alloc] initWithObjects:@[@"Music",@"long_boom"] forKeys:@[@"animation",@"type"]];
            [clientSocket emit:@"animation" args:@[args]];
            NSLog(@"wave_out");
            break;
        case TLMPoseTypeFingersSpread:
            // Changes helloLabel's font to Chalkduster when the user is in a fingers spread pose.
            args = [[NSDictionary alloc] initWithObjects:@[@"pose",@"fingers_spread"] forKeys:@[@"type",@"pose"]];
            [clientSocket emit:@"myo" args:@[args]];
            NSLog(@"fingers_spread");
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
