# SREasyConstraint

SREasyConstraint is a Swift Package that simplifies working with Auto Layout constraints in iOS development.

## Features

- `UIView` extension to streamline the process of adding subviews and applying constraints.
- Support for adding arranged subviews to `UIStackView` with ease.
- Flexible constraint creation and updating methods.
- Example project included to demonstrate usage.

## Installation

You can easily integrate SREasyConstraint into your project using Swift Package Manager:

1. Open your Xcode project.
2. Go to "File" -> "Swift Packages" -> "Add Package Dependency..."
3. Enter the repository URL: `https://github.com/siamakrostami/SREasyConstraint.git`
4. Follow the prompts to add the package to your project.

## Usage

```swift
import UIKit
import SREasyConstraint

// Example usage of adding a subview and applying constraints
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = .newyork
        return imageView
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.text = "New York City comprises 5 boroughs sitting where the Hudson River meets the Atlantic Ocean. At its core is Manhattan, a densely populated borough that’s among the world’s major commercial, financial and cultural centers. Its iconic sites include skyscrapers such as the Empire State Building and sprawling Central Park. Broadway theater is staged in neon-lit Times Square."
        label.numberOfLines = 0
        return label
    }()

    private lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.backgroundColor = .systemPink
        button.setTitle("Navigate", for: .normal)
        button.setTitleColor(.white, for: .normal)
        let action = UIAction { [weak self] _ in
            let stackVC = StackViewController()
            self?.present(stackVC, animated: true, completion: nil)
        }
        button.addAction(action, for: .touchUpInside)
        return button
    }()

        [imageView, descriptionLabel, button].addAsSubviewTo(view)

        imageView.applyConstraint(withConstraintType: .top, relatedBy: .equal, toItem: view, withAttribute: .top, multiplier: 1, constant: 0)
        .applyConstraint(withConstraintType: .centerX, relatedBy: .equal, toItem: view, withAttribute: .centerX, multiplier: 1, constant: 0)
        .applyConstraint(withConstraintType: .width, relatedBy: .equal, toItem: view, withAttribute: .width, multiplier: 1, constant: 0)
        .applyConstraint(withConstraintType: .height, relatedBy: .equal, toItem: imageView, withAttribute: .width, multiplier: 9 / 16, constant: 0)

        descriptionLabel.applyConstraint(withConstraintType: .top, relatedBy: .equal, toItem: imageView, withAttribute: .bottom, multiplier: 1, constant: 16)
        .applyConstraint(withConstraintType: .centerX, relatedBy: .equal, toItem: view, withAttribute: .centerX, multiplier: 1, constant: 0)
        .applyConstraint(withConstraintType: .width, relatedBy: .equal, toItem: view, withAttribute: .width, multiplier: 0.9, constant: 0)

        button.applyConstraint(withConstraintType: .centerX, relatedBy: .equal, toItem: view, withAttribute: .centerX, multiplier: 1, constant: 0)
        .applyConstraint(withConstraintType: .width, relatedBy: .equal, toItem: view, withAttribute: .width, multiplier: 0.9, constant: 0)
        .applyConstraint(withConstraintType: .bottom, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, withAttribute: .bottom, multiplier: 1, constant: -16)
        .applyConstraint(withConstraintType: .height, relatedBy: .equal, toItem: nil, withAttribute: .notAnAttribute, multiplier: 1, constant: 48)
```

## Example

This repository includes an example project located in the Example directory. The example project demonstrates how to use SREasyConstraint to create and manage Auto Layout constraints in an iOS app.

To run the example project:

Open SREasyConstraint.xcodeproj in Xcode.
Select the "Example" target.
Build and run the project.
The example project showcases various ways to utilize SREasyConstraint to simplify Auto Layout constraint management in your iOS app development.
