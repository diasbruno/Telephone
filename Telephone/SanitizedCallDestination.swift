//
//  SanitizedCallDestination.swift
//  Telephone
//
//  Copyright © 2008-2016 Alexey Kuznetsov
//  Copyright © 2016-2017 64 Characters
//
//  Telephone is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  Telephone is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//

import Foundation

final class SanitizedCallDestination: NSObject {
    @objc let value: String

    @objc(initWithString:)
    init(_ string: String) {
        value = strippingSlashes(from: strippingHeaders(from: string))
    }
}

private func strippingSlashes(from string: String) -> String {
    if let range = string.range(of: "sip://") {
        return string.replacingCharacters(in: range, with: "sip:")
    } else if let range = string.range(of: "tel://") {
        return string.replacingCharacters(in: range, with: "tel:")
    } else {
        return string
    }
}

private func strippingHeaders(from string: String) -> String {
    if let range = string.range(of: "?") {
        return String(string[..<range.lowerBound])
    } else {
        return string
    }
}
