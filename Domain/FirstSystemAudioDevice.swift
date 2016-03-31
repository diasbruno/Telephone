//
//  FirstSystemAudioDevice.swift
//  Telephone
//
//  Copyright (c) 2008-2016 Alexey Kuznetsov
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

struct FirstSystemAudioDevice {
    private let device: SystemAudioDevice

    init(devices: [SystemAudioDevice], predicate: (SystemAudioDevice) -> Bool) {
        device = firstOf(devices, predicate: predicate)
    }
}

private func firstOf(devices: [SystemAudioDevice], predicate: (SystemAudioDevice) -> Bool) -> SystemAudioDevice {
    if let result = devices.filter(predicate).first {
        return result
    } else {
        return NullSystemAudioDevice()
    }
}

extension FirstSystemAudioDevice: SystemAudioDevice {
    var identifier: Int { return device.identifier }
    var uniqueIdentifier: String { return device.uniqueIdentifier }
    var name: String { return device.name }
    var inputs: Int { return device.inputs }
    var outputs: Int { return device.outputs }
    var builtIn: Bool { return device.builtIn }
    var isNil: Bool { return device.isNil }
}
