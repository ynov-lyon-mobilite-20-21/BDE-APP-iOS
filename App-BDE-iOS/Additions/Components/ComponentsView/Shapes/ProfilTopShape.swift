//
//  EventCardInformationsContainerShape.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 31/10/2020.
//

import SwiftUI

struct ProfilTopShape: Shape {

    func path(in rect: CGRect) -> Path {
        var path = Path()
        let offset: CGFloat = rect.maxY * 0.1
        let radius: CGFloat = rect.maxY - offset

        let tl = CGPoint(x: rect.minX, y: rect.minY)
        let tr = CGPoint(x: rect.maxX, y: rect.minY)
        let bl = CGPoint(x: rect.minX, y: rect.maxY)
        let bre = CGPoint(x: rect.maxX - radius, y: rect.maxY)
        let brs = CGPoint(x: rect.maxX, y: rect.minY + offset)
        let center = CGPoint(x: rect.maxX - radius, y: rect.minY + offset)

        path.move(to: tl)
        path.addLine(to: tr)
        path.addLine(to: brs)
        path.addRelativeArc(center: center, radius: radius,
                            startAngle: Angle.degrees(0), delta: Angle.degrees(90))
        path.addLine(to: bre)
        path.addLine(to: bl)

        return path
    }
}

struct ProfilTopShape_preview: PreviewProvider {
    static var previews: some View {
        ProfilTopShape()
    }
}
