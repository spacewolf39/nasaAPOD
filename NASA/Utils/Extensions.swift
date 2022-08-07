//
//  Extensions.swift
//  NASA
//
//  Created by Bryan Johnson on 8/7/22.
//

import SwiftUI

extension View {
    func backgroundBlur(radius: CGFloat = 3, opaque: Bool = false) -> some View {
        self.background(Blur(radius: radius, opaque: opaque))
    }
}
