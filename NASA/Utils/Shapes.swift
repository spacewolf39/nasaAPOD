//
//  Shapes.swift
//  NASA
//
//  Created by Bryan Johnson on 8/6/22.
//

import SwiftUI

struct Arc: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.minX , y: rect.minY))
        path.addQuadCurve(to: CGPoint(x: rect.maxX, y: rect.minY), control: CGPoint(x: rect.midX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY + 1))
        path.closeSubpath()
        
        return path
    }
}

struct RoundTriangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.1905*width, y: 0.106*height))
        path.addCurve(to: CGPoint(x: -0.1955*width, y: 0.108*height), control1: CGPoint(x: 0.1255*width, y: 0.222*height), control2: CGPoint(x: -0.1315*width, y: 0.2235*height))
        path.addCurve(to: CGPoint(x: -0.001*width, y: -0.24*height), control1: CGPoint(x: -0.259*width, y: -0.0075*height), control2: CGPoint(x: -0.1295*width, y: -0.2395*height))
        path.addCurve(to: CGPoint(x: 0.1905*width, y: 0.106*height), control1: CGPoint(x: 0.1275*width, y: -0.2405*height), control2: CGPoint(x: 0.255*width, y: -0.01*height))
        path.closeSubpath()
        return path
    }
}
