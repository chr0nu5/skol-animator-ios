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
- (void)chooseMyo:(id)sender {
    // Note that when the settings view controller is presented to the user, it must be in a UINavigationController.
    UINavigationController *controller = [TLMSettingsViewController settingsInNavigationController];
    // Present the settings view controller modally.
    [self presentViewController:controller animated:YES completion:nil];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:255/255.0 green:209/255.0 blue:10/255.0 alpha:1];
    
    // initialize the socket.io connection
    [SIOSocket socketWithHost: @"http://192.168.0.110:3000" response: ^(SIOSocket *socket) {
        clientSocket = socket;
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
    [clientSocket emit:@"quaternion" args:@[[[NSDictionary alloc] initWithObjects:@[[NSString stringWithFormat:@"%f",orientationEvent.quaternion.x],[NSString stringWithFormat:@"%f",orientationEvent.quaternion.y],[NSString stringWithFormat:@"%f",orientationEvent.quaternion.z],[NSString stringWithFormat:@"%f",orientationEvent.quaternion.w]] forKeys:@[@"x",@"y",@"z",@"w"]]]];

}

- (void)didReceivePoseChange:(NSNotification *)notification {
    // Retrieve the pose from the NSNotification's userInfo with the kTLMKeyPose key.
    TLMPose *pose = notification.userInfo[kTLMKeyPose];
    NSDictionary *args;
    // Handle the cases of the TLMPoseType enumeration, and change the color of helloLabel based on the pose we receive.
    switch (pose.type) {
        case TLMPoseTypeUnknown:
        case TLMPoseTypeRest:
        case TLMPoseTypeDoubleTap:
            // Changes helloLabel's font to Helvetica Neue when the user is in a rest or unknown pose.
            [clientSocket emit:@"double_tap"];
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
