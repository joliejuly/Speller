//
//  ExtensionString.swift
//  Speller
//
//  Created by Julia Nikitina on 08.05.2018.
//  Copyright © 2018 Julia Nikitina. All rights reserved.
//

import Foundation

extension String {
    var latinCharactersOnly: Bool {
        return self.range(of: "\\p{Latin}",
                          options: .regularExpression) == nil
    }
}
