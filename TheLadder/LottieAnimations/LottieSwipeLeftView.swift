//
//  LottieSwipeLeftView.swift
//  TheLadder
//
//  Created by Jake Woodall on 3/12/24.
//

import SwiftUI
import Lottie

struct LottieSwipeLeftView: UIViewRepresentable {
    @Binding var shouldPlay: Bool
    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: .zero)
        let animationView = AnimationView(name: "swipeleft")
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.animationSpeed = 1.0
        view.addSubview(animationView)
        animationView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
        ])
        context.coordinator.animationView = animationView
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        if shouldPlay {
            context.coordinator.animationView?.play()
        } else {
            context.coordinator.animationView?.stop()
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject {
        var parent: LottieSwipeLeftView
        var animationView: AnimationView?
        
        init(_ parent: LottieSwipeLeftView) {
            self.parent = parent
        }
    }
}

