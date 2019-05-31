//
//  ChecklistItem.swift
//  Checklist
//
//  Created by Erich Kerekes on 5/8/19.
//  Copyright © 2019 Hallow. All rights reserved.
//

import Foundation

class ChecklistItem: NSObject, Codable {
    @objc var text: String
    var checked: Bool
    
    init(_ text: String = "", _ checked: Bool = false) {
        self.text = text
        self.checked = checked
    }
    
    func toggleChecked(){
        self.checked = !self.checked
    }
}
