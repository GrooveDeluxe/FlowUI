# Table of Contents

- [1 UIKit extensions](#1-uikit-extensions)
    - [1.1 UIView](#11-uiview)
        - [1.1.1 Instantiation](#111-instantiation)
        - [1.1.2 Adding views with insets](#112-adding-views-with-insets)
        - [1.1.3 Adding views with pin to edges](#113-adding-views-with-pin-to-edges)
        - [1.1.4 Wrapping in container](#114-wrapping-in-container)
        - [1.1.5 Convenience initializers](#115-convenience-initializers)
        - [1.1.6 Chainable methods](#116-chainable-methods)
        - [1.1.7 Tap recognition](#117-tap-recognition)
        - [1.1.8 Configurable protocol](#118-configurable-protocol)
    - [1.2 UILabel](#12-uilabel)
        - [1.2.1 Instantiation](#121-instantiation)
        - [1.2.2 Convenience initializers](#122-convenience-initializers)
        - [1.2.3 Chainable methods](#123-chainable-methods)
    - [1.3 UIButton](#13-uibutton)
        - [1.3.1 Instantiation](#131-instantiation)
        - [1.3.2 Convenience initializers](#132-convenience-initializers)
        - [1.3.3 Chainable methods](#133-chainable-methods)
    - [1.4 UIScrollView](#14-uiscrollview)
        - [1.4.1 Instantiation](#141-instantiation)
        - [1.4.2 Convenience initializers](#142-convenience-initializers)
        - [1.4.3 Chainable methods](#143-chainable-methods)
    - [1.5 UIStackView](#15-uistackview)
        - [1.5.1 Instantiation](#151-instantiation)
        - [1.5.2 Convenience initializers](#152-convenience-initializers)
        - [1.5.3 Extended methods](#153-extended-methods)
    - [1.6 UIActivityIndicatorView](#16-uiactivityindicatorview)
        - [1.6.1 Instantiation](#161-instantiation)
        - [1.6.2 Convenience initializers](#162-convenience-initializers)
        - [1.6.3 Chainable methods](#163-chainable-methods)
    - [1.7 UISwitch](#17-uiswitch)
        - [1.7.1 Instantiation](#171-instantiation)
        - [1.7.2 Convenience initializers](#172-convenience-initializers)
        - [1.7.3 Chainable methods](#173-chainable-methods)
    - [1.8 UISlider](#18-uislider)
        - [1.8.1 Instantiation](#181-instantiation)
        - [1.8.2 Convenience initializers](#182-convenience-initializers)
        - [1.8.3 Chainable methods](#183-chainable-methods)
    - [1.9 UIStepper](#19-uistepper)
        - [1.9.1 Instantiation](#191-instantiation)
        - [1.9.2 Convenience initializers](#192-convenience-initializers)
        - [1.9.3 Chainable methods](#193-chainable-methods)
    - [1.10 UIPageControl](#110-uipagecontrol)
        - [1.10.1 Instantiation](#1101-instantiation)
        - [1.10.2 Convenience initializers](#1102-convenience-initializers)
        - [1.10.3 Chainable methods](#1103-chainable-methods)
    - [1.11 UITextField](#111-uitextfield)
        - [1.11.1 Instantiation](#1111-instantiation)
        - [1.11.2 Convenience initializers](#1112-convenience-initializers)
        - [1.11.3 Chainable methods](#1113-chainable-methods)
    - [1.12 UIDatePicker](#112-uidatepicker)
        - [1.12.1 Instantiation](#1121-instantiation)
        - [1.12.2 Convenience initializers](#1122-convenience-initializers)
        - [1.12.3 Chainable methods](#1123-chainable-methods)
    - [1.30 UIControl](#130-uicontrol)
        - [1.30.1 Instantiation](#1301-instantiation)
        - [1.30.2 Chainable methods](#1302-chainable-methods)
- [2 UIComponents protocol](#2-uicomponents-protocol)
    - [2.1 scrollView](#21-scrollview)
    - [2.2 stack](#22-stack)
    - [2.3 label](#23-label)
        - [2.3.1 label (String)](#231-label-string)
        - [2.3.2 label (Attributed string)](#232-label-attributed-string)
    - [2.4 button](#24-button)
        - [2.4.1 button (String)](#241-button-string)
        - [2.4.2 button (Attributed string)](#242-button-attributed-string)
        - [2.4.3 button (Image)](#243-button-image)
    - [2.5 imageView](#25-imageview)
    - [2.6 space](#26-space)
    - [2.7 flexibleSpace](#27-flexiblespace)
    - [2.8 container](#28-container)
    - [2.9 activityIndicator](29-activityindicator)
    - [2.10 switcher](#210-switcher)
    - [2.11 slider](#211-slider)
    - [2.12 stepper](#212-stepper)
    - [2.13 pageControl](#213-pagecontrol)
    - [2.14 textField](#214-textfield)
    - [2.15 datePicker](#215-datepicker)
- [3 UIViewBuilder](#3-uiviewbuilder)


# 1 UIKit extensions 

All convenience initializators below have set translatesAutoresizingMaskIntoConstraints to false. If you want it equals true, then you can use the translatesAutoresizingMaskIntoConstraints(true) chainable method.

### 1.1 UIView

#### 1.1.1 Instantiation
##### Pure UIKit:
```swift
    private lazy var someView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.widthAnchor.constraint(equalToConstant: 200),
            view.heightAnchor.constraint(equalToConstant: 100)
        }
        view.backgroundColor = .red
        view.layer.borderColor = .black.cgColor
        view.layer.borderWidth = 1
        return view
    }
```

##### FlowUI:
```swift
    private lazy var someView = UIView(color: .red, width: 200, height: 100)
        .border() // Because default parameters: color = .black, width = 1
    
    // Alternative 1
    private lazy var someView = UIView(color: .grey, size: .square(100))
    
    // Alternative 2
    private lazy var horizontalSeparator = UIView(color: .grey, height: 1)
    
    // Alternative 3
    private lazy var verticalSeparator = UIView(color: .red, width: 1)
```

#### 1.1.2 Adding views with insets
##### Pure UIKit:
```swift
    let insets = UIEdgeInsets(top: 16, left: 32, bottom: 16, right: 32)
    subview.translatesAutoresizingMaskIntoConstraints = false
    addSubview(subview)
    NSLayoutConstraint.activate([
        subview.topAnchor.constraint(equalTo: topAnchor, constant: insets.top),
        subview.leadingAnchor.constraint(equalTo: leadingAnchor, constant: insets.left),
        subview.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -insets.right),
        subview.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -insets.bottom)
    ])
```

##### FlowUI:
```swift
    addSubview(subview, insets: .symmetry(h: 16, v: 32))
    
    // Alternative 1
    addSubview(subview, insets: .zero.top(16).left(32))
    
    // Alternative 2
    addSubview(subview, insets: .horizontal(16, top: 8, bottom: 24))
    
    // Alternative 3
    addSubview(subview, insets: .vertical(16, left: 8, right: 0))

    // Alternative 4
    addSubview(subview, insets: .all(20).horizontal(32))

    // Alternative 5
    addSubview(subview, insets: .all(20).vertical(10))
```

#### 1.1.3 Adding views with pin to edges
##### Pure UIKit:
```swift
    subview.translatesAutoresizingMaskIntoConstraints = false
    addSubview(subview)
    NSLayoutConstraint.activate([
        subview.topAnchor.constraint(equalTo: topAnchor, constant: 16)
        subview.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
    ])
```

##### FlowUI:
```swift
    addSubview(subview, pinnedTo: .top(16), left(16))
    
    // Alternative 1
    addSubview(subview, pinnedTo: .top.relation(.greaterThanOrEqual).priority(.defaultLow), left(16))
    
    // Alternative 2
    addSubview(subview, pinnedTo: .top.greaterThanOrEqual.priority(.defaultLow), left(16))
    
    // Alternative 3
    addSubview(subview, pinnedTo: .top(16).safeArea, .centerX, .topBottom(16).safeArea)
```

#### 1.1.4 Wrapping in container
##### Pure UIKit:
```swift
extension UIView {
    func wrappedInContainer(insets: UIEdgeInsets = .zero) -> UIView {
        let container = UIView()
        self.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(self)
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: topAnchor, constant: insets.top),
            self.leadingAnchor.constraint(equalTo: leadingAnchor, constant: insets.left),
            self.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -insets.right),
            self.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -insets.bottom)
        ])
        return container
    }
}
```

##### FlowUI:
```swift
    someView.wrappedInContainer(insets: .symmetry(h: 16, v: 32))

    // Alternative
    someView.wrappedInContainer(pinnedTo: .top(10), .left, .right)
```

#### 1.1.5 Convenience initializers
```swift
    convenience init(color: UIColor = .clear, width: CGFloat? = nil, height: CGFloat? = nil)
    
    convenience init(color: UIColor = .clear, size: CGSize)
```

#### 1.1.6 Chainable methods
```swift
    func translatesAutoresizingMaskIntoConstraints(_ translates: Bool) -> Self
    func isUserInteractionEnabled(_ enabled: Bool) -> Self
    func backgroundColor(_ color: UIColor?) -> Self
    func cornerRadius(_ radius: CGFloat, mask: CACornerMask = []) -> Self
    func maskedCorners(_ maskedCorners: CACornerMask) -> Self
    func cornerCurve(_ value: CALayerCornerCurve) -> Self
    func isHidden(_ value: Bool) -> Self
    func clipsToBounds(_ clips: Bool = true) -> Self
    func contentHuggingPriority(_ priority: UILayoutPriority, for axis: NSLayoutConstraint.Axis) -> Self
    func contentCompressionResistancePriority(_ priority: UILayoutPriority, for axis: NSLayoutConstraint.Axis) -> Self
    func contentMode(_ mode: UIView.ContentMode) -> Self
    func layoutMargins(_ value: UIEdgeInsets) -> Self
    func directionalLayoutMargins(_ value: NSDirectionalEdgeInsets) -> Self
    func preservesSuperviewLayoutMargins(_ value: Bool) -> Self
    func insetsLayoutMarginsFromSafeArea(_ value: Bool) -> Self
    
    // Extended
    func wrappedInContainer(insets: UIEdgeInsets = .zero) -> UIView
    func wrappedInContainer(pinnedTo edges: Edge...) -> UIView
    
    func size(_ size: CGSize) -> Self
    func size(width: CGFloat? = nil, height: CGFloat? = nil) -> Self

    func aspectRatio(_ ratio: CGFloat) -> Self
    
    func pinTo(_ view: UIView, edges: Edge...) -> Self
    func pinTo(_ view: UIView, edges: [Edge]) -> Self
    
    func border(color: UIColor = .black, width: CGFloat = 1.0) -> Self
    
    func shadow(_ style: ShadowStyle) -> Self
    func shadow(color: UIColor = .black,
                x: CGFloat = 0,
                y: CGFloat = 0,
                blur: CGFloat = 0,
                spread: CGFloat = 0) -> Self
    func shadow(color: UIColor = .black,
                offset: CGSize = CGSize(width: 0, height: 5.0),
                blur: CGFloat = 20,
                spread: CGFloat = 0) -> Self
```

#### 1.1.7 Tap recognition
```swift
    let view = UIView(color: .blue, size: .square(100))
        .addTapGestureRecognizer {
            // Handle tap
        }
```

#### 1.1.8 Configurable protocol

With adoption Configurable protocol to UIView, you can additional configure any UIVIew subclasses.

```swift
    // FlowUI Configurable
    public protocol Configurable {}
    
    public extension Configurable {
        @discardableResult
        func configure(_ configure: (Self) -> Void) -> Self {
            configure(self)
            return self
        }
    }
    
    // Adoption
    extension UIView: Configurable {}
    
    // Usage
    private var attributedButton: UIButton?
    
    private lazy var stackView = stack(.vertical, spacing: 8) {
        label("Some text".body)
            .isUserInteractionEnabled(true)
            .configure { [weak self] in
                let recognizer = UILongPressGestureRecognizer(target: self, action: #selector(labelLongPress))
                $0.addGestureRecognizer(recognizer)
            }
        
        button(attributedTitle: "Done".h3)
            .size(height: 40)
            .configure { [weak self] in
                self?.attributedButton = $0
                $0.addTarget(self, action: #selector(touchUpInside), for: .touchUpInside)
            }
    }    
```


### 1.2 UILabel

#### 1.2.1 Instantiation
##### Pure UIKit:
```swift
    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Title"
        return label
    }()
```

##### FlowUI:
```swift
    private lazy var = UILabel(text: "Title")
    
    // Alternative 1
    private lazy var = UILabel(
        text: "Title",
        font: .systemFont(ofSize: 24, weight: .bold),
        textColor: .darkGray,
        textAlignment: .center,
        numberOfLines: 3
    )
    
    // Alternative 2
    private lazy var = UILabel(attributedText: "Title".titleH1) // Attributed string

    // Alternative 3
    private lazy var = UILabel()
        .size(width: 300)
        .attributedText("Very important text with attributed text style".body.foregroundColor(.red))
```


#### 1.2.2 Convenience initializers
```swift
    convenience init(text: String? = "",
                     font: UIFont? = nil,
                     textColor: UIColor? = nil,
                     textAlignment: NSTextAlignment = .left,
                     numberOfLines: Int = 0)
    
    convenience init(attributedText: NSAttributedString? = nil,
                     textAlignment: NSTextAlignment = .left,
                     numberOfLines: Int = 0)
```

#### 1.2.3 Chainable methods
```swift
    func text(_ text: String?) -> Self
    func font(_ font: UIFont) -> Self
    func textColor(_ textColor: UIColor) -> Self
    func shadowColor(_ shadowColor: UIColor) -> Self
    func shadowOffset(_ shadowOffset: CGSize) -> Self
    func textAlignment(_ textAlignment: NSTextAlignment) -> Self
    func lineBreakMode(_ lineBreakMode: NSLineBreakMode) -> Self
    func attributedText(_ attributedText: NSAttributedString?) -> Self
    func highlightedTextColor(_ highlightedTextColor: UIColor) -> Self
    func isHighlighted(_ isHighlighted: Bool) -> Self
    func isEnabled(_ isEnabled: Bool) -> Self
    func numberOfLines(_ numberOfLines: Int) -> Self
    func adjustsFontSizeToFitWidth(_ adjustsFontSizeToFitWidth: Bool) -> Self
    func baselineAdjustment(_ baselineAdjustment: UIBaselineAdjustment) -> Self
    func minimumScaleFactor(_ minimumScaleFactor: CGFloat) -> Self
    func allowsDefaultTighteningForTruncation(_ allowsDefaultTighteningForTruncation: Bool) -> Self
    func lineBreakStrategy(_ lineBreakStrategy: NSParagraphStyle.LineBreakStrategy) -> Self
    func preferredMaxLayoutWidth(_ preferredMaxLayoutWidth: CGFloat) -> Self
    func showsExpansionTextWhenTruncated(_ showsExpansionTextWhenTruncated: Bool) -> Self
    
    // Extended
    func hideIfTextNilOrEmpty() -> Self
```

Also all UIView chainable methods available.


### 1.3 UIButton

#### 1.3.1 Instantiation
##### Pure UIKit:
```swift
    private lazy var button: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 8
        NSLayoutConstraint.activate([
            view.widthAnchor.constraint(equalToConstant: 300),
            view.heightAnchor.constraint(equalToConstant: 50)
        }
        button.addTarget(self, action: #selector(buttonTouchUpInside), for: .touchUpInside)
        return button
    }()
```

##### FlowUI:
```swift
    private lazy var button = UIButton("Login")
        .size(width: 300, height: 50)
        .titleColor(.white)
        .backgroundColor(.blue)
        .cornerRadius(8)
        .addAction { [weak self] in
            self?.buttonTouchUpInside()
        }
    
    // Alternative 1
    private lazy var button = UIButton("Login".bold18, type: .system)
        .addAction(for: .touchUpInside) { [weak self] in
            self?.buttonTouchUpInside()
        }

    // Alternative 2
    private lazy var button = UIButton("Login".bold18, type: .system)
        .addAction(for: .touchUpInside, with: self) {
            $0.buttonTouchUpInside()
        }
    
    // Alternative 3
    private lazy var button = UIButton(.moreIcon)
        .addAction(on: viewModel, do: ViewModel.onMoreButton)
```


#### 1.3.2 Convenience initializers
```swift
    convenience init(_ title: String?, type: UIButton.ButtonType = .custom)

    convenience init(_ attributedTitle: NSAttributedString?, type: UIButton.ButtonType = .custom)

    convenience init(_ image: UIImage?, type: UIButton.ButtonType = .custom)
```

#### 1.3.3 Chainable methods
```swift
    func titleFont(_ font: UIFont) -> Self
    func tintColor(_ tintColor: UIColor) -> Self
    func title(_ title: String?, for state: UIControl.State = .normal) -> Self
    func titleColor(_ color: UIColor?, for state: UIControl.State = .normal) -> Self
    func titleShadowColor(_ color: UIColor?, for state: UIControl.State = .normal) -> Self
    func image(_ image: UIImage?, for state: UIControl.State = .normal) -> Self
    func backgroundImage(_ image: UIImage?, for state: UIControl.State = .normal) -> Self
    func attributedTitle(_ title: NSAttributedString?, for state: UIControl.State = .normal) -> Self
    func contentEdgeInsets(_ contentEdgeInsets: UIEdgeInsets) -> Self
    func titleEdgeInsets(_ titleEdgeInsets: UIEdgeInsets) -> Self
    func imageEdgeInsets(_ imageEdgeInsets: UIEdgeInsets) -> Self
    func reversesTitleShadowWhenHighlighted(_ reversesTitleShadowWhenHighlighted: Bool) -> Self
    func adjustsImageWhenHighlighted(_ adjustsImageWhenHighlighted: Bool) -> Self
    func adjustsImageWhenDisabled(_ adjustsImageWhenDisabled: Bool) -> Self
    func showsTouchWhenHighlighted(_ showsTouchWhenHighlighted: Bool) -> Self
```

Also all UIView chainable methods available.

### 1.4 UIScrollView

#### 1.4.1 Instantiation
```swift
    private lazy var scrollView = UIScrollView(contentInsets: .all(32))
```

#### 1.4.2 Convenience initializers

```swift
    convenience init(contentInsets: UIEdgeInsets,
                     contentInsetAdjustmentBehavior: ContentInsetAdjustmentBehavior = .automatic)
```

#### 1.4.3 Chainable methods
```swift
    func contentInsetAdjustmentBehavior(_ behavior: ContentInsetAdjustmentBehavior) -> Self
    func alwaysBounceVertical(_ needBounce: Bool) -> Self
    func alwaysBounceHorizontal(_ needBounce: Bool) -> Self
    func refreshControl(_ refreshControl: UIRefreshControl) -> Self
```

Also all UIView chainable methods available.


### 1.5 UIStackView

#### 1.5.1 Instantiation
```swift
    private lazy var stackView = UIStackView(.vertical, spacing: 8) {
        // Views to arrange
    }
```

#### 1.5.2 Convenience initializers

```swift
    convenience init(_ axis: NSLayoutConstraint.Axis,
                     spacing: CGFloat = 0,
                     distribution: UIStackView.Distribution = .fill,
                     alignment: UIStackView.Alignment = .fill,
                     @UIViewBuilder viewsBuilder: () -> [UIView])
                     
    convenience init(_ axis: NSLayoutConstraint.Axis,
                     spacing: CGFloat = 0,
                     distribution: UIStackView.Distribution = .fill,
                     alignment: UIStackView.Alignment = .fill,
                     views: [UIView] = [])
```

#### 1.5.3 Extended methods
```swift
    func removeAllArrangedSubviews()
    func replaceArrangedSubviews(@UIViewBuilder arrangedSubviewsBuilder: () -> [UIView])
    func addArrangedSubviews(@UIViewBuilder arrangedSubviewsBuilder: () -> [UIView])
    func addArrangedSubviews(_ arrangedSubviews: [UIView])
    func isBaselineRelativeArrangement(_ value: Bool) -> Self
    func isLayoutMarginsRelativeArrangement(_ value: Bool) -> Self
```

Also all UIView chainable methods available.


### 1.6 UIActivityIndicatorView

#### 1.6.1 Instantiation
```swift
    private lazy var activityIndicatorView = UIActivityIndicatorView()
```

#### 1.6.2 Convenience initializers

```swift
    convenience init(_ style: UIActivityIndicatorView.Style, color: UIColor = .gray, hidesWhenStopped: Bool = true)
```

#### 1.6.3 Chainable methods
```swift
    func style(_ newStyle: UIActivityIndicatorView.Style) -> Self
    func hidesWhenStopped(_ hides: Bool) -> Self
    func color(_ newColor: UIColor) -> Self
    
    // Extended for startAnimating() and stopAnimating()
    func animated(_ animated: Bool) -> Self
```

### 1.7 UISwitch

#### 1.7.1 Instantiation
##### Pure UIKit:
```swift
    private lazy var uiSwitch: UISwitch = {
        let uiSwitch = UISwitch()
        uiSwitch.translatesAutoresizingMaskIntoConstraints = false
        uiSwitch.isOn = true
        uiSwitch.addTarget(self, action: #selector(onSwitchValueChanged), for: .valueChanged)
        return uiSwitch
    }()
```

##### FlowUI:
```swift
    private lazy var switcher = UISwitch(isOn: true)
        .addAction(for: .valueChanged, keyPath: \.isOn, on: self, do: VC.onSwitcherValueChanged)

    // Alternative 1
    private lazy var switcher = UISwitch(isOn: true)
        .addAction(for: .valueChanged, keyPath: \.isOn, on: self, to: \.switcherValue)

    // Alternative 2
    private lazy var switcher = UISwitch(isOn: true)
        .addAction(for: .valueChanged, with: self) {
            $0.switcherValue.toggle()
        }
```

#### 1.7.2 Convenience initializers
```swift
    convenience init(isOn: Bool = false)
```

#### 1.7.3 Chainable methods
```swift
    func onTintColor(_ color: UIColor?) -> Self
    func thumbTintColor(_ color: UIColor?) -> Self
    func onImage(_ image: UIImage?) -> Self
    func offImage(_ image: UIImage?) -> Self
    func title(_ value: String?) -> Self
    func preferredStyle(_ style: UISwitch.Style) -> Self
    func isOn(_ value: Bool) -> Self
```

### 1.8 UISlider

#### 1.8.1 Instantiation
##### Pure UIKit:
```swift
    private lazy var slider: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.minimumValue = 0
        slider.maximumValue = 10
        slider.value = 5
        slider.addTarget(self, action: #selector(onSliderValueChanged), for: .valueChanged)
        return slider
    }()
```

##### FlowUI:
```swift
    private lazy var slider = UISlider(range: 0...10, value: 5)
        .addAction(for: .valueChanged, keyPath: \.value, on: self, do: VC.onSliderValueChanged)

    // Alternative 1
    private lazy var slider = UISlider(range: 0...10, value: 5)
        .addAction(for: .valueChanged, keyPath: \.value, on: self, to: \.sliderValue)

    // Alternative 2
    private lazy var slider = UISlider(range: 0...10, value: 5)
        .addAction(for: .valueChanged, with: self) {
            $0.updateUI()
        }
```

#### 1.8.2 Convenience initializers
```swift
    convenience init(range: ClosedRange<Float>, value: Float = 0.0)
```

#### 1.8.3 Chainable methods
```swift
    func value(_ value: Float) -> Self
    func minimumValue(_ value: Float = 0.0) -> Self
    func maximumValue(_ value: Float = 1.0) -> Self
    func minimumValueImage(_ image: UIImage?) -> Self
    func maximumValueImage(_ image: UIImage?) -> Self
    func isContinuous( value: Bool = true) -> Self
    func minimumTrackTintColor(_ color: UIColor?) -> Self
    func maximumTrackTintColor(_ color: UIColor?) -> Self
    func thumbTintColor(_ color: UIColor?) -> Self
    func thumbImage(_ image: UIImage?, for state: UIControl.State) -> Self
    func minimumTrackImage(_ image: UIImage?, for state: UIControl.State) -> Self
    func maximumTrackImage(_ image: UIImage?, for state: UIControl.State) -> Self
```

### 1.9 UIStepper

#### 1.9.1 Instantiation
##### Pure UIKit:
```swift
    private lazy var stepper: UIStepper = {
        let stepper = UIStepper()
        stepper.translatesAutoresizingMaskIntoConstraints = false
        stepper.minimumValue = 0
        stepper.maximumValue = 15
        stepper.stepValue = 1.5
        stepper.value = 0
        stepper.addTarget(self, action: #selector(onStepperValueChanged), for: .valueChanged)
        return stepper
    }()
```

##### FlowUI:
```swift
    private lazy var stepper = UIStepper(range: 0...15)
        .addAction(for: .valueChanged, keyPath: \.value, on: self, do: VC.onStepperValueChanged)

    // Alternative 1
    private lazy var stepper = UIStepper(range: 0...15, step: 1.5)
        .addAction(for: .valueChanged, keyPath: \.value, on: self, to: \.stepperValue)

    // Alternative 2
    private lazy var stepper = UIStepper(range: 0...15, step: 1.5, value: 4.5)
        .addAction(for: .valueChanged, with: self) {
            $0.updateUI()
        }
```

#### 1.9.2 Convenience initializers
```swift
    convenience init(range: ClosedRange<Double>, step: Double = 1.0, value: Double = 0.0)
```

#### 1.9.3 Chainable methods
```swift
    func isContinuous(_ value: Bool) -> Self
    func autorepeat(_ value: Bool) -> Self
    func wraps(_ value: Bool) -> Self
    func value(_ value: Double) -> Self
    func minimumValue(_ value: Double) -> Self
    func maximumValue(_ value: Double) -> Self
    func stepValue(_ value: Double) -> Self
    func backgroundImage(_ image: UIImage?, for state: UIControl.State) -> Self
    func dividerImage(_ image: UIImage?,
                      forLeftSegmentState leftState: UIControl.State,
                      rightSegmentState rightState: UIControl.State)  -> Self
    func incrementImage(_ image: UIImage?, for state: UIControl.State) -> Self
    func decrementImage(_ image: UIImage?, for state: UIControl.State) -> Self
```

### 1.10 UIPageControl

#### 1.10.1 Instantiation
##### Pure UIKit:
```swift
    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.numberOfPages = numberOfPages
        pageControl.currentPage = currentPage
        pageControl.backgroundStyle = .prominent
        pageControl.addTarget(self, action: #selector(onCurrentPageChanged), for: .valueChanged)
        return pageControl
    }()
```

##### FlowUI:
```swift
    private lazy var pageControl = UIPageControl(numberOfPages: 10, currentPage: 0)
        .backgroundStyle(.prominent)
        .addAction(for: .valueChanged, keyPath: \.currentPage, on: self, do: VC.onCurrentPageChanged)

    // Alternative 1
    private lazy var pageControl = UIPageControl(numberOfPages: 10, currentPage: 0)
        .addAction(for: .valueChanged, keyPath: \.currentPage, on: self, to: \.currentPageValue)

    // Alternative 2
    private lazy var pageControl = UIPageControl(numberOfPages: 10, currentPage: 0)
        .addAction(for: .valueChanged, with: self) {
            $0.updateUI()
        }
```

#### 1.10.2 Convenience initializers
```swift
    convenience init(numberOfPages: Int, currentPage: Int)
```

#### 1.10.3 Chainable methods
```swift
    func numberOfPages(_ value: Int) -> Self
    func currentPage(_ value: Int) -> Self
    func hidesForSinglePage(_ value: Bool) -> Self
    func pageIndicatorTintColor(_ color: UIColor?) -> Self
    func currentPageIndicatorTintColor(_ color: UIColor?) -> Self
    func backgroundStyle(_ style: UIPageControl.BackgroundStyle) -> Self
    func direction(_ direction: UIPageControl.Direction) -> Self
    func allowsContinuousInteraction(_ value: Bool) -> Self
    func preferredIndicatorImage(_ image: UIImage?) -> Self
    func indicatorImage(_ image: UIImage?, forPage page: Int) -> Self
    func preferredCurrentPageIndicatorImage(_ image: UIImage?) -> Self
    func currentPageIndicatorImage(_ image: UIImage?, forPage page: Int) -> Self
    func defersCurrentPageDisplay(_ value: Bool) -> Self
```

### 1.11 UITextField

#### 1.11.1 Instantiation
##### Pure UIKit:
```swift
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.text = "John"
        textField.placeholder = "Name"
        textField.addTarget(self, action: #selector(.onTextFieldTextChanged), for: .editingChanged)
        return textField
    }()

    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        self.attributedText = "John".medium18
        self.defaultTextAttributes = .medium18
        self.attributedPlaceholder = "Name".regular18
        self.typingAttributes = .medium18
        textField.addTarget(self, action: #selector(.onTextFieldTextChanged), for: .editingChanged)
        return textField
    }()
```

##### FlowUI:
```swift
    private lazy var textField = UITextField(text: "John", placeholder: "Name")
        .addAction(for: .editingChanged, keyPath: \.text, on: self, do: VC.onTextFieldEditing)

    private lazy var textField = UITextField(
            "John".medium18,
            defaultTextAttributes: .medium18,
            attributedPlaceholder: "Name".regular18,
            typingAttributes: .medium18
        )
        .addAction(for: .editingChanged, keyPath: \.text, on: self, do: VC.onTextFieldTextChanged)

    // Alternative 1
    private lazy var textField = UITextField(text: "John", placeholder: "Name")
        .addAction(for: .editingDidBegin, on: self, do: VC.onTextFieldEditingBegin)
        .addAction(for: .editingDidEnd, on: self, do: VC.onTextFieldEditingEnd)
        .addAction(for: .editingChanged, keyPath: \.text, on: self, to: \.name)

    // Alternative 2
    private lazy var textField = UITextField(numberOfPages: 10, currentPage: 0)
        .addAction(for: .editingChanged, keyPath: \.text, with: viewModel) {
            viewModel.search(text)
        }
```

#### 1.11.2 Convenience initializers
```swift
    convenience init(_ text: String?, placeholder: String? = nil)

    convenience init(_ string: NSAttributedString?,
                     defaultTextAttributes: [NSAttributedString.Key : Any] = [:],
                     attributedPlaceholder: NSAttributedString?,
                     typingAttributes: [NSAttributedString.Key : Any]? = nil)
```

#### 1.11.3 Chainable methods
```swift
    // UITextField
    func text(_ text: String?) -> Self
    func attributedText(_ string: NSAttributedString?) -> Self
    func textColor(_ color: UIColor?) -> Self
    func font(_ font: UIFont?) -> Self
    func textAlignment(_ alignment: NSTextAlignment) -> Self
    func borderStyle(_ style: UITextField.BorderStyle) -> Self
    func defaultTextAttributes(_ attributes: [NSAttributedString.Key : Any]) -> Self
    func placeholder(_ text: String?) -> Self
    func attributedPlaceholder(_ string: NSAttributedString?) -> Self
    func clearsOnBeginEditing(_ value: Bool) -> Self
    func adjustsFontSizeToFitWidth(_ value: Bool) -> Self
    func minimumFontSize(_ value: CGFloat) -> Self
    func delegate(_ delegate: UITextFieldDelegate?) -> Self
    func background(_ image: UIImage?) -> Self
    func disabledBackground(_ image: UIImage?) -> Self
    func allowsEditingTextAttributes(_ value: Bool) -> Self
    func typingAttributes(_ attributes: [NSAttributedString.Key : Any]?) -> Self
    func clearButtonMode(_ mode: UITextField.ViewMode) -> Self
    func leftView(_ view: UIView?) -> Self
    func leftViewMode(_ mode: UITextField.ViewMode) -> Self
    func rightView(_ view: UIView?) -> Self
    func rightViewMode(_ mode: UITextField.ViewMode) -> Self
    func inputView(_ view: UIView?) -> Self
    func inputAccessoryView(_ view: UIView?) -> Self
    func clearsOnInsertion(_ value: Bool) -> Self

    // MARK: UITextField + UITextInputTraits
    func autocapitalizationType(_ type: UITextAutocapitalizationType) -> Self
    func autocorrectionType(_ type: UITextAutocorrectionType) -> Self
    func spellCheckingType(_ type: UITextSpellCheckingType) -> Self
    func smartQuotesType(_ type: UITextSmartQuotesType) -> Self
    func smartDashesType(_ type: UITextSmartDashesType) -> Self
    func smartInsertDeleteType(_ type: UITextSmartInsertDeleteType) -> Self
    func keyboardType(_ type: UIKeyboardType) -> Self
    func keyboardAppearance(_ appearance: UIKeyboardAppearance) -> Self
    func returnKeyType(_ type: UIReturnKeyType) -> Self
    func enablesReturnKeyAutomatically( value: Bool) -> Self
    func isSecureTextEntry( value: Bool) -> Self
    func textContentType(_ type: UITextContentType) -> Self
    func passwordRules(_ rules: UITextInputPasswordRules?) -> Self
```

### 1.12 UIDatePicker

#### 1.12.1 Instantiation
##### Pure UIKit:
```swift
    private lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .dateAndTme
        datePicker.date = Date.someDate
        datePicker.minimumDate = nil
        datePicker.maximumDate = Date.now
        datePicker.addTarget(self, action: #selector(onDateChanged), for: .valueChanged)
        return datePicker
    }()
```

##### FlowUI:
```swift
    private lazy var datePicker = UIDatePicker(mode: .dateAndTime, date: Date.someDate, in: ...Date.now)
        .addAction(for: .valueChanged, keyPath: \.date, on: self, do: VC.onDateChanged)

    // Alternative 1
    private lazy var datePicker = UIDatePicker(in: Date.now...)
        .addAction(for: .valueChanged, keyPath: \.date, on: self, to: \.dateValue)

    // Alternative 2
    private lazy var datePicker = UIDatePicker(in: Date.someMinimumDate...Date.now)
        .addAction(for: .valueChanged, with: self) {
            $0.updateUI()
        }
```

#### 1.12.2 Convenience initializers
```swift
    convenience init(mode: UIDatePicker.Mode = .dateAndTime,
                     date: Date = Date(),
                     in range: ClosedRange<Date>? = nil)

    convenience init(mode: UIDatePicker.Mode = .dateAndTime,
                     date: Date = Date(),
                     in range: PartialRangeFrom<Date>? = nil)

    convenience init(mode: UIDatePicker.Mode = .dateAndTime,
                     date: Date = Date(),
                     in range: PartialRangeThrough<Date>? = nil)
```

#### 1.12.3 Chainable methods
```swift
    func datePickerMode(_ mode: UIDatePicker.Mode) -> Self
    func locale(_ locale: Locale?) -> Self
    func calendar(_ calender: Calendar) -> Self
    func timeZone(_ zone: TimeZone?) -> Self
    func date(_ date: Date) -> Self
    func minimumDate(_ date: Date) -> Self
    func maximumDate(_ date: Date) -> Self
    func countDownDuration(_ duration: TimeInterval) -> Self
    func minuteInterval(_ interval: Int) -> Self
    func preferredDatePickerStyle(_ style: UIDatePickerStyle) -> Self
    func roundsToMinuteInterval(_ value: Bool) -> Self
```

### 1.30 UIControl

#### 1.30.1 Instantiation
##### Pure UIKit:
```swift
    private lazy var button: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        button.addTarget(self, action: #selector(buttonTouchUpInside), for: .touchUpInside)
        return button
    }()

    private lazy var uiSwitch: UISwitch = {
        let uiSwitch = UISwitch()
        uiSwitch.translatesAutoresizingMaskIntoConstraints = false
        uiSwitch.addTarget(self, action: #selector(onSwitchValueChanged), for: .valueChanged)
        return uiSwitch
    }()
```

##### FlowUI:
```swift
    private lazy var button = UIButton("Login")
        .addAction { [weak self] in
            self?.buttonTouchUpInside()
        }

    private lazy var uiSwitch = UISwitch(isOn: false)
        .addAction(for: .valueChanged, on: viewModel, do: ViewModel.onSwitchValueChanged)
    
    // Alternative 1
    private lazy var button = UIButton("Login".bold18, type: .system)
        .addAction(for: .touchUpInside) { [weak self] in
            self?.buttonTouchUpInside()
        }

    // Alternative 2
    private lazy var button = UIButton("Login".bold18, type: .system)
        .addAction(with: self) { // unretained self, can be viewModel for example
            $0.buttonTouchUpInside()
        }
    
    // Alternative 3
    private lazy var button = UIButton(.moreIcon)
        .addAction(on: viewModel, do: ViewModel.onMoreButton)

    // Alternative 4
    private lazy var slider = UISlider(range: 0...10)
        .addAction(for: .valueChanged, keyPath: \.value, on: viewModel, do: ViewModel.onSwitchValueChanged)

    // Alternative 5
    private lazy var slider = UISlider(range: 0...10)
        .addAction(for: .valueChanged, keyPath: \.value, on: viewModel, to: \.sliderValue)
```

#### 1.30.2 Chainable methods
```swift
    /// Adding simple action
    func addAction(for event: UIControl.Event = .touchUpInside, action: @escaping () -> Void) -> Self

    /// Binding action for event to object method (reference type object)
    func addAction<T: AnyObject>(for event: UIControl.Event = .touchUpInside,
                                 on object: T?,
                                 do method: @escaping (T) -> () -> Void) -> Self

    /// Binding action for event to object method (value type object)
    func addAction<T>(for event: UIControl.Event = .touchUpInside,
                      on object: T?,
                      do method: @escaping (T) -> () -> Void) -> Self

    /// Binding action for event to reference type object method with control's value by keyPath
    func addAction<T: AnyObject, V>(for event: UIControl.Event = .touchUpInside,
                                    keyPath: KeyPath<Self, V>,
                                    on object: T?,
                                    do method: @escaping (T) -> (V) -> Void) -> Self

    /// Binding action for event to value type object method with control's value by keyPath
    func addAction<T, V>(for event: UIControl.Event = .touchUpInside,
                         keyPath: KeyPath<Self, V>,
                         on object: T?,
                         do method: @escaping (T) -> (V) -> Void) -> Self

    /// Binding action for event to reference type object method with sender
    func addActionWithSender<T: AnyObject>(for event: UIControl.Event = .touchUpInside,
                                           on object: T?,
                                           do method: @escaping (T) -> (Self) -> Void) -> Self

    /// Binding action for event to value type object method with sender
    func addActionWithSender<T>(for event: UIControl.Event = .touchUpInside,
                                on object: T?,
                                do method: @escaping (T) -> (Self) -> Void) -> Self

    /// Binding of control value by keyPath to object's keyPath
    func addAction<T: AnyObject, V>(for event: UIControl.Event = .touchUpInside,
                                    keyPath: KeyPath<Self, V>,
                                    on object: T?,
                                    to objectKeyPath: WritableKeyPath<T, V>) -> Self

    /// Adding action for event with reference type unretained object
    func addAction<T: AnyObject>(for event: UIControl.Event = .touchUpInside,
                                 with object: T?,
                                 action: @escaping (T) -> Void) -> Self

    /// Adding action for event with value type object (for methods consistency)
    func addAction<T>(for event: UIControl.Event = .touchUpInside,
                      with object: T?,
                      action: @escaping (T) -> Void) -> Self

    /// Adding action for event with reference type unretained object and control's value by keyPath
    func addAction<T: AnyObject, V>(for event: UIControl.Event = .touchUpInside,
                                    keyPath: KeyPath<Self, V>,
                                    with object: T?,
                                    action: @escaping (T, V) -> Void) -> Self

    /// Adding action for event with value type object and control's value by keyPath (for methods consistency)
    func addAction<T, V>(for event: UIControl.Event = .touchUpInside,
                         keyPath: KeyPath<Self, V>,
                         with object: T?,
                         action: @escaping (T, V) -> Void) -> Self

    /// Adding action for event with reference type unretained object and sender
    func addActionWithSender<T: AnyObject>(for event: UIControl.Event = .touchUpInside,
                                           with object: T?,
                                           action: @escaping (T, Self) -> Void) -> Self

    /// Adding action for event with value type object and sender (for methods consistency)
    func addActionWithSender<T>(for event: UIControl.Event = .touchUpInside,
                                with object: T?,
                                action: @escaping (T, Self) -> Void) -> Self

    /// Adding action for event with control's value by keyPath
    func addAction<V>(for event: UIControl.Event = .touchUpInside,
                      keyPath: KeyPath<Self, V>,
                      action: @escaping (V) -> Void) -> Self

    /// Adding action for event with sender
    func addActionWithSender(for event: UIControl.Event = .touchUpInside,
                             action: @escaping (Self) -> Void) -> Self
```

# 2 UIComponents protocol

Also you can adopt yours UIView's and UIViewController's to UIComponents protocol and instantiate views in more comfortable manner with some extra components (imageView, space, flexibleSpace and container):
```swift
extension UIView: UIComponents {}

extension UIViewController: UIComponents {}
```

#### 2.1 scrollView

```swift
    // Constructor
    func scrollView(contentInsets: UIEdgeInsets = .zero,
                    contentInsetAdjustmentBehavior: UIScrollView.ContentInsetAdjustmentBehavior = .automatic) -> UIScrollView
    
    // Instantiation
    private lazy var scrollView = scrollView()
```

#### 2.2 stack

```swift
    // Constructor
    func stack(_ axis: NSLayoutConstraint.Axis,
               spacing: CGFloat = 0,
               distribution: UIStackView.Distribution = .fill,
               alignment: UIStackView.Alignment = .fill,
               @UIViewBuilder viewsBuilder: () -> [UIView]) -> UIStackView
    
    // Instantiation
    private lazy var stackView = stack(.vertical) {
        // Views to arrange
    }
```

#### 2.3 label

#### 2.3.1 label (String)

```swift
    // Constructor
    func label(_ text: String? = "",
               font: UIFont? = nil,
               textColor: UIColor? = nil,
               textAlignment: NSTextAlignment = .left,
               numberOfLines: Int = 0) -> UILabel
    
    // Instantiation
    private lazy var label = label("Title")
```

#### 2.3.2 label (Attributed string)

```swift
    // Constructor
    func label(_ attributedText: NSAttributedString? = nil,
               textAlignment: NSTextAlignment = .left,
               numberOfLines: Int = 0) -> UILabel
    
    // Instantiation
    private lazy var label = label("Title".titleH3) // Attributed string
```

#### 2.4 button

#### 2.4.1 button (String)

```swift
    // Constructor
    func button(_ title: String? = nil,
                size: CGSize? = nil,
                type: UIButton.ButtonType = .custom) -> UIButton
    
    // Instantiation variants
    private lazy var button = button("Login")

    private lazy var button = button(size: .square(40))
```

#### 2.4.2 button (Attributed string)

```swift
    // Constructor
    func button(_ attributedTitle: NSAttributedString?,
                size: CGSize? = nil,
                type: UIButton.ButtonType = .custom) -> UIButton
    
    // Instantiation
    private lazy var button = button("Login".titleH3)
```

#### 2.4.3 button (Image)

```swift
    // Constructor
    func button(_ image: UIImage?, size: CGSize? = nil, type: UIButton.ButtonType = .custom) -> UIButton
    
    // Instantiation
    private lazy var button = button(.searchIcon)
```

#### 2.5 imageView

```swift
    // Constructors
    func imageView(_ image: UIImage? = nil,
                   size: CGSize) -> UIImageView

    func imageView(_ image: UIImage? = nil,
                   size: UIImageView.SizeType = .byImage) -> UIImageView
    
    // Instantiation variants
    private lazy var imageView = imageView(.welcomeLogo)

    private lazy var imageView = imageView(.welcomeLogo, size: .byImage(scale: 0.5))

    private lazy var imageView = imageView(.welcomeLogo, size: .height(170))
        .aspectRatio(5/4)

    private lazy var imageView = imageView(.welcomeLogo, size: .width(300))
        .aspectRatio(5/2)

    private lazy var imageView = imageView(.welcomeLogo, size: CGSize(width: 100, height: 100))

    private lazy var imageView = imageView(.welcomeLogo, size: .square(200))
```

#### 2.6 space

```swift
    // Constructor
    func space(width: CGFloat? = nil, height: CGFloat? = nil) -> UIView
    
    // Instantiation
    private lazy var space = space(width: 80)
    
    private lazy var space = space(height: 20)
    
    private lazy var space = space(width: 80, height: 20)
```

#### 2.7 flexibleSpace

```swift
    // Constructor
    func flexibleSpace() -> UIView
    
    // Instantiation
    private lazy var flexibleSpace = flexibleSpace()
```

#### 2.8 container

```swift
    // Constructor 1
    func container(color: UIColor = .clear,
                   width: CGFloat? = nil,
                   height: CGFloat? = nil,
                   configure: ((UIView) -> Void)? = nil) -> UIView
                   
    // Constructor 2
    func container(color: UIColor = .clear,
                   size: CGSize,
                   configure: ((UIView) -> Void)? = nil) -> UIView
    
    // Instantiation
    private lazy var container = container(size: .square(48))
```

#### 2.9 activityIndicator

```swift
    // Constructor 1
    func activityIndicator(_ style: UIActivityIndicatorView.Style,
                           color: UIColor = .gray,
                           hidesWhenStopped: Bool = true) -> UIActivityIndicatorView
    
    // Instantiation variants
    private lazy var activityIndicator = activityIndicator(.large)
    
    private lazy var activityIndicator = activityIndicator(.medium)
        .animated(true)
    
    private lazy var activityIndicator = activityIndicator(.large, color: .white, hidesWhenStopped = false)
```

#### 2.10 switcher

```swift
    // Constructor 1
    func switcher(isOn: Bool = false) -> UISwitch
    
    // Instantiation variants
    private lazy var switcher = switcher()
    
    private lazy var switcher = switcher(isOn: true)
```

#### 2.11 slider

```swift
    // Constructor 1
    func slider(range: ClosedRange<Float>, value: Float = 0.0) -> UISlider
    
    // Instantiation variants
    private lazy var slider = slider(range: 0...10)
    
    private lazy var slider = slider(range: 0...10, value: 5)
```

#### 2.12 stepper

```swift
    // Constructor 1
    func stepper(range: ClosedRange<Double>, step: Double = 1.0, value: Double = 0.0) -> UIStepper
    
    // Instantiation variants
    private lazy var stepper = stepper(range: 0...15)
    
    private lazy var stepper = stepper(range: 0...15, step: 1.5)

    private lazy var stepper = stepper(range: 0...15, step: 1.5, value: 4.5)
```

#### 2.13 pageControl

```swift
    // Constructor 1
    func pageControl(numberOfPages: Int, currentPage: Int = 0) -> UIPageControl
    
    // Instantiation variants
    private lazy var pageControl = pageControl(numberOfPages: 10)
    
    private lazy var pageControl = pageControl(numberOfPages: 10, currentPage: 5)
```

#### 2.14 textField

```swift
    // Constructor 1
    func textField(_ text: String? = nil, placeholder: String? = nil) -> UITextField

    // Constructor 2
    func textField(_ string: NSAttributedString? = nil,
                   defaultTextAttributes: [NSAttributedString.Key : Any] = [:],
                   attributedPlaceholder: NSAttributedString? = nil,
                   typingAttributes: [NSAttributedString.Key : Any]? = nil) -> UITextField
    
    // Instantiation variants
    private lazy var textField = textField()
    
    private lazy var textField = textField("Some text")

    private lazy var textField = textField("Some text", placeholder: "Enter text")

    private lazy var textField = textField("Some text".semibold18)

    private lazy var textField = textField(defaultTextAttributes: .semibold18)

    private lazy var textField = textField("Some text".semibold18, defaultTextAttributes: .semibold18)

    private lazy var textField = textField(
        "Some text".semibold18,
        defaultTextAttributes: .semibold18,
        attributedPlaceholder: "Enter text".regular18,
        typingAttributes: .semibold18
    )
```

#### 2.15 datePicker

```swift
    // Constructor 1
    func datePicker(mode: UIDatePicker.Mode = .dateAndTime,
                    date: Date = Date(),
                    in range: ClosedRange<Date>? = nil) -> UIDatePicker

    // Constructor 2
    func datePicker(mode: UIDatePicker.Mode = .dateAndTime,
                    date: Date = Date(),
                    in range: PartialRangeFrom<Date>? = nil) -> UIDatePicker

    // Constructor 3
    func datePicker(mode: UIDatePicker.Mode = .dateAndTime,
                    date: Date = Date(),
                    in range: PartialRangeThrough<Date>? = nil) -> UIDatePicker
    
    // Instantiation variants
    private lazy var datePicker = datePicker()

    private lazy var pageControl = datePicker(in: Date.minimumDate...Date.maximumDate)
    
    private lazy var datePicker = datePicker(mode: .date, in: Date.now...)

    private lazy var datePicker = datePicker(mode: .time, in: ...Date.now)
```



# 3 UIViewBuilder

With stack view initializer you can use a UIViewBuilder which can help you write constructions like with SwiftUI's view builder.
UIViewBuilder allows you to use:
 - If..else...
 - switch
 - arrays
 - optional views

UIComponents are fully compatible with UIViewBuilder, like any others views.

But UIKit is not SwiftUI, so you need to replace arranged views in the stack when it necessarily or control the visibility of a part of content. All conditions, switches and other works only once time on each stack construction and do not observes any changes in runtime.

### Example:
```swift
    private lazy var stack = stack(.vertical) {
        isAuthorized ? authorizedHeader : unauthorizedHeader
        
        space(height: 16)
        
        rowsData.map { RowView(model: $0) }
        
        space(height: 12)
        
        if isLocationAvailable {
            mapView
            space(height: 12)
        }
        
        switch serviceStatus {
        case .opened:
            return serviceOpenedView
        case .closed:
            return serviceClosedView
        case .maintenance
            return serviceMaintenanceView
        }
        
        space(height: 12)
        
        stack(.horizontal, distribution: .equalSpacing) {
            label("Service contact".titleH3)
            label(phoneNumber)
        }
        .addTapGestureRecognizer { [weak self] in
            self?.callToService()
        }
        
        space(height: 8)
        
        footerView
        
        space(height: 32)
    }
```
