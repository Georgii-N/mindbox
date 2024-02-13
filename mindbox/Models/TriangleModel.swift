import Foundation

struct Triangle: AreaCalculatable {
    var firstSide: Double
    var secondSide: Double
    var thirdSide: Double
    
    func area() -> Double {
        let semiPerimeter = (firstSide + secondSide + thirdSide) / 2
        return sqrt(semiPerimeter * (semiPerimeter - firstSide) * (semiPerimeter - secondSide) * (semiPerimeter - thirdSide))
    }
    
    func isRightTriangle() -> Bool {
        let sides = [firstSide, secondSide, thirdSide].sorted()
        return sides[0] * sides[0] + sides[1] * sides[1] == sides[2] * sides[2]
    }
}
