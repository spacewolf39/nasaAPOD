//
//  Colors.swift
//  NASA
//
//  Created by Bryan Johnson on 8/7/22.
//

import SwiftUI

let darkPurple = Color(red: 29/255, green: 17/255, blue: 53/255)

let transparent = Color(.black).opacity(0.0)

let backgroundGradient = LinearGradient(gradient: Gradient(colors: [darkPurple, .black]), startPoint: .top, endPoint: .bottom)

let gradient = LinearGradient(gradient: Gradient(colors: [transparent, .white, transparent]), startPoint: .leading, endPoint: .trailing)
