import UIKit
//設計図
class VirtualVendingMachine {
    
//使用する対象まとめ
    enum DrinkType {
        case coffee
        case water
        case monster
    }

    enum YenType: Int {
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

//購入処理
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
    
//購入処理で使う機能 (入力された硬貨の種類と数を判別する)
    func checkYen(type: YenType, count: Int) -> Int {
        switch type {
        case .XYen: return YenType.XYen.rawValue * count
        case .LYen: return YenType.LYen.rawValue * count
        case .CYen: return YenType.CYen.rawValue * count
        case .DYen: return YenType.DYen.rawValue * count
        case .MYen: return YenType.MYen.rawValue * count
        }
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

let test = virtualVendingMachine.checkYen(type: .LYen, count: 3)
print(test)
