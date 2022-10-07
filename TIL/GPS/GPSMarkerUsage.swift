	//
	//  GPSMarkerUsage.swift
	//  TIL
	//
	//  Created by Lim on 2022/10/06.
	//

import SwiftUI
import MapKit

class Annotation: NSObject, MKAnnotation
{
	let title: String?
	let coordinate: CLLocationCoordinate2D
	
	init(title: String, coordinate: CLLocationCoordinate2D)
	{
		self.title = title
		self.coordinate = coordinate
	}
	
	init(title: String, latitude: CLLocationDegrees, longitude: CLLocationDegrees)
	{
		self.title = title
		self.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
	}
	
}

class DynamicAnnotation: NSObject, MKAnnotation
{
	let title: String?
	dynamic var coordinate: CLLocationCoordinate2D
	
	init(title: String, coordinate: CLLocationCoordinate2D)
	{
		self.title = title
		self.coordinate = coordinate
	}
	
	init(title: String, latitude: CLLocationDegrees, longitude: CLLocationDegrees)
	{
		self.title = title
		self.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
	}
	
	func updateAnnotationPosition(withCoordinate coordinate: CLLocationCoordinate2D)
	{
		UIView.animate(withDuration: 0.2)
		{
			self.coordinate = coordinate
		}
	}
}



struct GPSMarkerUsage: UIViewRepresentable
{
	@StateObject var locationManager = LocationManager()
	@State var userAnnotation : DynamicAnnotation?
	
	let markers : [Annotation] = [Annotation(title:"1", latitude: 37.61699078, longitude: 127.01206413),
								  Annotation(title:"2", latitude: 37.61700087, longitude: 127.01206424),
								  Annotation(title:"3", latitude: 37.61801096, longitude: 127.01206435),
								  Annotation(title:"4", latitude: 37.61902105, longitude: 127.01206446)]
	
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
	
	func makeCoordinator() -> MapViewCoordinator
	{
		MapViewCoordinator(self)
	}
	
	func updateUIView(_ uiView: UIViewType, context: Context)
	{
		let coordinate = CLLocationCoordinate2D(latitude: userLatitude, longitude: userLongitude)
		let span = MKCoordinateSpan(latitudeDelta: 0.003, longitudeDelta: 0.003)
		let region = MKCoordinateRegion(center: coordinate, span: span)
		
		uiView.removeAnnotations(uiView.annotations)
		
		
		let annotation = MKPointAnnotation()
		annotation.coordinate = coordinate
		annotation.title = "User"
		uiView.addAnnotation(annotation)
		
		uiView.delegate = context.coordinator
		
		uiView.addAnnotations(markers)
		
		uiView.setRegion(region, animated: true)
	}
}

class MapViewCoordinator: NSObject, MKMapViewDelegate
{
	var mapViewController: GPSMarkerUsage
	var currentSpan: MKCoordinateSpan?
	
	init(_ control: GPSMarkerUsage)
	{
		self.mapViewController = control
	}
	
	func mapViewDidChangeVisibleRegion(_ mapView: MKMapView)
	{
		self.currentSpan = mapView.region.span
	}
	
	func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?
	{
			//Custom View for Annotation
		let annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "User")
		annotationView.canShowCallout = true
		
			//Your custom image icon
		
		switch(annotation.title)
		{
			case "User":
				annotationView.image = UIImage(systemName: "location.circle.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal)
				
			default:
				annotationView.image = UIImage(systemName: "pin.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal)
			
		}
		
		
		let size = CGSize(width: 20, height: 20)
		annotationView.image = UIGraphicsImageRenderer(size:size).image
		{
			 _ in annotationView.image!.draw(in:CGRect(origin:.zero, size:size))
		}
		annotationView.accessibilityLabel = "test"
		return annotationView
	}
}

struct GPSMarkerUsage_Previews: PreviewProvider
{
	static var previews: some View
	{
		GPSMarkerUsage()
	}
}
