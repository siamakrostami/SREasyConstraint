//
//  EasyConstraint.swift
//
//
//  Created by Siamak on 3/24/24.
//

import Foundation
import UIKit

// MARK: - UIView Extension

public extension UIView {
    // MARK: Internal Methods

    /// Add current view as subview to it's parent view
    /// - Parameter view: parent view
    /// - Returns: Self
    @discardableResult
    func addAsSubviewTo(_ view: UIView) -> Self {
        self.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(self)
        return self
    }

    /// Add current views as arranged subview to their parent view
    /// - Parameter stackView: parent view
    /// - Returns: Self
    @discardableResult
    func addAsArrangedSubviewTo(_ stackView: UIStackView) -> Self {
        self.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(self)
        return self
    }

    /// Applying constraint to a view
    /// - Parameters:
    ///   - withConstraintType: type of constraint (top, bottom or etc.)
    ///   - relatedBy: constraint relationship (equal)
    ///   - toItem: parent view
    ///   - withAttribute: parent view constraint attribute (height)
    ///   - multiplier: multiplier value
    ///   - constant: constant value
    /// - Returns: Self
    @discardableResult
    func applyConstraint(withConstraintType: ConstraintType, relatedBy: NSLayoutConstraint.Relation? = .equal, toItem: Any?, withAttribute: NSLayoutConstraint.Attribute, multiplier: CGFloat? = 1, constant: CGFloat? = 0) -> Self {
        var constraint: NSLayoutConstraint?
        switch withConstraintType {
            case .top:
                constraint = NSLayoutConstraint(item: self, attribute: .top, relatedBy: relatedBy ?? .equal, toItem: toItem, attribute: withAttribute, multiplier: multiplier ?? 1, constant: constant ?? 0)
            case .bottom:
                constraint = NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: relatedBy ?? .equal, toItem: toItem, attribute: withAttribute, multiplier: multiplier ?? 1, constant: constant ?? 0)
            case .leading:
                constraint = NSLayoutConstraint(item: self, attribute: .leading, relatedBy: relatedBy ?? .equal, toItem: toItem, attribute: withAttribute, multiplier: multiplier ?? 1, constant: constant ?? 0)
            case .trailing:
                constraint = NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: relatedBy ?? .equal, toItem: toItem, attribute: withAttribute, multiplier: multiplier ?? 1, constant: constant ?? 0)
            case .centerX:
                constraint = NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: relatedBy ?? .equal, toItem: toItem, attribute: withAttribute, multiplier: multiplier ?? 1, constant: constant ?? 0)
            case .centerY:
                constraint = NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: relatedBy ?? .equal, toItem: toItem, attribute: withAttribute, multiplier: multiplier ?? 1, constant: constant ?? 0)
            case .height:
                constraint = NSLayoutConstraint(item: self, attribute: .height, relatedBy: relatedBy ?? .equal, toItem: toItem, attribute: withAttribute, multiplier: multiplier ?? 1, constant: constant ?? 0)
            case .width:
                constraint = NSLayoutConstraint(item: self, attribute: .width, relatedBy: relatedBy ?? .equal, toItem: toItem, attribute: withAttribute, multiplier: multiplier ?? 1, constant: constant ?? 0)
            case .left:
                constraint = NSLayoutConstraint(item: self, attribute: .left, relatedBy: relatedBy ?? .equal, toItem: toItem, attribute: withAttribute, multiplier: multiplier ?? 1, constant: constant ?? 0)
            case .right:
                constraint = NSLayoutConstraint(item: self, attribute: .right, relatedBy: relatedBy ?? .equal, toItem: toItem, attribute: withAttribute, multiplier: multiplier ?? 1, constant: constant ?? 0)
        }

        if let constraint = constraint {
            constraint.identifier = withConstraintType.rawValue
            constraint.isActive = true
        }
        return self
    }

    /// Update an existing constraint
    /// - Parameters:
    ///   - withConstraintType: type of constraint (top, bottom or etc.)
    ///   - constant: constant value
    /// - Returns: Self
    @discardableResult
    func updateConstraint(withConstraintType: ConstraintType, constant: CGFloat) -> Self {
        guard let constraint = constraints.first(where: { $0.identifier == withConstraintType.rawValue }) else {
            return self
        }
        constraint.constant = constant
        return self
    }
}

public extension Array where Element: UIView {
    /// Add current views as subview to their parent view
    /// - Parameter view: parent view
    /// - Returns: Self
    @discardableResult
    func addAsSubviewTo(_ view: UIView) -> Self {
        for item in self {
            item.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(item)
        }
        return self
    }

    /// Add current views as arranged subview to their parent view
    /// - Parameter stackView: parent view
    /// - Returns: Self
    @discardableResult
    func addAsArrangedSubviewTo(_ stackView: UIStackView) -> Self {
        for item in self {
            item.translatesAutoresizingMaskIntoConstraints = false
            stackView.addArrangedSubview(item)
        }
        return self
    }
}
