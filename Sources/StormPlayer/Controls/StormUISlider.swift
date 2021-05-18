//
//  StormUISlider.swift
//
//  Created by Sebastian Ceglarz on 17/05/2021.
//

import UIKit
import SwiftUI

class StormUISlider : UISlider {
    
    private var toolTip: ToolTipPopupView?
    private var point: UIView?
    
    @IBInspectable var thumbRadius: CGFloat = 20
    
    private lazy var thumbView: UIView = {
            let thumb = UIView()
            thumb.backgroundColor = UIColor(Color("StormOrange", bundle: .module))
            thumb.layer.borderWidth = 0
            return thumb
        }()

    override public init(frame: CGRect){
        super.init(frame: frame)
        
        self.initToolTip()
        self.initPoint()
        
        let thumb = thumbImage(radius: thumbRadius)
        setThumbImage(thumb, for: .normal)
        setThumbImage(thumb, for: .highlighted)
        
    }

    required public init?(coder: NSCoder){
        super.init(coder: coder)
    }
    
    public func setToolTipValue(value : String){
        toolTip?.setValue(value: value)
    }
    
    public func showTooltip(){
        toolTip?.isHidden = false
    }
    
    public func hideTooltip(){
        toolTip?.isHidden = true
    }
    
    
    override func trackRect(forBounds bounds: CGRect) -> CGRect {

        //keeps original origin and width, changes height, you get the idea
        let customBounds = CGRect(origin: bounds.origin, size: CGSize(width: bounds.size.width, height: 8.0))
        super.trackRect(forBounds: customBounds)
        
        point?.frame = CGRect(x: bounds.size.width-13, y: -3, width: 14, height: 14)
        
        return customBounds
    }
    
    override func thumbRect(forBounds bounds: CGRect, trackRect rect: CGRect, value: Float) -> CGRect
    {
            
        let knobRect = super.thumbRect(forBounds: bounds, trackRect: rect, value: value)
        

        let popupRect = CGRect(x: knobRect.origin.x, y: knobRect.origin.y-30, width: 10, height: 10)

        toolTip?.frame = CGRect(x: popupRect.origin.x-16, y: popupRect.origin.y, width: 54, height: 25)
        
        
        return knobRect
    }

    private func thumbImage(radius: CGFloat) -> UIImage {
        // Set proper frame
        // y: radius / 2 will correctly offset the thumb

        thumbView.frame = CGRect(x: 0, y: radius / 2, width: radius, height: radius)
        thumbView.layer.cornerRadius = radius / 2

        // Convert thumbView to UIImage
        // See this: https://stackoverflow.com/a/41288197/7235585

        let renderer = UIGraphicsImageRenderer(bounds: thumbView.bounds)
        return renderer.image { rendererContext in
            thumbView.layer.render(in: rendererContext.cgContext)
        }
    }

    
    private func initPoint(){
        
        point = UIView()
        point?.layer.cornerRadius = 8
        point?.clipsToBounds = true
        point?.backgroundColor = UIColor(Color("StormProgressBarInactive", bundle: .module))
        self.addSubview(point!)
        self.sendSubviewToBack(point!)
        
        
    }

    private func initToolTip() {
        
        toolTip = ToolTipPopupView.init(frame: CGRect.zero)
        toolTip?.backgroundColor = UIColor(Color("StormProgressBarTooltipBg", bundle: .module))
        toolTip?.draw(CGRect.zero)

        toolTip?.layer.cornerRadius = 10
        toolTip?.clipsToBounds = true
        self.addSubview(toolTip!)
  
        toolTip?.isHidden = true
        
    }
    
    
}

class ToolTipPopupView: UIView {
    
    private var toolTipValue: NSString?
    
    override func draw(_ rect: CGRect) {
        
        if toolTipValue != nil {
            
            let paraStyle = NSMutableParagraphStyle.init()
            paraStyle.lineBreakMode = .byWordWrapping
            paraStyle.alignment = .center
            
            let textAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14.0), NSAttributedString.Key.paragraphStyle: paraStyle, NSAttributedString.Key.foregroundColor: UIColor.white]

            if let s: CGSize = toolTipValue?.size(withAttributes: textAttributes) {
                let yOffset = s.height
                let textRect = CGRect.init(x: self.bounds.origin.x, y: yOffset-13, width: self.bounds.size.width, height: s.height)

                toolTipValue?.draw(in: textRect, withAttributes: textAttributes)
            }
 
        }
    }
    
    func setValue(value: String) {
        toolTipValue = value as NSString
        self.setNeedsDisplay()
    }
}
