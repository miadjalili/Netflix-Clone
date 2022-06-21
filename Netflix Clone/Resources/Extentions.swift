//
//  Extentions.swift
//  Netflix Clone
//
//  Created by Miad Jalili on 20.06.2022.
//

import Foundation


extension String {
    func captlializeFirstLetter() ->  String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
