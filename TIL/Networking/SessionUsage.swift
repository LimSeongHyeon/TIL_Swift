//
//  SessionUsage.swift
//  TIL
//
//  Created by Lim on 2022/09/23.
//

// Ref : https://greatpapa.tistory.com/66
// REF : https://greatpapa.tistory.com/64?category=427056
// REF : https://ios-development.tistory.com/651
import Foundation

	// 0. Set URL to String
let url = "https://www.skuniv.ac.kr/index.php"


func patchNoticeData(url: String, page: Int)
{
		// 1. Definition Configuration and Session
	let config = URLSessionConfiguration.default
	let session = URLSession(configuration: config)
	
		// 2. url changes by URLComponents
	var urlComponents = URLComponents(string: url)
	
		// 3. add parameter
	let midQuery = URLQueryItem(name: "mid", value:"notice")
	let pageQuery = URLQueryItem(name: "page", value:String(page))
	urlComponents?.queryItems?.append(midQuery)
	urlComponents?.queryItems?.append(pageQuery)
	
		// 4. check requestURL
	guard let requestURL = urlComponents?.url else { return }
	let dataTask = session.dataTask(with: requestURL)
	{	(data, response, error) in
		
			// 4.1. If cause some error, do return
		guard error == nil else { return }
		
			// 4.2. If get a invalid status code, do return
		let successRange = 200..<300
		guard let statusCode = (response as? HTTPURLResponse)?.statusCode,
			  successRange.contains(statusCode) else { return }
		
			// 4.3. If there is no data, do return
		guard let resultData = data else { return }
		
			// 4.4. Transportaion to urf8
		let resultString = String(data: resultData, encoding: .utf8) ?? ""
		
		print(resultData)
		print(resultString)
	}
	
	dataTask.resume()
}
