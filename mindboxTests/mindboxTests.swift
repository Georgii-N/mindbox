import XCTest
@testable import mindbox

final class mindboxTests: XCTestCase {

    func testCircleShape() {
        
        //given
        let vc = AreaViewController()
        let circle = CircleModel(radius: 5)
        vc.setShape(shape: circle)
        
        //when
        vc.didTapCalculateArea()
        let result = vc.getResult() ?? 0
        
        //then
        XCTAssertEqual(result, 78.5, accuracy: 0.1)
    }
    
    func testTriangleShape() {
        
        //given
        let vc = AreaViewController()
        let circle = Triangle(firstSide: 3, secondSide: 4, thirdSide: 5)
        vc.setShape(shape: circle)
        
        //when
        vc.didTapCalculateArea()
        let result = vc.getResult() ?? 0
        
        //then
        XCTAssertEqual(result, 6, accuracy: 0.1)
    }
    
    func testIsRightTriangle() {
        
        //given
        let circle = Triangle(firstSide: 3, secondSide: 4, thirdSide: 5)
       
        
        //when
        let isRight = circle.isRightTriangle()
        
        //then
        XCTAssertTrue(isRight)
    }
    
    func testIsNotRightTriangle() {
        //given
        let circle = Triangle(firstSide: 3, secondSide: 3, thirdSide: 5)
       
        
        //when
        let isRight = circle.isRightTriangle()
        
        //then
        XCTAssertFalse(isRight)
    }
}
