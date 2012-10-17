Route-Directions-Object
=======================

This is a simple Objective-C class, that manages simple direction calls to Google Maps API.
Since it uses GMAPS API you should comply to Google Mobile Maps terms of service. 
You can find these terms of service at http://code.google.com/apis/maps/iphone/terms.html.

The sample contains hard coded strings for addresses, you should change them.

Many thanks to Ankit Srivastava for the Polyline Decoding Algorithm.

Follow me on twitter: @DrAma78

LICENSE MIT

/****************************************************************************

INPUT

NSString * aStartPoint: address or comma separated GPS coordinates.

NSString * anEndPoint: address or comma separated GPS coordinates.

NSString * anAddress: address that should be validated.


 
******************************************************************************/


/****************************************************************************

OUTPUT

NSError * error: contains an error object that could be related to networking, json parsing, or invalis adresses and routes. Use [error localizedDescription] to show the error cause.

NSDictionary * routeDistance: a dictionary with two key-value. Key "text" will ask for a fomatted distance text, key "value" will ask for a number that represents the distance in meters.

NSDictionary * routeDuration: a dictionary with two key-value. Key "text" will ask for a fomatted time duration text, key "value" will ask for a number that represents the duration in seconds.

MKPolyline * routePolyline: an MKPolyline object object that could be used to show an MKPolylineView that overlays the map.

NSArray * routes: main google response array, use if you need something that is not returned.

NSArray * steps: array of dictionaries containing information about the route navigation step.

CLLocation * startPoint, CLLocation * endPoint: start point and end point of the route.

NSArray * directions: contains an array of strings aboute route indications. Note that they contains HTML tags.

NSString * addressStatus: address validation status.

NSArray * formattedAddress: array of corresponding addresses dictionary found. formattedAddress e addressesGPSLocations are paired.

NSArray * addressesGPSLocations: array of corresponding addresses found in GPS coordinates (dictionary with keys "lat" e "lng". formattedAddress e addressesGPSLocations are paired.


******************************************************************************/