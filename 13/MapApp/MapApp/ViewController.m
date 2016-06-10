//
//  ViewController.m
//  MapApp
//
//  Created by don't touch me on 6/8/16.
//  Copyright © 2016 trvl, LLC. All rights reserved.
//


@import MapKit;
@import CoreLocation;
#import "ViewController.h"


@interface ViewController () <MKMapViewDelegate, CLLocationManagerDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) CLLocationManager *locationManager;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self startUpdatingLocation];
    
}

-(void)startUpdatingLocation; {
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyKilometer;
    [self.locationManager requestWhenInUseAuthorization];

    
    
}

-(void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    
    NSLog(@"Authorization changed");

    if (status != kCLAuthorizationStatusDenied) {
        [self.locationManager requestLocation];
    }
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"did fail");
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    
    NSLog(@"did update");
    
    CLLocation *location = [locations firstObject];
    CLLocationCoordinate2D coord = location.coordinate;
    
    NSLog(@"latitude ==%2.8f, longitude ==%2.8f", coord.latitude, coord.longitude);
    
        [self centerMapWithCoordinate:coord];
}

-(void)centerMapWithCoordinate:(CLLocationCoordinate2D)center
{
    MKCoordinateRegion region = MKCoordinateRegionMake(center, MKCoordinateSpanMake (0.60, 0.60));

    [self.mapView setRegion:region animated:YES];
    [self.mapView setShowsUserLocation:YES];

}

- (IBAction)locationButton:(UIBarButtonItem *)sender {
    NSLog(@"did update");
    
    [self.locationManager requestLocation];

}

- (IBAction)homeButton:(UIBarButtonItem *)sender {
    NSLog(@"did update");
    
    [self.mapView setMapType:MKMapTypeStandard];
}
- (IBAction)infoButton:(UIBarButtonItem *)sender {
    NSLog(@"did update");
    
    [self.mapView setMapType:MKMapTypeHybridFlyover];
    
}

- (IBAction)satButton:(UIBarButtonItem *)sender {
    
    [self.mapView setMapType:MKMapTypeSatellite];
}





@end
