//
//  MatetialTextField.swift
//  Lets-chat
//
//  Created by Zack on 2016/9/9.
//  Copyright © 2016年 DaGin. All rights reserved.
//

import UIKit

class MatetialTextField: UITextField {

    
    override func awakeFromNib() {
        layer.cornerRadius = 2.0
        layer.borderColor = UIColor(red: SHADOW_COLOR, green: SHADOW_COLOR, blue: SHADOW_COLOR, alpha: 0.1).cgColor
        layer.borderWidth = 1.0
    }
    
    //for placeholder
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10 , dy: 0)
    }
    //for editable text
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10 , dy: 0)
    }
    
    
}
