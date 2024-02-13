import Foundation

struct CircleModel: AreaCalculatable {
    var radius: Double
    
    func area() -> Double {
        Double.pi * radius * radius
    }
}
