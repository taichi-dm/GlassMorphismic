
import SwiftUI

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
