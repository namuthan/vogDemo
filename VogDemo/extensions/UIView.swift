//
//  UIView.swift
//  VogDemo
//
//  Created by Nabil Muthanna on 2018-04-06.
//  Copyright © 2018 nabilmuthanna. All rights reserved.
//

import UIKit

extension UIView {
    
    public func addSubviews(_ views: [UIView]) {
        for view in views {
            addSubview(view)
        }
    }
    
}



extension UIView {
    
    public enum LayoutEdges {
        case left, top, right, bottom, horizontalCentering, verticalCentering
    }
    
    public enum LayoutAxise {
        case horizontal, vertical
    }
    
    public func constrainEqual(_ attribute: NSLayoutAttribute, to: AnyObject, multiplier: CGFloat = 1, constant: CGFloat = 0) {
        constrainEqual(attribute, to: to, attribute, multiplier: multiplier, constant: constant)
    }
    
    public func constrainEqual(_ attribute: NSLayoutAttribute, to: AnyObject, _ toAttribute: NSLayoutAttribute, multiplier: CGFloat = 1, constant: CGFloat = 0) {
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: self, attribute: attribute, relatedBy: .equal, toItem: to, attribute: toAttribute, multiplier: multiplier, constant: constant)
            ])
    }
    
    // MARK: - Layout Edges
    
    public func constrainEdges(toMarginOf view: UIView, withConstant constant: CGFloat = 0) {
        constrainEqual(.top, to: view, .topMargin, constant: constant)
        constrainEqual(.leading, to: view, .leadingMargin, constant: constant)
        constrainEqual(.trailing, to: view, .trailingMargin, constant: constant)
        constrainEqual(.bottom, to: view, .bottomMargin, constant: constant)
    }
    
    public func addEdgesConstraints(left: NSLayoutAnchor<NSLayoutXAxisAnchor>,
                                    top: NSLayoutAnchor<NSLayoutYAxisAnchor>,
                                    right: NSLayoutAnchor<NSLayoutXAxisAnchor>,
                                    bottom: NSLayoutAnchor<NSLayoutYAxisAnchor>) {
        
        NSLayoutConstraint.activate([
            leftAnchor.constraint(equalTo: left ),
            topAnchor.constraint(equalTo: top),
            rightAnchor.constraint(equalTo: right),
            bottomAnchor.constraint(equalTo: bottom),
            ])
    }
    
    public func layout(edges: [LayoutEdges], toEdges otherEdges: [LayoutEdges], ofViews views: [UIView], withMargins margins: [Float]) {
        guard (edges.count == otherEdges.count) && (otherEdges.count == views.count) && (views.count == margins.count) else { return }
        for (index, edge) in edges.enumerated() {
            layout(edge: edge, toEdge: otherEdges[index], ofView: views[index], withMargin: margins[index])
        }
    }
    
    public func layout(edge: LayoutEdges, toEdge otherEdge: LayoutEdges, ofView view: UIView, withMargin margin: Float) {
        
        switch (edge, otherEdge) {
        case (.top, .top):
            topAnchor.constraint(equalTo: view.topAnchor, constant: CGFloat(margin)).isActive = true
        case (.top, .bottom):
            topAnchor.constraint(equalTo: view.bottomAnchor, constant: CGFloat(margin)).isActive = true
        case (.bottom, .top):
            bottomAnchor.constraint(equalTo: view.topAnchor, constant: -CGFloat(margin)).isActive = true
        case (.bottom, .bottom):
            bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -CGFloat(margin)).isActive = true
        case (.left, .left):
            leftAnchor.constraint(equalTo: view.leftAnchor, constant: CGFloat(margin)).isActive = true
        case (.left, .right):
            leftAnchor.constraint(equalTo: view.rightAnchor, constant: CGFloat(margin)).isActive = true
        case (.right, .left):
            rightAnchor.constraint(equalTo: view.leftAnchor, constant: -CGFloat(margin)).isActive = true
        case (.right, .right):
            rightAnchor.constraint(equalTo: view.rightAnchor, constant: -CGFloat(margin)).isActive = true
        case (.horizontalCentering, .horizontalCentering):
            center(axis: .horizontal, inView: view)
        case (.verticalCentering, .verticalCentering):
            center(axis: .vertical, inView: view)
        default:
            break
        }
    }
    
    public func layoutTo(edges: [LayoutEdges], ofView anotherView: UIView, withMargin margin: Float) {
        for edge in edges {
            layoutTo(edge: edge, ofView: anotherView, withMargin: margin)
        }
    }
    
    public func layoutTo(edge: LayoutEdges, ofView anotherView: UIView, withMargin margin: Float) {
        switch edge {
        case .left:
            leftAnchor.constraint(equalTo: anotherView.leftAnchor, constant: CGFloat(margin)).isActive = true
        case .top:
            topAnchor.constraint(equalTo: anotherView.topAnchor, constant: CGFloat(margin)).isActive = true
        case .right:
            rightAnchor.constraint(equalTo: anotherView.rightAnchor, constant: -CGFloat(margin)).isActive = true
        case .bottom:
            bottomAnchor.constraint(equalTo: anotherView.bottomAnchor, constant: -CGFloat(margin)).isActive = true
        case .horizontalCentering:
            center(axis: .horizontal, inView: anotherView)
        case .verticalCentering:
            center(axis: .vertical, inView: anotherView)
        }
    }
    
    
    
    // MARK: - Centering
    
    public func center(inView anotherView: UIView? = nil) {
        guard let container = anotherView ?? self.superview else { fatalError() }
        
        NSLayoutConstraint.activate([
            centerXAnchor.constraint(equalTo: container.centerXAnchor),
            centerYAnchor.constraint(equalTo: container.centerYAnchor),
            ])
    }
    
    public func center(axises: [LayoutAxise], inView view: UIView? = nil) {
        guard let container = view ?? self.superview else { fatalError() }
        for axis in axises {
            center(axis: axis, inView: container)
        }
    }
    
    public func center(axis: LayoutAxise, inView view: UIView? = nil) {
        guard let container = view ?? self.superview else { fatalError() }
        
        switch axis {
        case .horizontal:
            centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
        case .vertical:
            centerYAnchor.constraint(equalTo: container.centerYAnchor).isActive = true
        }
    }
    
}
