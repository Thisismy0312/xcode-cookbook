//
//  CRFSlider.swift
//  geshi
//
//  Created by 徐文杰 on 2022/10/11.
//

import Cocoa

class CRFSlider: NSSlider {
    var hidesTickMarks: Bool = false

    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        self.cell = CRFCell()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func rectOfTickMark(at index: Int) -> NSRect {
        var r = super.rectOfTickMark(at: index)
        if self.hidesTickMarks {
            r.size = CGSize.zero
            return r
        } else {
            return r
        }
    }
}

class CRFCell: NSSliderCell {
    var currentValuePercentage: CGFloat {
        CGFloat((self.doubleValue - self.minValue) / (self.maxValue - self.minValue))
    }
    
    override func drawBar(inside rect: NSRect, flipped: Bool) {
        
        var rect = rect
        rect.origin.y = rect.origin.y + (rect.size.height - 2) / 2
        rect.size.height = 2
        let barRadius: CGFloat = 1
        
        let bg: NSBezierPath = NSBezierPath(roundedRect: rect, xRadius: barRadius, yRadius: barRadius)
        NSColor.init(hex: 0xF0F2F5).setFill()
        
        bg.fill()
        bg.close()
        
        var greenRect = rect
        greenRect.size.width = rect.size.width * (74.0 / 320.0)
        greenRect.origin.x = rect.size.width * (77.0 / 320.0)
        let greenBg: NSBezierPath = NSBezierPath(roundedRect: greenRect, xRadius: barRadius, yRadius: barRadius)
        NSColor.init(red: 0.08, green: 0.804, blue: 0.153, alpha: 1).setFill()
        greenBg.fill()
        greenBg.close()
        
        let leftRect: NSRect = NSRect(
            origin: rect.origin,
            size: NSMakeSize(rect.size.width * self.currentValuePercentage, rect.size.height)
        )
        let active: NSBezierPath = NSBezierPath(roundedRect: leftRect, xRadius: barRadius, yRadius: barRadius)
        active.fill()
        active.close()
        super.drawBar(inside: rect, flipped: flipped)
    }
    
    override func drawKnob(_ knobRect: NSRect) {
        let knobSize: NSSize = NSMakeSize(8, 20)
        let knobRadius: CGFloat = knobSize.width / 2.0
        
        let adjustedRect: NSRect = NSRect(
            origin: NSMakePoint(knobRect.origin.x + (knobRect.size.width - knobSize.width) * self.currentValuePercentage, knobRect.origin.y + 2),
            size: knobSize
        )
        
        let bg: NSBezierPath = NSBezierPath(roundedRect: adjustedRect, xRadius: knobRadius, yRadius: knobRadius)
        bg.lineWidth = 1
        NSColor.white.setStroke()
        bg.stroke()
        
        let shadow = NSShadow()
        shadow.shadowColor = NSColor(hex: 0x000000, alpha: 0.2)
        shadow.shadowBlurRadius = 2
        shadow.set()
        bg.stroke()
        
        NSColor.white.setFill()
        bg.fill()
        
        bg.close()
    }

    override func drawTickMarks() {
        guard let slider = controlView as? NSSlider, slider.numberOfTickMarks > 0 else {
            return
        }

        let tickWidth: CGFloat = 2
        let horizontalinset: CGFloat = 2
        let verticalinset: CGFloat = 5
        let drawRect = slider.bounds.insetBy(dx: horizontalinset, dy: verticalinset) // squish in slightly
        let step = drawRect.width/CGFloat(numberOfTickMarks-1) // classic fenceposts problem
        var mark = CGFloat(0)
        for _ in 0..<numberOfTickMarks {
            let blob = NSBezierPath(roundedRect: NSRect(x: mark + horizontalinset, y: verticalinset, width: tickWidth, height: 10), xRadius: tickWidth/2.0, yRadius: tickWidth/2.0)
            NSColor.init(hex: 0xFFFFFF).set()
            blob.fill()
            NSColor.init(hex: 0xFFFFFF).set()
            blob.stroke()
            mark += step
        }
    }
}
