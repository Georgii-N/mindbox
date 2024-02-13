import UIKit

class AreaViewController: UIViewController {
    
    // MARK: - Constants and Variables:
    private var shape: AreaCalculatable = CircleModel(radius: 4)
    private var shapeResult: Double?
    
    enum UILocalConstants {
        static let inset: CGFloat = 24
        static let largeInset: CGFloat = 48
        
        static let heightOfButton: CGFloat = 50
        static let heightOfLabel: CGFloat = 100
        
        static let cornerRadius: CGFloat = 12
        static let largeCornerRadius: CGFloat = 24
    }
    
    // MARK: - UI:
    private lazy var segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Circle", "Triangle"])
        segmentedControl.selectedSegmentIndex = 0
        return segmentedControl
    }()
    
    private lazy var calculateAreaButton: UIButton = {
        let calculateAreaButton = UIButton()
        calculateAreaButton.backgroundColor = .gray
        calculateAreaButton.layer.cornerRadius = UILocalConstants.cornerRadius
        calculateAreaButton.setTitle("Раcсчитать площадь", for: [])
        return calculateAreaButton
    }()
    
    private lazy var shapeLabel: UILabel = {
        let shapeLabel = UILabel()
        shapeLabel.numberOfLines = 0
        shapeLabel.textColor = .black
        shapeLabel.textAlignment = .center
        
        shapeLabel.layer.borderWidth = 1
        shapeLabel.layer.borderColor = UIColor.black.cgColor
        shapeLabel.layer.cornerRadius = UILocalConstants.largeCornerRadius
        return shapeLabel
    }()
    
    // MARK: - Lifecycle:
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        addViews()
        addTargets()
    }
    
    // MARK: - Public Methods:
    func setShape(shape: AreaCalculatable) {
        self.shape = shape
    }
    
    func getResult() -> Double? {
        shapeResult
    }
    
    // MARK: - Private Methods:
    private func calculateArea<T:AreaCalculatable>(shape: T) -> Double {
        shape.area()
    }
    
    // MARK: - Objc Methods:
    @objc func didTapCalculateArea() {
        let shapeResult = calculateArea(shape: shape)
        self.shapeResult = shapeResult
        shapeLabel.text = String(shapeResult)
    }
    
    @objc func segmentedControlValueChanged(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            self.shape = CircleModel(radius: 4)
            shapeLabel.text = ""
        case 1:
            self.shape = Triangle(firstSide: 3, secondSide: 4, thirdSide: 5)
            shapeLabel.text = ""
        default:
            break
        }
    }
}

private extension AreaViewController {
    func addViews() {
        view.addSubview(segmentedControl, constraints: [
            segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: UILocalConstants.largeInset),
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: UILocalConstants.inset),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -UILocalConstants.inset),
            segmentedControl.heightAnchor.constraint(equalToConstant: UILocalConstants.heightOfButton)
        ])
        
        view.addSubview(calculateAreaButton, constraints: [
            calculateAreaButton.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: UILocalConstants.inset),
            calculateAreaButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: UILocalConstants.inset),
            calculateAreaButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -UILocalConstants.inset),
            calculateAreaButton.heightAnchor.constraint(equalToConstant: UILocalConstants.heightOfButton)
        ])
        
        view.addSubview(shapeLabel, constraints: [
            shapeLabel.topAnchor.constraint(equalTo: calculateAreaButton.bottomAnchor, constant: UILocalConstants.largeInset),
            shapeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: UILocalConstants.inset),
            shapeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -UILocalConstants.inset),
            shapeLabel.heightAnchor.constraint(equalToConstant: UILocalConstants.heightOfLabel)
        ])
    }
    
    func addTargets() {
        segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged), for: .valueChanged)
        calculateAreaButton.addTarget(self, action: #selector(didTapCalculateArea), for: .touchUpInside)
    }
}
