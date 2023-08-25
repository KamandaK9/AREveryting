//
//  ARViewContainer.swift
//  AREveryting
//
//  Created by Daniel Senga on 2023/03/02.
//

import Foundation
import SwiftUI
import RealityKit


struct ARViewContainer: UIViewRepresentable {
	
	@ObservedObject var count: Count
	
	func makeUIView(context: Context) -> ARView {
		
		return ARView(frame: .zero)
		
	}
	
	func updateUIView(_ uiView: ARView, context: Context) {
		updateCounter(uiView: uiView)
	}
	
	private func updateCounter(uiView: ARView) {
		uiView.scene.anchors.removeAll()
		
		let anchor = AnchorEntity()
		let text = MeshResource.generateText(
			"\(abs(count.num))",
			extrusionDepth: 0.08,
			font: .systemFont(ofSize: 0.5, weight: .bold)
		)
		
		let color: UIColor = (count.num < 0) ? .red : .green
		
		
		let shader = SimpleMaterial(color: color, roughness: 4, isMetallic: true)
		let textEntity = ModelEntity(mesh: text, materials: [shader])
		
		textEntity.position.z -= 1.5
		textEntity.setParent(anchor)
		uiView.scene.addAnchor(anchor)
	}
	
}
