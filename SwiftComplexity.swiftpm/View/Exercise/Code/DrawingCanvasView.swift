import SwiftUI
import PencilKit

struct DrawingCanvasView: View {
    @State private var canvasView = PKCanvasView()
    
    var body: some View {
        VStack {
            Canvas { context, size in
                let canvasImage = canvasView.drawing.image(from: canvasView.bounds, scale: 1.0)
                if let cgImage = canvasImage.cgImage {
                    context.draw(Image(cgImage, scale: 1.0, label: Text("Canvas")), at: .zero)
                }
            }
            
            HStack {
                Button("Clear") {
                    canvasView.drawing = PKDrawing()
                }
                .padding()
                
                Button("Save") {
 
                }
                .padding()
            }
        }
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .padding()
    }
}
