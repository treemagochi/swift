import SwiftUI

struct ContentView: View {
    @State private var widths = [CGFloat(1), 0, 0]
    
    var body: some View {
        GeometryReader { geo in
            HStack {
                First(widths: self.$widths)
                    .frame(width: geo.size.width * self.widths[0], height: geo.size.height)
                    .opacity(.init(self.widths[0]))
                Second(widths: self.$widths)
                    .frame(width: geo.size.width * self.widths[1], height: geo.size.height)
                    .opacity(.init(self.widths[1]))
                Third(widths: self.$widths)
                    .frame(width: geo.size.width * self.widths[2], height: geo.size.height)
                    .opacity(.init(self.widths[2]))
            }
        }
    }
}

private struct First: View {
    @Binding var widths: [CGFloat]
    
    var body: some View {
        VStack {
            Text("Treemagochi")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.green)
                .padding()
            Text(verbatim: "🌳")
                .font(.largeTitle)
                .padding()
            Button(action: {
                withAnimation {
                    self.widths = [0, 1, 0]
                }
            }) {
                Image(systemName: "arrow.right.circle.fill")
                    .resizable()
                    .frame(width: 35, height: 35)
                    .padding()
            }.foregroundColor(.green)
        }
    }
}

private struct Second: View {
    @Binding var widths: [CGFloat]
    
    var body: some View {
        Text("World")
    }
}

private struct Third: View {
    @Binding var widths: [CGFloat]
    
    var body: some View {
        Text("World")
    }
}

private struct Control: View {
    let title: LocalizedStringKey
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            ZStack {
                RoundedRectangle(cornerRadius: 22)
                    .frame(width: 120, height: 44)
                    .shadow(color: .secondary, radius: 2, x: -2, y: -2)
                    .shadow(color: .init(.systemBackground), radius: 2, x: 2, y: 2)
                    .foregroundColor(.init(.systemBackground))
                Text(title)
                    .foregroundColor(.primary)
                    .font(.footnote)
                    .bold()
            }
        }
    }
}
