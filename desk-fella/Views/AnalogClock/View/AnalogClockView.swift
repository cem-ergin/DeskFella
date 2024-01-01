import SwiftUI

struct AnalogClockView: View {
    @StateObject private var analogClockViewModel = AnalogClockViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Circle()
                    .fill(Color.white)
                    .frame(width: geometry.size.width, height: geometry.size.width)
                    .shadow(radius: 16)
                
                ForEach(0..<12) { index in
                    let angle = Double(index) * 30.0
                    let markerLength: CGFloat = index % 3 == 0 ? 15 : 5
                    
                    Rectangle()
                        .fill(Color.black)
                        .frame(width: 2, height: markerLength)
                        .offset(y: -geometry.size.width / 2 + markerLength / 2)
                        .rotationEffect(.degrees(angle))
                }
                
                Rectangle()
                    .fill(Color.black)
                    .frame(width: 2, height: geometry.size.width / 2 - 20)
                    .offset(y: -geometry.size.width / 4 + 10)
                    .rotationEffect(.degrees((Double(Calendar.current.component(.hour, from: analogClockViewModel.currentTime)) * 30.0) + Double(Calendar.current.component(.minute, from: analogClockViewModel.currentTime)) / 2))
                
                Rectangle()
                    .fill(Color.black)
                    .frame(width: 1, height: geometry.size.width / 2 - 10)
                    .offset(y: -geometry.size.width / 4 + 10)
                    .rotationEffect(.degrees(Double(Calendar.current.component(.minute, from: analogClockViewModel.currentTime)) * 6.0 + Double(Calendar.current.component(.second, from: analogClockViewModel.currentTime)) / 10))
                
                Rectangle()
                    .fill(Color.black)
                    .frame(width: 0.5, height: geometry.size.width / 2 - 10)
                    .offset(y: -geometry.size.width / 4 + 10)
                    .rotationEffect(.degrees(Double(Calendar.current.component(.second, from: analogClockViewModel.currentTime)) * 6.0))
                    .animation(.linear, value: 1)
                
                Circle()
                    .fill(Color.black)
                    .frame(width: 12)
            }
        }
        .onAppear(perform: {
            RunLoop.current.add(analogClockViewModel.timer, forMode: .common)
        })
    }
}

#Preview {
    AnalogClockView()
}
