

import UIKit

extension UIView {
    
    func takeScreenshot() -> UIImage! {
        let rootViewController = UIApplication.shared.keyWindow?.rootViewController
        let frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
        UIGraphicsBeginImageContext(frame.size)
        self.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    public func loadNib() -> UIView {
        let bundle = Bundle(for: type(of: self) as AnyClass)
        let nib = UINib(nibName: self.className, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
    

}
