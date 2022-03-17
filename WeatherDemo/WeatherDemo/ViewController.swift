//
//  ViewController.swift
//  WeatherDemo
//
//  Created by ByteDance on 2022/3/16.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tv: UITextView!
//    public var context: NSManagedObjectContext
    
    @IBAction func btnPressed(sender: AnyObject) {
        print("Button clicked!")
        loadWeater()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        loadWeater()
        tv.text = "获取到的天气信息是：0000000"
    }

    func loadWeater() {
        let seesion = URLSession(configuration: .default)
        let url = "http://www.weather.com.cn/data/sk/101110101.html"
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"

        let task = seesion.dataTask(with: request) {(data, response, error) in
            if data == nil {
                return
            }
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                print(json)
//                self.tv.text = json.object(forKey: "weatherinfo") as? String
                self.tv.text = "获取到的天气信息是！！！"
            } catch {
                print("无法连接到服务器")
                return
            }
        }

        task.resume()
    }
}

/*
 let decode = JSONDecoder();
 if let data = json.data(using: .utf8) {
     let item = try? decode.decode(WeatherModel.self, from: json);
     print("item: \(item)");
 }
 {
     weatherinfo =     {
         AP = "962.7hPa";
         Radar = "JC_RADAR_AZ9290_JB";
         SD = "52%";
         WD = "\U897f\U5357\U98ce";
         WS = "\U5c0f\U4e8e3\U7ea7";
         WSE = "<3";
         city = "\U897f\U5b89";
         cityid = 101110101;
         isRadar = 1;
         njd = "\U6682\U65e0\U5b9e\U51b5";
         sm = "1.2";
         temp = "23.3";
         time = "18:00";
     };
 }
 */
struct WeatherModel: Codable {
    var weatherinfo: WeatherInfo
}

struct WeatherInfo: Codable {
    var AP = "";
    var Radar = "";
    var SD = "";
    var WD = "";
    var WS = "";
    var WSE = "";
    var city = "";
    var cityid = 0;
    var isRadar = 0;
    var njd = "";
    var sm = "";
    var temp = "";
    var time = "";
}
