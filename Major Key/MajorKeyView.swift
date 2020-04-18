//
//  MajorKeyView.swift
//  Major Key
//
//  Created by Patrick Steiner on 29.11.17.
//  Copyright © 2017 Felix Krause. All rights reserved.
//

import UIKit

extension UIColor {
    static func createDynamicColor(light: UIColor, dark: UIColor) -> UIColor {
        if #available(iOS 13.0, *) {
            return UIColor.init {
                switch ($0.userInterfaceStyle) {
                case .unspecified, .light:
                    return light
                case .dark:
                    return dark
                }
            }
        } else {
            return light
        }
    }

    static let backgroundColor = UIColor.createDynamicColor(light: .white, dark: .black)
    static let textColor = UIColor.createDynamicColor(light: .black, dark: .white)
}

protocol MajorKeyViewDelegate: class {
    func didPressKeyButton(button: UIButton)
    func didPressPackageButton(button: UIButton)
    func didPressSettingsButton(button: UIButton?)
}

class MajorKeyView: UIView {

    weak var delegate: MajorKeyViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        setupView()
    }

    private func viewFromNibForClass() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView

        return view
    }

    private func setupView() {
        let view = viewFromNibForClass()
        view.frame = bounds

        // autolayout
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.backgroundColor = .backgroundColor

        addSubview(view)
    }

    @IBAction func didPressKeyButton(_ sender: UIButton) {
        delegate?.didPressKeyButton(button: sender)
    }

    @IBAction func didPressPackageButton(_ sender: UIButton) {
        delegate?.didPressPackageButton(button: sender)
    }
    @IBAction func didPressSettingsButton(_ sender: UIButton) {
        delegate?.didPressSettingsButton(button: sender);
    }
}
