import UIKit

var greeting = "Hello, playground"

func join(_ string1: String, _ string2: String) -> String {
//    string1 + string2
    "\(string1)\(string2)"
}

join("qq", "ww")


class Animal {
    func move() -> String {
        "移动"
    }
    
    func eat() -> String {
        "张嘴吃"
    }
}

class Bird: Animal {
    override func move() -> String {
        "飞行"
    }
    override func eat() -> String {
        super.eat() + "虫子"
    }
}

let animal = Animal.init()
animal.move()
animal.eat()

let bird = Bird()
bird.move()
bird.eat()

func isBird(_ animal: Animal) -> Bool {
    animal is Bird
}

func convertToBird(_ animal: Animal) -> Bool {
    if let _ = animal as? Bird {
        return true
    }
    return false
}

isBird(animal)
convertToBird(animal)

isBird(bird)
convertToBird(bird)

protocol Flyable {
    func fly() -> String
}

extension Bird: Flyable {
    func fly() -> String {
        move()
    }
}

bird.fly()

class Airplane: Flyable {
    func fly() -> String {
        "飞机飞行"
    }
}

let airplane = Airplane()
airplane.fly()

//String数组
let stringArray: [String] = ["a", "b", "c"]

let firstString = stringArray.first
let firstString2 = stringArray[0]

let lastString = stringArray.last
let lastString2 = stringArray[2]

var scores: [Double] = []
//var scores = [Double]()
scores.isEmpty
scores.count

scores.append(70)
scores[0] = 90
scores.append(80)

scores.insert(85, at: 1)
scores.insert(75, at: 0)
scores.insert(95, at: 4)

scores += [99, 98]

var highScores = [Double]()
var scoreDic: [Double: Int] = [:]
for (i, score) in scores.enumerated() {
    scoreDic[score] = i
    if score >= 90 {
        highScores.append(score)
    }
}
highScores
scoreDic

scores.remove(at: 6)
scores.removeLast()

var sum = 0.0

for score in scores {
    sum += score
}

sum

sum = 0.0
for i in 0..<scores.count {
    print("For loop i: \(i)")
    sum += scores[i]
}
sum

print()
sum = 0
for (i, score) in scores.enumerated() {
    print("For loop i: \(i)")
    sum += score
}
sum

//var dic = [String: String]()
var dic: [String: String] = [:]
dic["a"] = "a"
dic
dic["a"] = "A"
dic
dic["b"] = "B"
dic
dic["c"] = "C"
dic
dic["c"] = nil
dic

let aValue = dic["a"]
let cValue = dic["c"]
let cValue2 = dic["c"] ?? "C"
let cValue3 = dic["c", default: "C"]

print()
for key in dic.keys {
    let value = dic[key]!
    print("key is \(key), value is \(value)")
}

print()
for value in dic.values {
    print("value is \(value)")
}

//Array是有序的 dic是无序的
print()
for (_, pair) in dic.enumerated() {
    print("key is \(pair.key), value is \(pair.value)")
}

var num:Int
for i in 0...100 {
    num = i
}

//强制类型转换
let sa = 3
let pi = 3.1415
let add = Double(sa) + pi;
print(add)

//类型别名
typealias AudioSample = UInt16
var minValue = AudioSample.min
print(minValue)

//元组
let people = (18, "xiaoming")
let (age, name) = people
print("The age is \(age)")
print("The name is \(name)")
//分解的时候要忽略的部分用_表示
let (justAge, _) = people
print("The age is \(justAge)")
print(people.0)

//定义元组的时候给单个元素命名
let rec = (w: 10, h: 20)
print("\(rec.w)")
print(rec.h)

//可选类型：处理值可能缺失的情况
let str = "1234"
let convertNum = Int(str)
print(convertNum)//convertNum 是 optional Int 或者 Int?
if convertNum != nil {
    print(convertNum!)//可选值的强制解析
}

let count = 3_000_0
let countedThings = "stars in the Milky Way"
var naturalCount: String
switch count {
case 0:
    naturalCount = "no"
case 1...3:
    naturalCount = "a few"
case 4...9:
    naturalCount = "several"
case 10...99:
    naturalCount = "tens of"
case 100...999:
    naturalCount = "hundreds of"
case 1000...999_999:
    naturalCount = "thousands of"
default:
    naturalCount = "millions and millions of"
}

func addTwoInts(a: Int, b: Int) -> Int {
    return a + b
}

func multiplyTwoInts(a: Int, b: Int) -> Int {
    return a * b
}

var mathFuction: (Int, Int) -> Int = addTwoInts

print("Result:\(mathFuction(2, 3))")

func printMathResult(mathFunction: (Int, Int) -> Int, a: Int, b: Int) {
    print("Result: \(mathFunction(a, b))")
}

printMathResult(mathFunction: addTwoInts, a: 3, b: 5)
