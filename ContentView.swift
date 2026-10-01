import SwiftUI

// перерахування
enum BicycleType: String {
    case mountain = "Гірський"
    case road = "Дорожній"
    case hybrid = "Гібрид"
}

// структура
struct Bicycle {
    let brand: String
    let type: BicycleType?
    let numberOfGears: Int?
    
    var description: String {
        let typeStr = type?.rawValue ?? "Не вказано"
        let gearsStr = numberOfGears != nil ? "\(numberOfGears!)" : "Не вказано" //тренарний оператор
        return "Марка: \(brand) | Тип: \(typeStr) | Передач: \(gearsStr)"
    }
}

class Cyclist: Identifiable {
    let id = UUID() // ідентифікаторр екземплярів
    let name: String
    let bicycle: Bicycle?
    
    init(name: String, bicycle: Bicycle? = nil) {
        self.name = name
        self.bicycle = bicycle
    } // ініціалізатор
    
    
    var bicycleInfo: String {
        if let bike = bicycle {
            return bike.description
        } else {
            return "Не має велосипеда"
        }
    }
}


struct ContentView: View {
    let cyclists: [Cyclist] = [
        Cyclist(name: "Andriy", bicycle: Bicycle(brand: "Trek", type: .mountain, numberOfGears: 11)),
        Cyclist(name: "Ivan", bicycle: Bicycle(brand: "Ukraine", type: .hybrid, numberOfGears: 1)),
        Cyclist(name: "Roman", bicycle: Bicycle(brand: "Giant", type: .road, numberOfGears: 21)),
        Cyclist(name: "Олексій", bicycle: nil)
    ]
    
    var body: some View {
        NavigationStack {
            List(cyclists) { cyclist in
                VStack(alignment: .leading, spacing: 6) {
                    Text(cyclist.name)
                        .font(.headline)
                        .foregroundColor(.blue)
                    
                    Text(cyclist.bicycleInfo)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding(.vertical, 4)
            }
            .navigationTitle("Велосипедисти")
        }
    }
}
