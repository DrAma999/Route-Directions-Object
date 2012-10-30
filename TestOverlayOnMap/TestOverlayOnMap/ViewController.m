//
//  ViewController.m
//  TestOverlayOnMap
//
//  Created by Andrea Finollo on 26/09/12.
//  Copyright (c) 2012 Andrea Finollo. All rights reserved.
//

#import "ViewController.h"
#import "RouteDirectionsObject.h"

@interface ViewController ()

@property (strong, nonatomic) RouteDirectionsObject *routeObject;
@end



@implementation ViewController




- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.mappa.showsUserLocation = YES;

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    

	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)mapViewDidStopLocatingUser:(MKMapView *)mapView {
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(self.mappa.userLocation.coordinate, 1000, 1000);
    MKCoordinateRegion adjustedRegion = [self.mappa regionThatFits:viewRegion];
    [self.mappa setRegion:adjustedRegion animated:NO];
    
    self.routeObject = [[RouteDirectionsObject alloc]init];
    [self.routeObject createDirectionRequestWithStartPoint:[NSString stringWithFormat:@"%f,%f",self.mappa.userLocation.coordinate.latitude,self.mappa.userLocation.coordinate.longitude] andEndPoint:@"Viale gran sasso milano" withCallBackBlock:^(NSError *error,  NSDictionary *routeDistance, NSDictionary *routeDuration, MKPolyline *routePolyline, NSArray *routes, NSArray *steps, CLLocation * startPoint,  CLLocation * endPoint, NSArray * directions ) {
        NSLog(@"Route Distance:%@ \n Route Duration:%@ \n Polyline:%@ \n Routes:%@ \n Steps:%@", routeDistance, routeDuration, routePolyline, routes, steps);
        [self.mappa addOverlay:routePolyline];
    }];
    [self.routeObject validateAddress:@"Via torino" withCallBackBlock:^(NSError *error,  NSString *addressStatus, NSArray *formattedAddresses, NSArray *addressesGPS) {
        NSLog(@"%@",formattedAddresses);
    }];

}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
    if (userLocation.coordinate.latitude == 0 && userLocation.coordinate.longitude == 0) {
        return;
    }
    self.mappa.showsUserLocation = NO;
}


- (MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id <MKOverlay>)overlay {
    MKPolylineView *polylineView = [[MKPolylineView alloc] initWithPolyline:overlay];
    polylineView.strokeColor = [UIColor redColor];
    polylineView.lineWidth = 3.0;
    polylineView.fillColor = [UIColor yellowColor];

    return polylineView;
}
@end
