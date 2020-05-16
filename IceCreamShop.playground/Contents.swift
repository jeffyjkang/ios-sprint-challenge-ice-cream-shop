
struct Flavor {
    let name: String
    var rating: Double
}

enum Size: Double {
    case small = 1.99
    case medium = 2.99
    case large = 3.99
}

struct Cone {
    let flavor: Flavor
    let topping: String
    let size: Size
    func eat() {
        print("Mmm! I love \(flavor)!")
    }
}

class IceCreamShop {
    var flavors: [Flavor]
    var sizes: [Size]
    var toppings: [String]
    var totalSales: Double
    init(flavors: [Flavor], sizes: [Size], toppings: [String]) {
        self.flavors = flavors
        self.sizes = sizes
        self.toppings = toppings
        self.totalSales = 0
    }
    func listTopFlavors() {
        let topFlavors = self.flavors.filter{ $0.rating > 4.0}.map{$0.name}
        print("Our top flavors are: \(topFlavors.joined(separator: ", "))")
    }
    func orderCone(flavor: Flavor, topping: String?, size: Size) -> Cone? {
        let cone = Cone(flavor: flavor, topping: topping ?? "No toppings", size: size)
        totalSales = totalSales + cone.size.rawValue
        print("Your \(flavor.name) ice cream with \(topping ?? "No toppings") is \(cone.size.rawValue)")
        return cone
    }
}

let coffee = Flavor(name: "Coffee", rating: 3.5)
let vanilla = Flavor(name: "Vanilla", rating: 4.5)
let chocolate = Flavor(name: "Chocolate", rating: 3.2)
let strawberry = Flavor(name: "Strawberry", rating: 4.8)

let allFlavors = [coffee, vanilla, chocolate, strawberry]
let allSizes = [Size.small, Size.medium, Size.large]
let allToppings = ["Sprinkles", "Cream", "Nuts"]

let lambdaIceCreamShop = IceCreamShop(flavors: allFlavors, sizes: allSizes, toppings: allToppings)
lambdaIceCreamShop.listTopFlavors()

let cone = lambdaIceCreamShop.orderCone(flavor: strawberry, topping: "Sprinkles", size: .large)
if let unwrappedCone = cone {
    unwrappedCone.eat()
}
print(lambdaIceCreamShop.totalSales)
