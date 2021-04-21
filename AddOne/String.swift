//
//  String.swift
//  AddOne
//
//  Created by Jennifer Bailey on 4/20/21.
//

import Foundation


extension String
{
    static func randomNumber(length: Int) -> String
    {
        var result = ""
        for _ in 0..<length {
            let digit = Int.random(in: 0...9)
            result += "\(digit)"
        }
        return result
    }
}
