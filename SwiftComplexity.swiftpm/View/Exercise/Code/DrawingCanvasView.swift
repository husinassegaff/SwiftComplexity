import SwiftUI

struct DrawingCanvasView: View {
    @State private var lines: [Line] = []
    @State private var currentLine: Line?
    
    struct Line {
        var points: [CGPoint]
        var color: Color = .black
        var lineWidth: CGFloat = 2
    }
    
    var body: some View {
        VStack {
            Canvas { context, size in
                for line in lines {
                    var path = Path()
                    if let firstPoint = line.points.first {
                        path.move(to: firstPoint)
                        for point in line.points.dropFirst() {
                            path.addLine(to: point)
                        }
                    }
                    context.stroke(path, with: .color(line.color), lineWidth: line.lineWidth)
                }
                
                if let currentLine = currentLine {
                    var path = Path()
                    if let firstPoint = currentLine.points.first {
                        path.move(to: firstPoint)
                        for point in currentLine.points.dropFirst() {
                            path.addLine(to: point)
                        }
                    }
                    context.stroke(path, with: .color(currentLine.color), lineWidth: currentLine.lineWidth)
                }
            }
            .gesture(
                DragGesture(minimumDistance: 0, coordinateSpace: .local)
                    .onChanged { value in
                        let point = value.location
                        if currentLine == nil {
                            currentLine = Line(points: [point])
                        } else {
                            currentLine?.points.append(point)
                        }
                    }
                    .onEnded { _ in
                        if let line = currentLine {
                            lines.append(line)
                            currentLine = nil
                        }
                    }
            )
            
            Button("Clear") {
                lines = []
                currentLine = nil
            }
            .padding()
        }
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .padding()
    }
}
