//
//  StackViewController.swift
//  SRConstraintsHelper
//
//  Created by Ehsan Zeinalinia on 1/7/24.
//

import UIKit
import SREasyConstraint

class StackViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        layoutView()
    }
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .label
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.text = "London"
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = .london
        return imageView
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.text = "London, the capital of England and the United Kingdom, is a 21st-century city with history stretching back to Roman times. At its centre stand the imposing Houses of Parliament, the iconic ‘Big Ben’ clock tower and Westminster Abbey, site of British monarch coronations. Across the Thames River, the London Eye observation wheel provides panoramic views of the South Bank cultural complex, and the entire city."
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 16
        return stackView
    }()
}

extension StackViewController {
    private func layoutView() {
        [titleLabel, imageView, descriptionLabel].addAsArrangedSubviewTo(stackView)
        stackView.addAsSubviewTo(view)
        
        stackView.applyConstraint(withConstraintType: .top, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, withAttribute: .top, multiplier: 1, constant: 16)
        stackView.applyConstraint(withConstraintType: .leading, relatedBy: .equal, toItem: view, withAttribute: .leading, multiplier: 1, constant: 10)
        stackView.applyConstraint(withConstraintType: .trailing, relatedBy: .equal, toItem: view, withAttribute: .trailing, multiplier: 1, constant: -10)
        imageView.applyConstraint(withConstraintType: .width, relatedBy: .equal, toItem: view, withAttribute: .width, multiplier: 1, constant: 0)
        imageView.applyConstraint(withConstraintType: .height, relatedBy: .equal, toItem: imageView, withAttribute: .width, multiplier: 9 / 16, constant: 0)
    }
}
