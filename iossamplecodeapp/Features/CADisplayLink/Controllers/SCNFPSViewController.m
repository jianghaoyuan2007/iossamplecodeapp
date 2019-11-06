//
//  SCNFPSViewController.m
//  iossamplecodeapp
//
//  Created by Stephen Chiang on 2019/11/6.
//  Copyright © 2019 stephenchiang.net. All rights reserved.
//

#import "SCNFPSViewController.h"

@interface SCNFPSViewController ()

@property (weak, nonatomic) IBOutlet UILabel *FPSLabel;

@end

@implementation SCNFPSViewController {
    CADisplayLink *_link;
    NSUInteger _count;
    NSTimeInterval _lastTime;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _link = [CADisplayLink displayLinkWithTarget:self selector:@selector(tick:)];
    [_link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];

}

- (void)tick:(CADisplayLink *)link {
    if (_lastTime == 0) {
        _lastTime = link.timestamp;
        return;
    }
    
    _count++;
    NSTimeInterval delta = link.timestamp - _lastTime;
    if (delta < 1) return;
    _lastTime = link.timestamp;
    float fps = _count / delta;
    _count = 0;
    
    self.FPSLabel.text = [NSString stringWithFormat:@"FPS: %d", (int)round(fps)];
}


@end
