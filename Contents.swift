import UIKit


class VirtualVendingMachine {

    enum DrinkType {
        case coffee
        case water
        case monster
        
        var price: Int {
            switch self {
            case .coffee: return 120
            case .water: return 100
            case .monster: return 210
            }
        }
    }
    
    struct DrinkModel {
        var type: DrinkType
        var stock: Int
    }
    
    enum YenType: Int {
            case IYen = 1
            case VYen = 5
            case XYen = 10
            case LYen = 50
            case CYen = 100
            case DYen = 500
            case MYen = 1000
    }

    var inputedYen: Int = 0
    var availableBalance: Int = 1000
    
    var coffeePrice: Int = 120
    var waterPrice: Int = 100
    var monsterPrice: Int = 210

    var coffeeStock: Int = 1
    var waterStock: Int = 15
    var monsterStock: Int = 5


    func buyDrink(type: DrinkType, inputedYen: Int) -> Bool {
        self.inputedYen = inputedYen
        
        var isBuyable = false
        
        switch type {
        case .coffee:
            isBuyable = coffeePrice <= inputedYen && 0 < coffeeStock
            if isBuyable {
                self.inputedYen -= coffeePrice
                self.availableBalance += coffeePrice
            }
            if coffeeStock == 0 {
                print("- Sold out -")
            }
        case .water:
            isBuyable = waterPrice <= inputedYen && 0 < waterStock
            if isBuyable {
                self.inputedYen -= waterPrice
                self.availableBalance += waterPrice
            }
            if waterStock == 0 {
                print("- Sold out -")
            }
        case .monster:
            isBuyable = monsterPrice <= inputedYen && 0 < monsterStock
            if isBuyable {
                self.inputedYen -= monsterPrice
                self.availableBalance += monsterPrice
            }
            if monsterStock == 0 {
                print("- Sold out -")
            }
        }
        
        if isBuyable {
            reduceStock(type: type)
        }
        
        return isBuyable
    }

//購入処理で使う機能 (在庫を1つ減らす)
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

print("Coffee stock is \(virtualVendingMachine.coffeeStock).")
print("Water stock is \(virtualVendingMachine.waterStock).")
print("Monster stock is \(virtualVendingMachine.monsterStock).")
print("AvailableBalance is ¥\(virtualVendingMachine.availableBalance).")

let buyingCoffee = virtualVendingMachine.buyDrink(type: .coffee, inputedYen: 160)
print(buyingCoffee)

print("Change is ¥\(virtualVendingMachine.inputedYen).")
print("coffee stock is \(virtualVendingMachine.coffeeStock).")

let buyingWater = virtualVendingMachine.buyDrink(type: .water, inputedYen: 200)
print(buyingWater)

print("Change is ¥\(virtualVendingMachine.inputedYen).")
print("Water stock is \(virtualVendingMachine.waterStock).")

let buyingCoffee2 = virtualVendingMachine.buyDrink(type: .coffee, inputedYen: 150)
print(buyingCoffee2)

print("Change is ¥\(virtualVendingMachine.inputedYen).")
print("coffee stock is \(virtualVendingMachine.coffeeStock).")
print("AvailableBalance is ¥\(virtualVendingMachine.availableBalance).")
