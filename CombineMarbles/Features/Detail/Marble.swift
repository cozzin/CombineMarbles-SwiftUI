//
//  Marble.swift
//  CombineMarbles
//
//  Created by Antoine Garcia on 13/06/2019.
//  Copyright © 2019 antgar. All rights reserved.
//

import SwiftUI

struct MarbleView: View {
    @State
    var values: [MarbleElementType]
    private let maxTime: CGFloat = 1000.0
    var body: some View {
        GeometryReader {geometry in
            ZStack(alignment: .leading) {
                TimelineView()
                    .padding([.leading, .trailing])
                Group {
                    ForEach(self.values) { element in
                        CircleView(circleColor: element.color, title: element.value)
                            .padding(.bottom, 20)
                            .offset(x: (geometry.size.width / self.maxTime) * element.time)
                            .gesture(DragGesture()
                                .onChanged { state in
                                    self.values = self.values.map {
                                        if $0.id == element.id {
                                            return $0.mutatingTime(state.location.x / (geometry.size.width / self.maxTime))
                                        }
                                        return $0
                                    }
                                }
                        )
                    }
                }
                }.fixedSize()
            }.fixedSize(horizontal: false, vertical: true)
            .padding([.top,.bottom], 30)
    }
}

#if DEBUG
struct Marble_Previews : PreviewProvider {
    static var previews: some View {
        MarbleView(values: Operator.map.initial.line1)
    }
}
#endif
