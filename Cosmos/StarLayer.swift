import UIKit

/**

Creates a layer with a single star in it.

*/
struct StarLayer {
  /**
  
  Creates a square layer with given size and draws the star shape in it.
  
  - parameter starPoints: Array of points for drawing a closed shape. The size of enclosing rectangle is 100 by 100.
  
  - parameter size: The width and height of the layer. The star shape is scaled to fill the size of the layer.
  
  - parameter lineWidth: The width of the star stroke.
  
  - parameter fillColor: Star shape fill color. Fill color is invisible if it is a clear color.
  
  - parameter strokeColor: Star shape stroke color. Stroke is invisible if it is a clear color.
  
  - returns: New layer containing the star shape.
  
  */
  static func create(_ starPoints: [CGPoint], size: Double,
    lineWidth: Double, fillColor: UIColor, strokeColor: UIColor) -> CALayer {
      
    let containerLayer = createContainerLayer(size)
    let path = createStarPath(starPoints, size: size, lineWidth: lineWidth)
      
    let shapeLayer = createShapeLayer(path.cgPath, lineWidth: lineWidth,
      fillColor: fillColor, strokeColor: strokeColor, size: size)
      
    containerLayer.addSublayer(shapeLayer)
    
    return containerLayer
  }

  /**

  Creates the star layer from an image

  - parameter image: a star image to be shown.

  - parameter size: The width and height of the layer. The image is scaled to fit the layer.

  */
  static func create(image: UIImage, size: Double) -> CALayer {
    let containerLayer = createContainerLayer(size)
    let imageLayer = createContainerLayer(size)

    containerLayer.addSublayer(imageLayer)
    imageLayer.contents = image.cgImage
    imageLayer.contentsGravity = kCAGravityResizeAspect
    
    return containerLayer
  }
  
  /**
  
  Creates the star shape layer.
  
  - parameter path: The star shape path.
  
  - parameter lineWidth: The width of the star stroke.
  
  - parameter fillColor: Star shape fill color. Fill color is invisible if it is a clear color.
  
  - parameter strokeColor: Star shape stroke color. Stroke is invisible if it is a clear color.
  
  - returns: New shape layer.
  
  */
  static func createShapeLayer(_ path: CGPath, lineWidth: Double, fillColor: UIColor,
    strokeColor: UIColor, size: Double) -> CALayer {
      
    let layer = CAShapeLayer()
    layer.anchorPoint = CGPoint()
    layer.contentsScale = UIScreen.main.scale
    layer.strokeColor = strokeColor.cgColor
    layer.fillColor = fillColor.cgColor
    layer.lineWidth = CGFloat(lineWidth)
    layer.bounds.size = CGSize(width: size, height: size)
    layer.masksToBounds = true
    layer.path = path
    layer.isOpaque = true
    return layer
  }
  
  /**
  
  Creates a layer that will contain the shape layer.
  
  - returns: New container layer.
  
  */
  static func createContainerLayer(_ size: Double) -> CALayer {
    let layer = CALayer()
    layer.contentsScale = UIScreen.main.scale
    layer.anchorPoint = CGPoint()
    layer.masksToBounds = true
    layer.bounds.size = CGSize(width: size, height: size)
    layer.isOpaque = true
    return layer
  }
  
  /**
  
  Creates a path for the given star points and size. The star points specify a shape of size 100 by 100. The star shape will be scaled if the size parameter is not 100. For exampe, if size parameter is 200 the shape will be scaled by 2.
  
  - parameter starPoints: Array of points for drawing a closed shape. The size of enclosing rectangle is 100 by 100.
  
  - parameter size: Specifies the size of the shape to return.
  
  - returns: New shape path.
  
  */
  static func createStarPath(_ starPoints: [CGPoint], size: Double,
                             lineWidth: Double) -> UIBezierPath {
    

    
    
    let bezierPath = UIBezierPath()
    bezierPath.move(to: CGPoint(x: 71.93, y: 11))
    bezierPath.addCurve(to: CGPoint(x: 50, y: 22.26), controlPoint1: CGPoint(x: 62.75, y: 11), controlPoint2: CGPoint(x: 54.15, y: 18.19))
    bezierPath.addCurve(to: CGPoint(x: 28.07, y: 11), controlPoint1: CGPoint(x: 45.85, y: 18.19), controlPoint2: CGPoint(x: 37.25, y: 11))
    bezierPath.addCurve(to: CGPoint(x: 3, y: 35.39), controlPoint1: CGPoint(x: 12.38, y: 11), controlPoint2: CGPoint(x: 3, y: 20.12))
    bezierPath.addCurve(to: CGPoint(x: 14.96, y: 58.73), controlPoint1: CGPoint(x: 3, y: 47.91), controlPoint2: CGPoint(x: 14.54, y: 58.37))
    bezierPath.addLine(to: CGPoint(x: 47.27, y: 89.9))
    bezierPath.addCurve(to: CGPoint(x: 52.73, y: 89.9), controlPoint1: CGPoint(x: 48.79, y: 91.37), controlPoint2: CGPoint(x: 51.21, y: 91.37))
    bezierPath.addLine(to: CGPoint(x: 84.99, y: 58.84))
    bezierPath.addCurve(to: CGPoint(x: 97, y: 35.39), controlPoint1: CGPoint(x: 85.46, y: 58.37), controlPoint2: CGPoint(x: 97, y: 47.89))
    bezierPath.addCurve(to: CGPoint(x: 71.93, y: 11), controlPoint1: CGPoint(x: 97, y: 20.12), controlPoint2: CGPoint(x: 87.62, y: 11))
    bezierPath.close()
    return bezierPath
  }
  
  /**
  
  Scale the star points by the given factor.
  
  - parameter starPoints: Array of points for drawing a closed shape. The size of enclosing rectangle is 100 by 100.  
  
  - parameter factor: The factor by which the star points are scaled. For example, if it is 0.5 the output points will define the shape twice as small as the original.
  
  - returns: The scaled shape.
  
  */
  static func scaleStar(_ starPoints: [CGPoint], factor: Double, lineWidth: Double) -> [CGPoint] {
    return starPoints.map { point in
      return CGPoint(
        x: point.x * CGFloat(factor) + CGFloat(lineWidth),
        y: point.y * CGFloat(factor) + CGFloat(lineWidth)
      )
    }
  }
}
