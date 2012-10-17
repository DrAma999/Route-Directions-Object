//
//  ViewController.h
//  TestOverlayOnMap
//
//  Created by Andrea Finollo on 26/09/12.
//  Copyright (c) 2012 Andrea Finollo. All rights reserved.
//
#import <MapKit/MapKit.h>
#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mappa;

@end
