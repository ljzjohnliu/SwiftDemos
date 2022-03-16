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
