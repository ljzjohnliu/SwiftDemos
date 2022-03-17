import UIKit

//load weather
//var url = NSURL(string: "http://www.weather.com.cn/data/sk/101110101.html")

let seesion = URLSession(configuration: .default)
let url = "http://www.weather.com.cn/data/sk/101110101.html"
var request = URLRequest(url: URL(string: url)!)
request.httpMethod = "GET"

let task = seesion.dataTask(with: request) {(data, response, error) in
    do {
        let json = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
        print(json)
//        var weatherInfo = json.object(forKey: "weatherinfo")
//        print(weatherInfo)
//        let city = weatherInfo.object(forKey: "city")
//        print(city)
    } catch {
        print("无法连接到服务器")
        return
    }
}

task.resume()
