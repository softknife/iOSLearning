//: Playground - noun: a place where people can play

import UIKit


/*:
 > UIViewPropertyAnimator
 iOS 10 带来了一堆非常有意思的新特性，
 
 例如 `UIViewPropertyAnimator`。这是一个能够改善动画处理方式的新类。

 一个简单例子：
 */

let aView = UIView(frame: CGRect(x: 10, y: 10, width: 50, height: 50))
aView.backgroundColor = .red

let animator = UIViewPropertyAnimator(duration: 1.0, curve: .easeInOut) { 
    aView.center = CGPoint(x: 100, y: 100)
}
animator.startAnimation()

/*:
 > 概念解释
 
 ```swift
 public init(duration: TimeInterval, timingParameters parameters: UITimingCurveProvider)
 
 // All convenience initializers return an animator which is not running.
 public convenience init(duration: TimeInterval, curve: UIViewAnimationCurve, animations: (() -> Swift.Void)? = nil)
 
 public convenience init(duration: TimeInterval, controlPoint1 point1: CGPoint, controlPoint2 point2: CGPoint, animations: (() -> Swift.Void)? = nil)
 
 public convenience init(duration: TimeInterval, dampingRatio ratio: CGFloat, animations: (() -> Swift.Void)? = nil)
 ```
 
 1.从上面的官方注释中，我们可知，这些convenience方法都不会马上执行，需要手动调用start;
 可想而知，这种新方式来处理动画的时候，animator 有完整的状态机逻辑。
 

 
 */


animator.pauseAnimation()
animator.stopAnimation(true)
/*:
 ```swift
 open class UIViewPropertyAnimator : NSObject, UIViewImplicitlyAnimating, NSCopying
 ```
 
 2.上述文档中，我们知道 UIViewPropertyAnimator 遵守UIViewImplicitlyAnimating，而UIViewImplicitlyAnimating遵守UIViewAnimating协议，UIViewAnimating协议中有startAnimation、 pauseAnimation 和 stopAnimation 函数，通过调用这些函数，我们可以更新控件的状态，使得控件在 active、inactive 和 stopped 状态之间转换。
 */


/*:
 > 动画使用
 
 1.贝塞尔动画
 */
let bezierAnimator = UIViewPropertyAnimator(duration: 1.0,
                                            controlPoint1: CGPoint(x: 0.1,y:0.1),
                                            controlPoint2:CGPoint(x: 0.5,y:0.5)) {
    
                                                aView.alpha = 0.1
}

bezierAnimator.startAnimation()

/*:
 2.弹性动画
 */
let dampingAnimator = UIViewPropertyAnimator(
    duration: 1.0,
    dampingRatio:0.4){
        
        aView.center = CGPoint(x:0, y:0)
}

dampingAnimator.startAnimation(afterDelay: 0.2)


/*:
 3.动画block
 */

let blockAnimator = UIViewPropertyAnimator(duration: 2.0, curve: .easeIn) { 
    aView.alpha = 0.0
}

blockAnimator.addAnimations {
    aView.center = CGPoint(x: 5, y: 10)
}

blockAnimator.addCompletion {
    
    let position : UIViewAnimatingPosition = $0
    
    /*
     public enum UIViewAnimatingPosition : Int {
        case end
        case start
        case current
     }
     position 参数是 UIViewAnimatingPosition 类型，它用于表明动画结束的位置，这个值本身是一个枚举，包含了 starting、end 和 current。通常得到的值是 end。
     */
    print(position)
}

blockAnimator.startAnimation()
blockAnimator.stopAnimation(false)

/*:
 4.复杂动画
 
 ```swift
 public protocol UITimingCurveProvider : NSCoding, NSCopying {
 
 
 @available(iOS 10.0, *)
 public var timingCurveType: UITimingCurveType { get }
 
 @available(iOS 10.0, *)
 public var cubicTimingParameters: UICubicTimingParameters? { get }
 
 @available(iOS 10.0, *)
 public var springTimingParameters: UISpringTimingParameters? { get }
 }
 
 ```
 
 */

// 有问题，待完善
//class TimingCurveProvider : UITimingCurveProvider {
//    
//    var timingCurveType: UITimingCurveType = .cubic
//    
//    var cubicTimingParameters: UICubicTimingParameters? = UICubicTimingParameters(controlPoint1: CGPoint(x: 0.1 ,y: 0.2), controlPoint2: CGPoint(x: 0.5 ,y: 0.4))
//    
//    var springTimingParameters: UISpringTimingParameters? = UISpringTimingParameters(dampingRatio: 0.5, initialVelocity: CGVector(dx: 0.3, dy: 0.3))
//    
//    func copy(with zone: NSZone? = nil) -> Any {
//        return self
//    }
////
//    func encode(with aCoder: NSCoder) {
//        
//        aCoder.setValue(timingCurveType, forKey: "curveType")
//        aCoder.setValue(cubicTimingParameters, forKey: "cubic")
//        aCoder.setValue(springTimingParameters, forKey: "spring")
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        
//        timingCurveType = aDecoder.value(forKey: "curveType") as! UITimingCurveType
//        
//        cubicTimingParameters = aDecoder.value(forKey: "cubic") as? UICubicTimingParameters
//        springTimingParameters = aDecoder.value(forKey: "spring") as? UISpringTimingParameters
//    }
//    
//  
//    
//}
//
//let complicatedAnimator = UIViewPropertyAnimator(duration: 2.0, timingParameters: TimingCurveProvider())
//
//complicatedAnimator.startAnimation()




/*:
 > 动画交互
 默认的动画循环可以通过 `fractionComplete` 属性进行修改。这个值表明了动画的完成百分比，它的取值范围在 0.0 到 1.0 之间。这样就可以通过修改 `fractionComplete` 来让循环达到预期效果（例如：用户可能会通过 slider 或者 pan 手势来实时改变参数值）
 
 ```swift
 animator.fractionComplete = slider.value

 ```
 */
