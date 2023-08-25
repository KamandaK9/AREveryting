//
//  ContentView.swift
//  AREveryting
//
//  Created by Daniel Senga on 2023/03/02.
//

import SwiftUI
import RealityKit

struct ContentView : View {
	
	var count = Count()
	
    var body: some View {
		ZStack() {
			ARViewContainer(count: count)
			VStack {
				Spacer()
				CounterButtonBarView(count: count)
			}
		}
		.edgesIgnoringSafeArea(.all)
    }
}



#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
