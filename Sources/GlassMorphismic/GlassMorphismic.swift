//
//
//
//

import SwiftUI

/// GlassMorphism Rectangle
@available(iOS 13.0, *)
public struct GlassMorphismic: View {
    @Environment(\.colorScheme) var colorScheme
    
    public var cornerRadius: CGFloat = 0
    public var shadowRadius: CGFloat = 0
    
    /// Between 0..<100
    public let blurIntensity: CGFloat
    
    private var intensity: CGFloat {
        100 / max(blurIntensity, 1)
    }
    
    private var mainColor: Color {
        colorScheme == .light ? Color.white : Color(red: 20 / 255, green: 20 / 255, blue: 20 / 255)
    }
    
    private var glossGradient: Gradient {
        Gradient(colors: [mainColor, mainColor.opacity(0.5), mainColor])
    }
    
    public init(blurIntensity intensity: CGFloat = 10, cornerRadius: CGFloat = 0, shadowRadius: CGFloat = 0) {
        self.blurIntensity = intensity
        self.cornerRadius = cornerRadius
        self.shadowRadius = shadowRadius
    }
    
    public var body: some View {
        GeometryReader { proxy in
            Blur(style: colorScheme == .light ? .systemUltraThinMaterialLight : .systemUltraThinMaterialDark)
                .frame(width: proxy.size.width * intensity, height: proxy.size.height * intensity)
                .scaleEffect(1 / intensity)
                .frame(width: proxy.size.width, height: proxy.size.height)
                .cornerRadius(cornerRadius)
                .overlay(
                    LinearGradient(
                        gradient: glossGradient,
                        startPoint: colorScheme == .light ? .topLeading : .bottomTrailing,
                        endPoint: colorScheme == .light ? .bottomTrailing : .topLeading
                    )
                    .mask(
                        RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: 1)
                            .frame(width: proxy.size.width, height: proxy.size.height)
                    )
                )
                .overlay(
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(mainColor, lineWidth: 10).blur(radius: 20).offset(x: 6, y: 6)
                ).clipShape(RoundedRectangle(cornerRadius: cornerRadius))
                .shadow(radius: shadowRadius)
        }
    }
}

@available(iOS 13.0, *)
public struct AdaptiveGlassMorphismicShape<T: Shape>: View {
    @Environment(\.colorScheme) var colorScheme
    
    public var shape: T
    public var shadowRadius: CGFloat = 0
    
    /// Between 0...100
    public let blurIntensity: CGFloat
    
    private var intensity: CGFloat {
        100 / max(blurIntensity, 1)
    }
    
    private var mainColor: Color {
        colorScheme == .light ? Color.white : Color(red: 20 / 255, green: 20 / 255, blue: 20 / 255)
    }
    
    private var glossGradient: Gradient {
        Gradient(colors: [mainColor, mainColor.opacity(0.5), mainColor])
    }
    
    public init(blurIntensity: CGFloat = 10, shape: T, shadowRadius: CGFloat = 0) {
        self.blurIntensity = blurIntensity
        self.shape = shape
        self.shadowRadius = shadowRadius
    }
    
    public var body: some View {
        GeometryReader { proxy in
            Blur(style: .systemUltraThinMaterial)
                .frame(width: proxy.size.width * intensity, height: proxy.size.height * intensity)
                .scaleEffect(1 / intensity)
                .frame(width: proxy.size.width, height: proxy.size.height)
                .overlay(
                    LinearGradient(
                        gradient: glossGradient,
                        startPoint: colorScheme == .light ? .topLeading : .bottomTrailing,
                        endPoint: colorScheme == .light ? .bottomTrailing : .topLeading
                    )
                    .mask(
                        shape
                            .stroke(lineWidth: 1 * ((proxy.size.width + proxy.size.height) / 320))
                            .frame(width: proxy.size.width, height: proxy.size.height)
                    )
                )
                .overlay(
                    shape
                        .stroke(mainColor, lineWidth: 0)
                        .blur(radius: 20)
                        .offset(x: 6, y: 6)
                )
                .clipShape(shape)
                .shadow(radius: shadowRadius)
        }
    }
}

@available(iOS 13.0, *)
public struct Blur: UIViewRepresentable {
    var style: UIBlurEffect.Style = .systemUltraThinMaterial
    
    public func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: style))
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return view
    }
    public func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}

@available(iOS 14.0, *)
struct CatInfoLibraryContent: LibraryContentProvider {
    @LibraryContentBuilder
    var views: [LibraryItem] {
        LibraryItem(
            GlassMorphismic(blurIntensity: 5, cornerRadius: 10, shadowRadius: 10),
            title: "GlassMorphism",
            category: .other
        )
    }
}
