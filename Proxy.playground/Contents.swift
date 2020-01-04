// виртуальный заместитель
//class User {
//    let id = "123"
//}
//
//protocol ServerProtocol {
//    func grandAccess(user: User)
//    func deniedAccess(user: User)
//}
//
//class ServerSide: ServerProtocol {
//    func grandAccess(user: User) {
//        print("access granted to user with id = \(user.id)")
//    }
//    func deniedAccess(user: User) {
//        print("access denied to user with id = \(user.id)")
//    }
//}
//
//class ServerProxy: ServerProtocol {
//    lazy private var server: ServerSide = ServerSide()
//
//    func grandAccess(user: User) {
//        server.grandAccess(user: user)
//    }
//    func deniedAccess(user: User) {
//        server.deniedAccess(user: user)
//    }
//}
//
//let user = User()
//let proxy = ServerProxy()
//proxy.grandAccess(user: user)
//proxy.deniedAccess(user: user)

// защитный заместитель
class User {
    let name = "wtilde"
    let password = "111"
}

protocol ServerProtocol {
    func grantAccess(user: User)
}

class ServerSide: ServerProtocol {
    func grantAccess(user: User) {
        print("access granted to user with name = \(user.name)")
    }
}

class ServerProxy: ServerProtocol {
    private var server: ServerSide!
    func grantAccess(user: User) {
        guard server != nil else {
            print("access can't be granted")
            return
        }
        server.grantAccess(user: user)
    }
    
    func authenticate(user: User) {
        guard user.password == "111" else { return }
        print("user authenticated")
        server = ServerSide()
    }
}

let user = User()
let proxy = ServerProxy()

proxy.grantAccess(user: user)
proxy.authenticate(user: user)
proxy.grantAccess(user: user)
