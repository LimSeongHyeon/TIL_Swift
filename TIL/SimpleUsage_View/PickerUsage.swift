//
//  PickerUsage.swift
//  TIL
//
//  Created by Lim on 2022/09/19.
//

import SwiftUI

struct PickerUsage: View
{
	let testList = ["2017", "2018", "2019", "2020"]
	@State var selected = ""
	
    var body: some View
	{
		Picker("Select Something", selection: $selected)
		{
			ForEach(testList, id: \.self)
			{
				Text($0)
					.tag($0)
			}
		}
		.frame(width: 134, height: 28)
		.overlay(
			RoundedRectangle(cornerRadius: 20).strokeBorder(.blue))
    }
}

struct PickerUsage_Previews: PreviewProvider {
    static var previews: some View {
        PickerUsage()
    }
}
