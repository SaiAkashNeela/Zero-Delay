import SwiftUI

struct LogoImage: View {
    var body: some View {
        Circle()
            .fill(Color.black)
            .frame(width: 80, height: 80)
            .overlay(
                Path { path in
                    path.move(to: CGPoint(x: 30, y: 30))
                    path.addCurve(
                        to: CGPoint(x: 50, y: 50),
                        control1: CGPoint(x: 40, y: 25),
                        control2: CGPoint(x: 55, y: 35)
                    )
                    path.addCurve(
                        to: CGPoint(x: 30, y: 60),
                        control1: CGPoint(x: 45, y: 65),
                        control2: CGPoint(x: 30, y: 50)
                    )
                }
                .stroke(Color.white, lineWidth: 3)
            )
    }
}

// Note: This is a placeholder. In a real app, you would use an actual image asset.
// This file is just to demonstrate what the logo might look like.
// You should replace this with a real image in your Assets catalog. 