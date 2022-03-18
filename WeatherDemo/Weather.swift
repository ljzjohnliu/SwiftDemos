//
//  News.swift
//  WeatherDemo
//
//  Created by ByteDance on 2022/3/17.
//

import UIKit

class Weather: Codable {

    var city: String
    var cityid: Int32
    var temp: String
    var WD: String
    var WS: String
    var SD: String
    var AP: String
    var njd: String
    var WSE: String
    var time: String
    var sm: String
    var isRadar: String
    var Radar: String
}

class WeatherAll: Codable {
    var weatherinfo: Weather
}
