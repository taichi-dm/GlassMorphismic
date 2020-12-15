# GlassMorphismic


![GlassMorphism_logo](Image/GlassMorphismic_logo.png)

<p align="center">
  <img alt="Swift" src="https://img.shields.io/badge/Swift-5.0-orange.svg">
</p>

GlassMorphismicは、2021年のデザインのトレンドになる可能性があると言われているGlassMorphismをSwiftUIで再現するためのライブラリです。

## Installation

Swift Package Managerをサポートしています。


```swift
import SwiftUI
import GlassMorphismic

struct ContentView: View {
    var body: some View {
        ZStack {
            GlassMorphismic()
                .frame(width: 100, height: 100)
        }
    }
}
```
