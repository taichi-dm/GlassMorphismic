//
//  GlassMorphism_Logo.swift
//  
//
//  Created by 有馬大智 on 2020/12/15.
//

import SwiftUI

@available(iOS 13.0.0, *)
struct GlassMorphism_Logo: View {
    @State private var font: String = "Avenir"
    @State private var distance: CGFloat = 60
    @State private var degrees: Angle = .init(degrees: 60)
    @State private var cornerRadius: CGFloat = 0
    
    var body: some View {
        ZStack {
            Color(red: 0.96, green: 0.96, blue: 1)
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack(spacing: 20) {
                    ZStack {
                        RoundedRectangle(cornerRadius: cornerRadius)
                            .fill(Color(red: 0/255, green: 92/255, blue: 159/255))
                            .frame(width: 200, height: 200)
                            .rotation3DEffect(
                                .init(degrees: 45),
                                axis: (x: 0.0, y: 0.0, z: 1.0),
                                anchor: .center,
                                anchorZ: 0.0,
                                perspective: 0.0
                            )
                            .rotation3DEffect(
                                degrees,
                                axis: (x: 1.0, y: 0.0, z: 0.0),
                                anchor: .center,
                                anchorZ: distance,
                                perspective: 0.0
                            )
                        GlassMorphismic(blurIntensity: 20, cornerRadius: cornerRadius)
                            .frame(width: 200, height: 200)
                            .rotation3DEffect(
                                .init(degrees: 45),
                                axis: (x: 0.0, y: 0.0, z: 1.0),
                                anchor: .center,
                                anchorZ: 0.0,
                                perspective: 0.0
                            )
                            .rotation3DEffect(
                                degrees,
                                axis: (x: 1.0, y: 0.0, z: 0.0),
                                anchor: .center,
                                anchorZ: 0.0,
                                perspective: 0.0
                            )
                        RoundedRectangle(cornerRadius: cornerRadius)
                            .fill(Color.white)
                            .frame(width: 200, height: 200)
                            .rotation3DEffect(
                                .init(degrees: 45),
                                axis: (x: 0.0, y: 0.0, z: 1.0),
                                anchor: .center,
                                anchorZ: 0.0,
                                perspective: 0.0
                            )
                            .rotation3DEffect(
                                degrees,
                                axis: (x: 1.0, y: 0.0, z: 0.0),
                                anchor: .center,
                                anchorZ: -distance,
                                perspective: 0.0
                            )
                    }
                    .shadow(color: Color.secondary.opacity(0.2), radius: 10)
                    .frame(width: 100, height: 125)
                    VStack(alignment: .leading) {
                        Text("GlassMorphismic")
                            .font(.custom("AvenirNext-DemiBold", size: 65))
                        Text("By SwiftUI")
                            .foregroundColor(Color(fromHexString: "939597"))
                            .font(.custom("AvenirNext-Medium", size: 40))
                    }
                }
            }
        }.onAppear {
            self.distance = 60
            self.degrees.degrees = 60
            self.cornerRadius = 30
        }.animation(.spring())
    }
}

@available(iOS 13.0, *)
extension Color {
    init(fromHexString string: String) {
        var string: String = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        if string.hasPrefix("#") {
            _ = string.removeFirst()
        }
        
        // Double the last value if incomplete hex
        if !string.count.isMultiple(of: 2), let last = string.last {
            string.append(last)
        }
        
        // Fix invalid values
        if string.count > 8 {
            string = String(string.prefix(8))
        }
        
        // Scanner creation
        let scanner = Scanner(string: string)
        
        var color: UInt64 = 0
        scanner.scanHexInt64(&color)
        
        if string.count == 2 {
            let mask = 0xFF
            
            let g = Int(color) & mask
            
            let gray = Double(g) / 255.0
            
            self.init(.sRGB, red: gray, green: gray, blue: gray, opacity: 1)
            
        } else if string.count == 4 {
            let mask = 0x00FF
            
            let g = Int(color >> 8) & mask
            let a = Int(color) & mask
            
            let gray = Double(g) / 255.0
            let alpha = Double(a) / 255.0
            
            self.init(.sRGB, red: gray, green: gray, blue: gray, opacity: alpha)
            
        } else if string.count == 6 {
            let mask = 0x0000FF
            let r = Int(color >> 16) & mask
            let g = Int(color >> 8) & mask
            let b = Int(color) & mask
            
            let red = Double(r) / 255.0
            let green = Double(g) / 255.0
            let blue = Double(b) / 255.0
            
            self.init(.sRGB, red: red, green: green, blue: blue, opacity: 1)
            
        } else if string.count == 8 {
            let mask = 0x000000FF
            let r = Int(color >> 24) & mask
            let g = Int(color >> 16) & mask
            let b = Int(color >> 8) & mask
            let a = Int(color) & mask
            
            let red = Double(r) / 255.0
            let green = Double(g) / 255.0
            let blue = Double(b) / 255.0
            let alpha = Double(a) / 255.0
            
            self.init(.sRGB, red: red, green: green, blue: blue, opacity: alpha)
            
        } else {
            self.init(.sRGB, red: 1, green: 1, blue: 1, opacity: 1)
        }
    }
}

@available(iOS 13.0, *)
struct GlassMorphism_Logo_Previews: PreviewProvider {
    static var previews: some View {
        GlassMorphism_Logo()
    }
}
