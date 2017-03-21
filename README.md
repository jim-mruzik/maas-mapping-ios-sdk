PWMapKit SDK for iOS
====================

> Version 3.1.0

**PWMapKit** is a comprehensive indoor mapping and wayfinding SDK that allows easy integration with Phunware's indoor maps and location-based services.  Visit http://maas.phunware.com/ for more details and to sign up.


## Requirements

- PWLocation v3.0.0 or greater (Automatically include when pod install PWMapKit)
- PWCore v3.0.3 or greater (Automatically include when pod install PWMapKit)
- iOS 8.0 or greater
- Xcode 8 or greater


## Installation

* Phunware recommends using [CocoaPods](http://www.cocoapods.org) to integrate the framework. Simply add

	`pod 'PWMapKit'`

	to your podfile, then the dependencies of `PWCore` and `PWLocation` are automatically added.

* Then add navigation icons the `Framework/MNW_Images.xcassets` to your project.

* Disable Bitcode by following these steps:
1. Select your project target.
2. Select Build Settings
3. Navigate to Build Options > Enable Bitcode
4. Set to NO


## Documentation

Framework documentation is included in the the repository's `Documents` folder in both HTML and Docset formats. You can also find the [latest documentation online](http://phunware.github.io/maas-mapping-ios-sdk/).


## Usage

The primary use of the components of PWMapKit revolve around creating a map view, displaying points of interest, showing the user's location and indoor routing.


### Adding Map View

```objc
// Load a building.
[PWBuilding buildingWithIdentifier:<#buildingID#> completion:^(PWBuilding *building, NSError *error) {
	// Get the buliding object here
	<#building#>					
}];

...

// Show the building on the map
PWMapView *map = [[PWMapView alloc] initWithFrame:<#frame#>];
map.delegate = self;
[self.view addSubview:map];

[mapView setBuilding:<#building#>];
```


### Set Indoor Location Manager

```objc
[mapView setMapViewLocationType:<#locationType#> configuration:<#configuration#>];
```

### Routing

```
PWRoute initRouteFrom:<#startPoint#> to:<#endPoint#> accessibility:<#accessibility#> completion:^(PWRoute *route, NSError *error) {
	// Plot the route on the map
	[mapView navigateWithRoute:route];            
}];
```

## Attribution

PWMapKit uses the following third-party components. All components are prefixed with `PW` to avoid namespace collisions should your application also use an included component.

| Component | Description | License |
|:---------:|:-----------:|:-------:|
|[SVPulsingAnnotationView](https://github.com/samvermette/SVPulsingAnnotationView)|A customizable MKUserLocationView replica for your iOS app.|[MIT](https://github.com/samvermette/SVPulsingAnnotationView/blob/master/LICENSE.txt)|

Privacy
-----------
You understand and consent to Phunware’s Privacy Policy located at www.phunware.com/privacy. If your use of Phunware’s software requires a Privacy Policy of your own, you also agree to include the terms of Phunware’s Privacy Policy in your Privacy Policy to your end users.
