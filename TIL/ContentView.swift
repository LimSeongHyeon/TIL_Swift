//
//  ContentView.swift
//  TIL
//
//  Created by Lim on 2022/08/09.
//

import SwiftUI

struct ContentView: View
{
    var body: some View
	{
		GPSMarkerUsage()
			.ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
	{
        ContentView()
    }
}
