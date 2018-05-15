//
//  Theme.swift
//  Leash
//
//  Created by Nick Reichard on 5/14/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import UIKit
@IBDesignable

extension UIColor {
    
    /// Only available on the class UIColor. Main purple theme through out
    static let leashPurple = UIColor(red: 117.0/255.0, green: 91.0/255.0, blue: 208.0/255.0, alpha: 1.0)
    static let purplePlaceHolder = UIColor(red: 117.0/255.0, green: 91.0/255.0, blue: 208.0/255.0, alpha: 0.4)
    
}

enum CustomFonts: String {
    case zapfino = "Zapfino"
    
    func of(size: CGFloat) -> UIFont {
        return  UIFont(name: self.rawValue, size: size) ?? UIFont()
    }
}


class LeashTextField: UITextField {
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var boarderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = boarderWidth
        }
    }
    
    @IBInspectable var boarderColor: UIColor? {
        didSet {
            layer.borderColor = boarderColor?.cgColor
        }
    }
    
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedStringKey.foregroundColor: newValue!])
        }
    }
    
    func updateTextField() {
        
        if borderStyle == UITextBorderStyle.none || borderStyle == UITextBorderStyle.line {
            self.layer.borderColor = UIColor.leashPurple.cgColor
        }
    }
}


extension String {
    func attributedString(aligment: NSTextAlignment) -> NSAttributedString {
        return NSAttributedString(text: self, aligment: aligment)
    }
}

extension NSAttributedString {
    convenience init(text: String, aligment: NSTextAlignment) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = aligment
        self.init(string: text, attributes: [NSAttributedStringKey.paragraphStyle: paragraphStyle])
    }
}


