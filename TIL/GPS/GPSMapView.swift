//
//  GPSMapView.swift
//  TIL
//
//  Created by Lim on 2022/10/06.
//

import SwiftUI
import MapKit

/**
 REF : https://atelier-chez-moi.tistory.com/62
 
 UIViewRepresentable protocol has two requirements
 
 - One is makeUIView(con text:) method that is create MKMapView
 - Another is updateUIView(_: context:) method that is response from changes of statement
 
 */

struct GPSMapView: UIViewRepresentable
{
	@StateObject var locationManager = LocationManager()

	var userLatitude: CLLocationDegrees
	{
		return locationManager.lastLocation?.coordinate.latitude ?? 0
	}
	
	var userLongitude: CLLocationDegrees
	{
		return locationManager.lastLocation?.coordinate.longitude ?? 0
	}
	
	func makeUIView(context: Context) -> MKMapView
	{
		MKMapView(frame: .zero)
	}
	
	func updateUIView(_ uiView: UIViewType, context: Context)
	{
		let coordinate = CLLocationCoordinate2D(latitude: userLatitude, longitude: userLongitude)
		let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
		let region = MKCoordinateRegion(center: coordinate, span: span)
		uiView.setRegion(region, animated: true)
	}
}

struct GPSMapView_Previews: PreviewProvider
{
    static var previews: some View
	{
        GPSMapView()
    }
}
