import UIKit

// MARK: - 함수 (Functions)
func greetAgain(person: String) -> String { "Hello again, \(person)!" }

func greet(person: String) -> String { "Hello, \(person)!" }

func greet(person: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return greetAgain(person: person)
    } else {
        return greet(person: person)
    }
}

print(greet(person: "Miju", alreadyGreeted: true))

func printAndCount(string: String) -> Int {
    print(string)
    return string.count
}
func printWithoutCounting(string: String) {
    let _ = printAndCount(string: string)
}

printAndCount(string: "hello, world")
printWithoutCounting(string: "hello, world")

// MARK: - 클로저 (Closures)
// 일급 객체
// 변수나 상수 등으로 저장 가능한 형태

// func + 이름있음 => 클로저, 함수
func pay(user: String, amount: Int) {
    // code
}
// func X + 이름없음 => 클로저
let payment = { (user: String, amount: Int) in
    // code
}

let closure = { (user: String) -> String in
    return "Hello, \(user)"
}
closure("Miju")
//closure(user: "Miju")

// 일급 객체로 클로저 사용
let closure2 = { () -> String in
    return "Hello Miju"
}
print(closure2())

// 경량 문법
func doSomething(closure: (Int, Int, Int) -> Int) {
    closure(1, 2, 3)
}
doSomething(closure: { (a: Int, b: Int, c: Int) -> Int in
    return a + b + c
})
doSomething(closure: { (a, b, c) in
    return a + b + c
})
doSomething(closure: {
    return $0 + $1 + $2
})

// MARK: - Class
// 클래스 기본 개념
class UMC {
    // 속성
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    // 메서드 (인스턴스 메서드)
    func message() {
        print("안녕하세요! UMC입니다.")
    }
}

let umc = UMC(name: "Mati", age: 23)

class Circle {
    // 저장 속성
    var radius: Double
    
    // 계산 속성
    var diameter: Double {
        return radius * 2
    }
    
    init(radius: Double) {
        self.radius = radius
    }
}

class Math {
    // 타입 메서드
    class func square(_ number: Int) -> Int {
        return number * number
    }
}
let result = Math.square(5)
print(result)

// 클래스 초기화
class Animal {
    var name: String = "Dog"
    var age: Int = 0
}
let animal = Animal() // 기본 이니셜라이저
print(animal.name)
print(animal.age)

class Person {
    var name: String
    var age: Int
    
    init(name: String, age: Int) { // 커스텀 이니셜라이저
        self.name = name
        self.age = age
    }
}
let person = Person(name: "Mati", age: 23)
print(person.name)
print(person.age)

class Vehicle {
    var model: String
    
    init?(model: String) {
        if model.isEmpty {
            return nil // 초기화 실패
        }
        self.model = model
    }
}
if let car = Vehicle(model: "KIA") {
    print("초기화 성공")
} else {
    print("초기화 실패")
}
if let invalidCar = Vehicle(model: "") {
    print("초기화 성공")
} else {
    print("초기화 실패")
}

class Parent {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}
class Child: Parent {
    var age: Int
    
    init(name: String, age: Int) {
        self.age = age
        super.init(name: name) // 이니셜라이저 상속
    }
}

class Person2 {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    convenience init(name: String) { // 편의 이니셜라이저
        self.init(name: name, age: 28)
    }
    
    convenience init() {
        self.init(name: "Mati", age: 23)
    }
}

let personA = Person2(name: "Mati", age: 23) // 지정 이니셜라이저 사용
let personB = Person2(name: "Mati") // 편의 이니셜라이저 사용 (나이 생략)
let personC = Person2() // 편의 이니셜라이저 사용 (이름과 나이 생략)

// 클래스와 상속
class Vehicle2 {
    var speed = 0
    
    func description() -> String {
        return "\(speed) km/h"
    }
}
class Car: Vehicle2 {
    var gear = 1
    
    func changeGear(to gear: Int) {
        self.gear = gear
    }
    
    // 부모 클래스의 메서드 재정의
    override func description() -> String {
        return super.description() + " 현재 기어: \(gear)"
    }
}
let car = Car()
car.speed = 120
car.changeGear(to: 3)
print(car.description())

final class Animal2 { // final 키워드로 상속 방지
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

// 클래스와 접근 제어
    // open: 모듈 외부 접근 가능 / 클래스 메서드 상속 및 재정의 가능 / 프레임워크
    // public: 모듈 외부 접근 가능 / 클래스 상속 및 재정의 불가능 / 라이브러리 프레임워크의 API
    // internal: 같은 모듈 내 접근 가능 / 디폴트 (명시하지 않으면 internal)
    // fileprivate: 같은 파일 내 접근 가능
    // private: 같은 선언 내 접근 가능

// 참조 카운트
class Person3 {
    let name: String
    
    init(name: String) {
        self.name = name
        print("\(name) 이니셜")
    }
    
    deinit {
        print("\(name) 디이니셜")
    }
}
var person1: Person3? = Person3(name: "Miju")   // 참조 카운트: 1
var person2 = person1                           // 참조 카운트: 2
person1 = nil                                   // 참조 카운트: 1
person2 = nil                                   // 참조 카운트: 0 (메모리 해제)

// 약한 참조
class Person4 {
    let name: String
    var apartment: Apartment?
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("\(name) deinit")
    }
}
class Apartment {
    let unit: String
    weak var tenant: Person4? // 약한 참조
    
    init(unit: String) {
        self.unit = unit
    }
    
    deinit {
        print("Apartment \(unit) deinit")
    }
}
var alice: Person4? = Person4(name: "Alice")
var bob: Apartment? = Apartment(unit: "Bob")
alice!.apartment = bob
bob!.tenant = alice
alice = nil // Person 인스턴스 해제
bob = nil // Apartment 인스턴스 해제

// MARK: - Struct
// 클래스는 참조 타입 => 메모리 주소 참조
// 구조체는 값 복사 => 각 인스턴스가 독립적인 메모리 공간

struct Rectangle {
    // 속성
    var width: Double
    var height: Double
    
    // 메서드
    func area() -> Double {
        return width * height
    }
}

struct Person5 {
    var name: String
    var age: Int
}
let personD = Person5(name: "Mati", age: 23) // 멤버와이즈 이니셜라이저
print(personD.name)
print(personD.age)

struct Car2 {
    var brand: String
    var model: String
    let year: Int
}
var car1 = Car2(brand: "Toyota", model: "Corolla", year: 2020)
print(car1.brand)
print(car1.year)
car1.brand = "Honda"
//car1.year = 2021

struct Counter {
    var count = 0
    
    // mutating 키워드 => 인스턴스 메서드
    // 구조체의 인스턴스와 연관된 메서드
    // 구조체의 속성에 접근하거나 변경 가능
    
    // 구조체의 속성 변경하는 메서드
    mutating func increment() {
        count += 1
    }
    
    // 지정된 값만큼 증가시키는 메서드
    mutating func increment(by amount: Int) {
        count += amount
    }
    
    // 카운트를 초기화하는 메서드
    mutating func reset() {
        count = 0
    }
}
var counter = Counter()
counter.increment()
print(counter.count)
counter.increment(by: 5)
print(counter.count)
counter.reset()
print(counter.count)

struct Math2 {
    // static 키워드 => 타입 메서드
    // 구조체 인스턴스가 아닌 구조체 자체와 관련된 작업
    // 구조체 내 타입 속성에 접근하거나 특정 타입과 관련된 작업 수행
    
    static func square(_ number: Int) -> Int {
        return number * number
    }
    
    static func cube(_ number: Int) -> Int {
        return number * number * number
    }
}
let squareValue = Math2.square(4)
let cubeValue = Math2.cube(3)
print(squareValue)
print(cubeValue)
