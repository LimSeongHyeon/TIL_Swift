//
//  LatexView.swift
//  TIL
//
//  Created by Lim on 2022/08/09.
//

import Foundation
import SwiftUI
import RichTextView

// REF : https://iosexample.com/ios-text-view-uiview-that-properly-displays-latex-and-youtube-vimeo-links/
struct LatexView : UIViewRepresentable
{
	@Binding var latex : NSMutableAttributedString
	
	func makeUIView(context: Context) -> RichTextView
	{
		let richTextView = RichTextView(
			input: latex.string,
			latexParser: LatexParser(),
			font: UIFont.systemFont(ofSize: UIFont.systemFontSize),
			textColor: UIColor.black,
			frame: CGRect.zero,
			completion: nil
		)
		
		return richTextView
	}
	
	func updateUIView(_ uiView: RichTextView, context: Context)
	{
			uiView.update(
				input: latex.string,
				latexParser: LatexParser(),
				font: UIFont.systemFont(ofSize: UIFont.systemFontSize),
				textColor: UIColor.black,
				completion: nil
			)
	}
}

// Ref : https://www.hackingwithswift.com/quick-start/swiftui/how-to-wrap-a-custom-uiview-for-swiftui
struct LatexTestView: View
{
	var string1 : String = "[math]{x}^{2}+"
	
	var body: some View
	{
		VStack
		{
			ForEach(1..<5, id: \.self)
			{	index in
				LatexView(latex: .constant(NSMutableAttributedString(string: string1 + "\(index)[/math]"))).frame(width: 100, height: 30)
			}
		}

	}
}

struct LatexTestView_Previews: PreviewProvider
{
	static var previews: some View
	{
		LatexTestView()
	}
}
