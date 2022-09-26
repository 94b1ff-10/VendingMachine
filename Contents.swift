import UIKit

class VirtualVendingMachine {
    enum DrinkType {
        case coffee
        case water
        case monster
    }

    var inputedYen: Int = 0

    var coffeePrice: Int = 120
    var waterPrice: Int = 100
    var monsterPrice: Int = 210

    var coffeeStock: Int = 10
    var waterStock: Int = 15
    var monsterStock: Int = 5

    func buyDrink(type: DrinkType, inputedYen: Int) -> Bool {
        self.inputedYen = inputedYen
        var isBuyable = false
        switch type {
        case .coffee:
            isBuyable = coffeePrice <= inputedYen && 0 < coffeeStock
        case .water:
            isBuyable = waterPrice <= inputedYen && 0 < waterStock
        case .monster:
            isBuyable = monsterPrice <= inputedYen && 0 < monsterStock
        }
        reduceStock(type: type)
        return isBuyable
    }

    func reduceStock(type: DrinkType) {
        switch type {
        case .coffee:
            coffeeStock -= 1
        case .water:
            waterStock -= 1
        case .monster:
            monsterStock -= 1
        }
    }
}

let virtualVendingMachine = VirtualVendingMachine()
let isSuccessToBuy = virtualVendingMachine.buyDrink(type: .coffee, inputedYen: 150)

print(isSuccessToBuy)
