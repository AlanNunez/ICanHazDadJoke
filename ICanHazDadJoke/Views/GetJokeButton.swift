//
//  GetJokeButton.swift
//  ICanHazDadJoke

import Foundation
import UIKit

@IBDesignable class GetJokeButton: UIButton {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > CGFloat.zero
        }
    }
}
