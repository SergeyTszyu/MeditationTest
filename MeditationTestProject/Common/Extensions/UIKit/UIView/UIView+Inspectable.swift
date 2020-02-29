//
//  UIView+Inspectable.swift
//  MeditationTestProject
//
//  Created by Sergey Tszyu on 23.02.2020.
//  Copyright © 2020 Sergey Tszyu. All rights reserved.
//

import Foundation
import UIKit

extension UIView {

    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set(cornerRadius) {
            layer.cornerRadius = cornerRadius
        }
    }

    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set(borderWidth) {
            layer.borderWidth = borderWidth
        }
    }

    @IBInspectable var borderColor: UIColor? {
        get {
            if let borderColor = layer.borderColor {
                return UIColor(cgColor: borderColor)
            }
            return nil
        }
        set(borderColor) {
            layer.borderColor = borderColor?.cgColor
        }
    }

    @IBInspectable var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set(shadowOffset) {
            layer.shadowOffset = shadowOffset
        }
    }

    @IBInspectable var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set(shadowOpacity) {
            layer.shadowOpacity = shadowOpacity
        }
    }

    @IBInspectable var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set(shadowRadius) {
            layer.shadowRadius = shadowRadius
        }
    }

    @IBInspectable var shadowColor: UIColor? {
        get {
            if let shadowColor = layer.shadowColor {
                return UIColor(cgColor: shadowColor)
            }
            return nil
        }
        set(shadowColor) {
            layer.shadowColor = shadowColor?.cgColor
        }
    }

}

