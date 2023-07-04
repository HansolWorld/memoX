//
//  ContentView.swift
//  memoX
//
//  Created by apple on 2023/07/04.
//

import SwiftUI

struct ContentView: View {
    @State var resetTime: Int = 3
    @State private var timer: Timer? = nil
    @State private var note: String = ""
    
    var body: some View {
        NavigationStack {
            Form {
                Stepper(value: $resetTime, in: 1...3) {
                    Text("\(resetTime) s")
                }
                .padding()
                TextEditor(text: $note)
                    .textSelection(.enabled)
                    .frame(height: 500)
                    .onChange(of: note) { _ in
                        timer?.invalidate()
                        timer = Timer.scheduledTimer(withTimeInterval: TimeInterval(resetTime), repeats: true) { _ in
                            note = ""
                        }
                    }
            }
            .navigationTitle("memoX")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
        


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ContentView()
        }
    }
}
