//
//  TextField.swift
//  Speller
//
//  Created by Julia Nikitina on 08.05.2018.
//  Copyright © 2018 Julia Nikitina. All rights reserved.
//

import UIKit

//creates left inset (padding) in the text field

class TextField: UITextField {
    let inset: CGFloat = 20
    
    // placeholder position
    override func textRect(
        forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: inset, dy: 0)
    }
    
    // text position
    override func editingRect(
        forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: inset, dy:0)
    }
    
    override func placeholderRect(
        forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: inset, dy:0)
    }
}
