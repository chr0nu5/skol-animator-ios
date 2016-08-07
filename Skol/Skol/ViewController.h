//
//  ViewController.h
//  Skol
//
//  Created by Elliot on 7/25/16.
//  Copyright © 2016 FSociety. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SIOSocket/SIOSocket.h>

@interface ViewController : UIViewController {
    // Socket.IO client
    SIOSocket *clientSocket;
    
    // global fields
    UITextField *unicastY;
    UITextField *unicastX;
    UITextField *unicastCommand;
    UISegmentedControl *wallSelector;
    UISlider *angles;
    UITextField *scrollText;
    UISwitch *scrollTextSwitch;
    UITextField *scoreboardTxt1;
    UITextField *scoreboardTxt2;
    UITextField *scoreboardTxt3;
    UITextField *scoreboardTxt4;
    UISegmentedControl *olaSelect;
    UISegmentedControl *idleSelect1;
    UISegmentedControl *idleSelect2;
    UISwitch *musicSwitch;
    UISwitch *myoSwitch;
    UISwitch *myoFollowSwitch;
    UISwitch *pilotSwitch;
    UISwitch *lidarSwitch;
    UILabel *txtAngleNumb;
    UIButton *btnAngle;
    UIButton *scrollTextBtn;
    UILabel *pilotNext;
}


@end

