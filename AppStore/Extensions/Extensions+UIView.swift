//
//  Extensions+UIView.swift
//  AppStore
//
//  Created by Andres Vazquez on 2019-03-07.
//  Copyright © 2019 Andavazgar. All rights reserved.
//

import UIKit

enum UIViewAnchor {
    // Equal
    case top(NSLayoutYAxisAnchor)
    case top_C(NSLayoutYAxisAnchor, constant: CGFloat)
    
    case bottom(NSLayoutYAxisAnchor)
    case bottom_C(NSLayoutYAxisAnchor, constant: CGFloat)
    
    case leading(NSLayoutXAxisAnchor)
    case leading_C(NSLayoutXAxisAnchor, constant: CGFloat)
    
    case trailing(NSLayoutXAxisAnchor)
    case trailing_C(NSLayoutXAxisAnchor, constant: CGFloat)
    
    case centerX(NSLayoutAnchor<NSLayoutXAxisAnchor>)
    case centerX_C(NSLayoutAnchor<NSLayoutXAxisAnchor>, constant: CGFloat)
    
    case centerY(NSLayoutAnchor<NSLayoutYAxisAnchor>)
    case centerY_C(NSLayoutAnchor<NSLayoutYAxisAnchor>, constant: CGFloat)
    
    
    case width(NSLayoutDimension)
    case width_C(NSLayoutDimension, constant: CGFloat)
    case width_M(NSLayoutDimension, multiplier: CGFloat)
    case width_MC(NSLayoutDimension, multiplier: CGFloat, constant: CGFloat)
    case widthConst(CGFloat)
    
    case height(NSLayoutDimension)
    case height_C(NSLayoutDimension, constant: CGFloat)
    case height_M(NSLayoutDimension, multiplier: CGFloat)
    case height_MC(NSLayoutDimension, multiplier: CGFloat, constant: CGFloat)
    case heightConst(CGFloat)
    
    // Less Than
    case top_LessThan(NSLayoutYAxisAnchor)
    case top_C_LessThan(NSLayoutYAxisAnchor, constant: CGFloat)
    
    case bottom_LessThan(NSLayoutYAxisAnchor)
    case bottom_C_LessThan(NSLayoutYAxisAnchor, constant: CGFloat)
    
    case leading_LessThan(NSLayoutXAxisAnchor)
    case leading_C_LessThan(NSLayoutXAxisAnchor, constant: CGFloat)
    
    case trailing_LessThan(NSLayoutXAxisAnchor)
    case trailing_C_LessThan(NSLayoutXAxisAnchor, constant: CGFloat)
    
    case centerX_LessThan(NSLayoutAnchor<NSLayoutXAxisAnchor>)
    case centerX_C_LessThan(NSLayoutAnchor<NSLayoutXAxisAnchor>, constant: CGFloat)
    
    case centerY_LessThan(NSLayoutAnchor<NSLayoutYAxisAnchor>)
    case centerY_C_LessThan(NSLayoutAnchor<NSLayoutYAxisAnchor>, constant: CGFloat)
    
    
    case width_LessThan(NSLayoutDimension)
    case width_C_LessThan(NSLayoutDimension, constant: CGFloat)
    case width_M_LessThan(NSLayoutDimension, multiplier: CGFloat)
    case width_MC_LessThan(NSLayoutDimension, multiplier: CGFloat, constant: CGFloat)
    case widthConst_LessThan(CGFloat)
    
    case height_LessThan(NSLayoutDimension)
    case height_C_LessThan(NSLayoutDimension, constant: CGFloat)
    case height_M_LessThan(NSLayoutDimension, multiplier: CGFloat)
    case height_MC_LessThan(NSLayoutDimension, multiplier: CGFloat, constant: CGFloat)
    case heightConst_LessThan(CGFloat)
    
    // More Than
    case top_GreaterThan(NSLayoutYAxisAnchor)
    case top_C_GreaterThan(NSLayoutYAxisAnchor, constant: CGFloat)
    
    case bottom_GreaterThan(NSLayoutYAxisAnchor)
    case bottom_C_GreaterThan(NSLayoutYAxisAnchor, constant: CGFloat)
    
    case leading_GreaterThan(NSLayoutXAxisAnchor)
    case leading_C_GreaterThan(NSLayoutXAxisAnchor, constant: CGFloat)
    
    case trailing_GreaterThan(NSLayoutXAxisAnchor)
    case trailing_C_GreaterThan(NSLayoutXAxisAnchor, constant: CGFloat)
    
    case centerX_GreaterThan(NSLayoutAnchor<NSLayoutXAxisAnchor>)
    case centerX_C_GreaterThan(NSLayoutAnchor<NSLayoutXAxisAnchor>, constant: CGFloat)
    
    case centerY_GreaterThan(NSLayoutAnchor<NSLayoutYAxisAnchor>)
    case centerY_C_GreaterThan(NSLayoutAnchor<NSLayoutYAxisAnchor>, constant: CGFloat)
    
    
    case width_GreaterThan(NSLayoutDimension)
    case width_C_GreaterThan(NSLayoutDimension, constant: CGFloat)
    case width_M_GreaterThan(NSLayoutDimension, multiplier: CGFloat)
    case width_MC_GreaterThan(NSLayoutDimension, multiplier: CGFloat, constant: CGFloat)
    case widthConst_GreaterThan(CGFloat)
    
    case height_GreaterThan(NSLayoutDimension)
    case height_C_GreaterThan(NSLayoutDimension, constant: CGFloat)
    case height_M_GreaterThan(NSLayoutDimension, multiplier: CGFloat)
    case height_MC_GreaterThan(NSLayoutDimension, multiplier: CGFloat, constant: CGFloat)
    case heightConst_GreaterThan(CGFloat)
}

extension UIView {
    func anchorToSuperview(padding: UIEdgeInsets = .zero) {
        guard let superview = superview else { return }
        
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: superview.topAnchor, constant: padding.top),
            self.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: padding.left),
            self.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: padding.right),
            self.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: padding.bottom)
        ])
    }
    
    func anchor(to equalAnchors: [UIViewAnchor]) {
        for anchor in equalAnchors {
            switch anchor {
            case let .top(topAnchor):
                self.topAnchor.constraint(equalTo: topAnchor).isActive = true
            case let .top_C(topAnchor, constant):
                self.topAnchor.constraint(equalTo: topAnchor, constant: constant).isActive = true
                
                
            case let .bottom(bottomAnchor):
                self.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
            case let .bottom_C(bottomAnchor, constant):
                self.bottomAnchor.constraint(equalTo: bottomAnchor, constant: constant).isActive = true
                
                
            case let .leading(leadingAnchor):
                self.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
            case let .leading_C(leadingAnchor, constant):
                self.leadingAnchor.constraint(equalTo: leadingAnchor, constant: constant).isActive = true
                
                
            case let .trailing(trailingAnchor):
                self.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
            case let .trailing_C(trailingAnchor, constant):
                self.trailingAnchor.constraint(equalTo: trailingAnchor, constant: constant).isActive = true
                
                
            case let .centerX(centerXAnchor):
                self.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
            case let .centerX_C(centerXAnchor, constant):
                self.centerXAnchor.constraint(equalTo: centerXAnchor, constant: constant).isActive = true
                
                
            case let .centerY(centerYAnchor):
                self.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
            case let .centerY_C(centerYAnchor, constant):
                self.centerYAnchor.constraint(equalTo: centerYAnchor, constant: constant).isActive = true
                
            case let .width(widthAnchor):
                self.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
            case let .widthConst(widthConst):
                self.widthAnchor.constraint(equalToConstant: widthConst).isActive = true
            case let .width_C(widthAnchor, constant):
                self.widthAnchor.constraint(equalTo: widthAnchor, constant: constant).isActive = true
            case let .width_M(widthAnchor, multiplier):
                self.widthAnchor.constraint(equalTo: widthAnchor, multiplier: multiplier).isActive = true
            case let .width_MC(widthAnchor, multiplier, constant):
                self.widthAnchor.constraint(equalTo: widthAnchor, multiplier: multiplier, constant: constant).isActive = true
                
                
            case let .height(heightAnchor):
                self.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
            case let .heightConst(heightConst):
                self.heightAnchor.constraint(equalToConstant: heightConst).isActive = true
            case let .height_C(heightAnchor, constant):
                self.heightAnchor.constraint(equalTo: heightAnchor, constant: constant).isActive = true
            case let .height_M(heightAnchor, multiplier):
                self.heightAnchor.constraint(equalTo: heightAnchor, multiplier: multiplier).isActive = true
            case let .height_MC(heightAnchor, multiplier, constant):
                self.heightAnchor.constraint(equalTo: heightAnchor, multiplier: multiplier, constant: constant).isActive = true
                
                
            // Less Than or Equal
            case let .top_LessThan(topAnchor):
                self.topAnchor.constraint(lessThanOrEqualTo: topAnchor).isActive = true
            case let .top_C_LessThan(topAnchor, constant):
                self.topAnchor.constraint(lessThanOrEqualTo: topAnchor, constant: constant).isActive = true
                
                
            case let .bottom_LessThan(bottomAnchor):
                self.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor).isActive = true
            case let .bottom_C_LessThan(bottomAnchor, constant):
                self.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: constant).isActive = true
                
                
            case let .leading_LessThan(leadingAnchor):
                self.leadingAnchor.constraint(lessThanOrEqualTo: leadingAnchor).isActive = true
            case let .leading_C_LessThan(leadingAnchor, constant):
                self.leadingAnchor.constraint(lessThanOrEqualTo: leadingAnchor, constant: constant).isActive = true
                
                
            case let .trailing_LessThan(trailingAnchor):
                self.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor).isActive = true
            case let .trailing_C_LessThan(trailingAnchor, constant):
                self.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: constant).isActive = true
                
                
            case let .centerX_LessThan(centerXAnchor):
                self.centerXAnchor.constraint(lessThanOrEqualTo: centerXAnchor).isActive = true
            case let .centerX_C_LessThan(centerXAnchor, constant):
                self.centerXAnchor.constraint(lessThanOrEqualTo: centerXAnchor, constant: constant).isActive = true
                
                
            case let .centerY_LessThan(centerYAnchor):
                self.centerYAnchor.constraint(lessThanOrEqualTo: centerYAnchor).isActive = true
            case let .centerY_C_LessThan(centerYAnchor, constant):
                self.centerYAnchor.constraint(lessThanOrEqualTo: centerYAnchor, constant: constant).isActive = true
                
            case let .width_LessThan(widthAnchor):
                self.widthAnchor.constraint(lessThanOrEqualTo: widthAnchor).isActive = true
            case let .widthConst_LessThan(widthConst):
                self.widthAnchor.constraint(lessThanOrEqualToConstant: widthConst).isActive = true
            case let .width_C_LessThan(widthAnchor, constant):
                self.widthAnchor.constraint(lessThanOrEqualTo: widthAnchor, constant: constant).isActive = true
            case let .width_M_LessThan(widthAnchor, multiplier):
                self.widthAnchor.constraint(lessThanOrEqualTo: widthAnchor, multiplier: multiplier).isActive = true
            case let .width_MC_LessThan(widthAnchor, multiplier, constant):
                self.widthAnchor.constraint(lessThanOrEqualTo: widthAnchor, multiplier: multiplier, constant: constant).isActive = true
                
                
            case let .height_LessThan(heightAnchor):
                self.heightAnchor.constraint(lessThanOrEqualTo: heightAnchor).isActive = true
            case let .heightConst_LessThan(heightConst):
                self.heightAnchor.constraint(lessThanOrEqualToConstant: heightConst).isActive = true
            case let .height_C_LessThan(heightAnchor, constant):
                self.heightAnchor.constraint(lessThanOrEqualTo: heightAnchor, constant: constant).isActive = true
            case let .height_M_LessThan(heightAnchor, multiplier):
                self.heightAnchor.constraint(lessThanOrEqualTo: heightAnchor, multiplier: multiplier).isActive = true
            case let .height_MC_LessThan(heightAnchor, multiplier, constant):
                self.heightAnchor.constraint(lessThanOrEqualTo: heightAnchor, multiplier: multiplier, constant: constant).isActive = true
            
                
            // More Than or Equal
            case let .top_GreaterThan(topAnchor):
                self.topAnchor.constraint(greaterThanOrEqualTo: topAnchor).isActive = true
            case let .top_C_GreaterThan(topAnchor, constant):
                self.topAnchor.constraint(greaterThanOrEqualTo: topAnchor, constant: constant).isActive = true
                
                
            case let .bottom_GreaterThan(bottomAnchor):
                self.bottomAnchor.constraint(greaterThanOrEqualTo: bottomAnchor).isActive = true
            case let .bottom_C_GreaterThan(bottomAnchor, constant):
                self.bottomAnchor.constraint(greaterThanOrEqualTo: bottomAnchor, constant: constant).isActive = true
                
                
            case let .leading_GreaterThan(leadingAnchor):
                self.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor).isActive = true
            case let .leading_C_GreaterThan(leadingAnchor, constant):
                self.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: constant).isActive = true
                
                
            case let .trailing_GreaterThan(trailingAnchor):
                self.trailingAnchor.constraint(greaterThanOrEqualTo: trailingAnchor).isActive = true
            case let .trailing_C_GreaterThan(trailingAnchor, constant):
                self.trailingAnchor.constraint(greaterThanOrEqualTo: trailingAnchor, constant: constant).isActive = true
                
                
            case let .centerX_GreaterThan(centerXAnchor):
                self.centerXAnchor.constraint(greaterThanOrEqualTo: centerXAnchor).isActive = true
            case let .centerX_C_GreaterThan(centerXAnchor, constant):
                self.centerXAnchor.constraint(greaterThanOrEqualTo: centerXAnchor, constant: constant).isActive = true
                
                
            case let .centerY_GreaterThan(centerYAnchor):
                self.centerYAnchor.constraint(greaterThanOrEqualTo: centerYAnchor).isActive = true
            case let .centerY_C_GreaterThan(centerYAnchor, constant):
                self.centerYAnchor.constraint(greaterThanOrEqualTo: centerYAnchor, constant: constant).isActive = true
                
            case let .width_GreaterThan(widthAnchor):
                self.widthAnchor.constraint(greaterThanOrEqualTo: widthAnchor).isActive = true
            case let .widthConst_GreaterThan(widthConst):
                self.widthAnchor.constraint(greaterThanOrEqualToConstant: widthConst).isActive = true
            case let .width_C_GreaterThan(widthAnchor, constant):
                self.widthAnchor.constraint(greaterThanOrEqualTo: widthAnchor, constant: constant).isActive = true
            case let .width_M_GreaterThan(widthAnchor, multiplier):
                self.widthAnchor.constraint(greaterThanOrEqualTo: widthAnchor, multiplier: multiplier).isActive = true
            case let .width_MC_GreaterThan(widthAnchor, multiplier, constant):
                self.widthAnchor.constraint(greaterThanOrEqualTo: widthAnchor, multiplier: multiplier, constant: constant).isActive = true
                
                
            case let .height_GreaterThan(heightAnchor):
                self.heightAnchor.constraint(greaterThanOrEqualTo: heightAnchor).isActive = true
            case let .heightConst_GreaterThan(heightConst):
                self.heightAnchor.constraint(greaterThanOrEqualToConstant: heightConst).isActive = true
            case let .height_C_GreaterThan(heightAnchor, constant):
                self.heightAnchor.constraint(greaterThanOrEqualTo: heightAnchor, constant: constant).isActive = true
            case let .height_M_GreaterThan(heightAnchor, multiplier):
                self.heightAnchor.constraint(greaterThanOrEqualTo: heightAnchor, multiplier: multiplier).isActive = true
            case let .height_MC_GreaterThan(heightAnchor, multiplier, constant):
                self.heightAnchor.constraint(greaterThanOrEqualTo: heightAnchor, multiplier: multiplier, constant: constant).isActive = true
            }
        }
    }
}
