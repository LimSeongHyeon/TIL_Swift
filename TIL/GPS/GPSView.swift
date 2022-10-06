	//
	//  GPSView.swift
	//  TIL
	//
	//  Created by Lim on 2022/10/04.
	//
import SwiftUI
import MapKit

struct GPSView: View
{
	@StateObject var locationManager = LocationManager()

	var userLatitude: String
	{
		return "\(locationManager.lastLocation?.coordinate.latitude ?? 0)"
	}
	
	var userLongitude: String
	{
		return "\(locationManager.lastLocation?.coordinate.longitude ?? 0)"
	}
	
	var body: some View
	{
		VStack
		{
			Text("location status: \(locationManager.statusString)")
			VStack
			{
				Text("latitude: \(userLatitude)")
				Text("longitude: \(userLongitude)")
			}
		}
	}
}

struct GPSView_Previews: PreviewProvider {
	static var previews: some View {
		GPSView()
	}
}
