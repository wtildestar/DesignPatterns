class Driver {
    var isGoodDriver: Bool
    let name: String
    
    init(isGood: Bool, name: String) {
        self.isGoodDriver = isGood
        self.name = name
    }
}

class Car {
    
    var goodDriverIterator: GoodDriverIterator {
        return GoodDriverIterator(drivers: drivers)
    }
    
    var badDriverIterator: BadDriverIterator {
        return BadDriverIterator(drivers: drivers)
    }
    
    private let drivers = [Driver(isGood: true, name: "Mark"),
                           Driver(isGood: false, name: "Maria"),
                           Driver(isGood: true, name: "Berton"),
                           Driver(isGood: true, name: "Kristen"),
                           Driver(isGood: false, name: "Kate")]
}

//extension Car: Sequence {
//    func makeIterator() -> GoodDriverIterator {
//        return GoodDriverIterator(drivers: drivers)
//    }
//}

protocol BasicIterator: IteratorProtocol {
    init(drivers: [Driver])
    func allDrivers() -> [Driver]
}

class GoodDriverIterator: BasicIterator {
    private let drivers: [Driver]
    private var current = 0
    
    required init(drivers: [Driver]) {
        self.drivers = drivers.filter{ $0.isGoodDriver }
    }
    
    func next() -> Driver? {
        defer { current += 1 }
        return drivers.count > current ? drivers[current] : nil
    }
    
    func allDrivers() -> [Driver] {
        return drivers
    }
}

class BadDriverIterator: BasicIterator {
    private var drivers: [Driver]
    private var current = 0
    
    required init(drivers: [Driver]) {
        self.drivers = drivers.filter{ $0.isGoodDriver != true }
    }
    
    func allDrivers() -> [Driver] {
        return drivers
    }
    
    func next() -> Driver? {
        defer { current += 1 }
        return drivers.count > current ? drivers[current] : nil
    }
}

let car = Car()
let goodDriverIterator = car.goodDriverIterator.next()
//print(goodDriverIterator)
//for driver in car {
//    print(driver.name)
//}

let badDriverIterator = car.badDriverIterator.next()
//for badDriver in Driver {
//    print(badDriver.name)
//}

//let goodDriverIteratorViaSequence = car.makeIterator().allDrivers()
