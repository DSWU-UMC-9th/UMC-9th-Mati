// MARK: - Dictionary
// 키와 값을 하나의 쌍으로 저장
// 각 키는 고유해야 함

var dict: [String: Int] = [:]

var scores: [String: Int] = ["Miju": 100, "Mati": 80]
let score = scores["Miju"]
print(score)

scores["Micky"] = 88 // 추가
scores["Miju"] = 80 // 수정
scores["Miju"] = nil // 제거

for (name, score) in scores {
    print("\(name)의 점수: \(score)")
}

// 주요 메서드
if let oldValue = scores.updateValue(95, forKey: "Archie") {
    print("Archie의 이전 점수는 \(oldValue)점입니다.")
} else {
    print("Archie의 점수가 새로 추가되었습니다.")
}

if let value = scores.removeValue(forKey: "Miju") {
    print("Miju의 점수 \(value)가 삭제되었습니다.")
} else {
    print("Miju의 점수를 찾을 수 없습니다.")
}

// 복잡한 데이터 딕셔너리
var classGrades: [Int: [String: Int]] = [
    1: ["Miju": 85, "Mati": 90],
    2: ["Archie": 95, "Micky": 88],
]

// MARK: - Set
// 순서 없이 고유한 값 저장
// 중복되지 않는 값을 저장해야 할 때 유용
// 동일한 값 여러 번 저장 가능
// 순서 없기 때문에 인덱스 접근 불가
// 값의 유일성에 중점
// 선택된 항목 관리, 중복된 단어 필터링 등에 사용

var set = Set<String>()

var fruits: Set<String> = ["Apple", "Banana"]
var colors: Set<String> = ["Red", "Green", "Blue"]

// 주요 메서드
colors.insert("Yellow") // 추가
print(colors)

colors.remove("Green") // 제거
print(colors)

// 집합 연산
let setA: Set = [1, 2, 3, 4, 5]
let setB: Set = [4, 5, 6, 7, 8]

let intersection = setA.intersection(setB) // 교집합
print(intersection)

let union = setA.union(setB) // 합집합
print(union)

let subtracing = setA.subtracting(setB) // 차집합
print(subtracing)

let symmetricDifference = setA.symmetricDifference(setB) // 대칭 차집합
print(symmetricDifference)

// MARK: - Enum
// 열거형
// 연관된 값의 그룹 정의
// 타입 안정성 - 정해진 값만 사용하게 강제
// 메서드 추가 가능

enum Weekday: Int {
    case monday = 1
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday
}

var today: Weekday = .friday
print("오늘은 \(today.rawValue)번째 요일입니다.")

// 메서드 정의
enum LightSwitch {
    case on
    case off
    
    mutating func toggle() {
        self = (self == .on) ? .off : .on
    }
}

var light: LightSwitch = .off
light.toggle()
print(light)

// Iterator - 반복 가능하게
enum Beverage: CaseIterable {
    case coffee
    case tea
    case juice
}

for beverage in Beverage.allCases {
    print(beverage)
}

// MARK: - 실습
// == 1번 ==

// 1. 학생들의 점수 딕셔너리 선언
var scoreDict: [String: Int] = ["Alice": 100, "Bob": 100, "Min": 100]

// 2. “Alice”의 점수를 95점으로 수정
scoreDict["Alice"] = 95

// 3. “Bob”의 점수를 삭제하고, 남은 학생들의 점수를 출력
scoreDict["Bob"] = nil
print(scoreDict)

// == 2번 ==

// 1. 과일 목록 세트 선언
var fruitSet: Set<String> = ["Apple", "Banana", "Orange"]

// 2. “Banana”가 이미 존재하는지 확인하고, 존재하면 “Mango”를 추가하세요
if fruitSet.contains("Banana") {
    fruitSet.insert("Mango")
}

// 3. 세트에 있는 모든 과일을 반복문으로 출력하세요
for fruit in fruitSet {
    print(fruit)
}

// == 3번 ==

// 1. 네트워크 요청 상태 열거형 정의
enum NetworkState {
    case idle
    case requesting
    case success(String)
    case failure(Error)
}

// 2. 네트워크 요청 상태를 나타내는 변수 선언
let currentState: NetworkState = .success("데이터 로드 완료")

// 3. switch문으로 상태에 맞는 출력 작성
switch currentState {
case .idle:
    print("현재 대기 상태입니다.")
case .requesting:
    print("요청 중입니다...")
case .success(let success):
    print("요청 성공: \(success)")
case .failure(let error):
    print("요청 실패: \(error)")
}

