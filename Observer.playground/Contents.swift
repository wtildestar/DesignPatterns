import Foundation

protocol Subject {
    
    func add(observer: PropertyObserver)
    func remove(observer: PropertyObserver)
    func notify(withString string: String)
    
}

class Teacher: Subject {
    
    // для добавления наблюдателей
    var observerCollection = NSMutableSet() // NSMutableSet для изменения коллекции в единственном экземпляре
    var homeTask = "" {
        didSet {
            notify(withString: homeTask)
        }
    }
    
    func add(observer: PropertyObserver) {
        observerCollection.add(observer)
    }
    
    func remove(observer: PropertyObserver) {
        observerCollection.remove(observer)
    }
    
    func notify(withString string: String) {
        for observer in observerCollection {
            (observer as! PropertyObserver).didGet(newTask: string)
        }
    }
    
    
}

protocol PropertyObserver {
    
    func didGet(newTask task: String)
    
}

// наследуюсь от NSObject чтобы чтобы поместить Pupil в NSMutableSet
class Pupil: NSObject, PropertyObserver {
    
    var homeTask = ""
    
    func didGet(newTask task: String) {
        homeTask = task
        print("new homework to be done")
    }
    
}

let teacher = Teacher()
let pupil = Pupil()

teacher.add(observer: pupil)
teacher.homeTask = "Задача 3 на странице 21"

pupil.homeTask
