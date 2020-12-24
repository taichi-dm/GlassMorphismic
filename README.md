# GlassMorphismic


![GlassMorphism_logo](Image/GlassMorphismic_logo.png)

<p align="center">
  <img alt="Swift" src="https://img.shields.io/badge/Swift-5.3-orange.svg">
</p>

GlassMorphismicは、2021年のデザインのトレンドになる可能性があると言われているGlassMorphismをSwiftUIで再現するためのライブラリです。

## インストール方法 - Installation:

### Swift Package Manager

1. Xcode内からプロジェクトを開く
2. 上部のシステムバーの"File"をクリック
3. "Swift Packages"をクリック、次いで"Add package dependency…"をクリック
4. 以下のURLをペースト：`https://github.com/taichi-dm/GlassMorphismic`
5. Branch: `main`
6. "Next"をクリック
7. "Done"をクリック。
8. `import GlassMorphismic`


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
