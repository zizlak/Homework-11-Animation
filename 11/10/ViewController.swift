

import UIKit

class ViewController: UIViewController {
    

    
    @IBOutlet weak var redSquare: UIImageView!
    
    @IBOutlet weak var label: UILabel!
    
    var numbers = [1,2,3,4,5,6,7]
    var currentIndex = -1
    
    func one() {
        UIView.animate(withDuration: 1, delay: 0, options: [UIView.AnimationOptions.autoreverse], animations: {self.redSquare.backgroundColor = UIColor.yellow}) { (isCompleted) in
            self.redSquare.backgroundColor = #colorLiteral(red: 0.6797983942, green: 0.0555950982, blue: 0.0360518838, alpha: 1)
        }
    }
    
    func two() {
        UIView.animate(withDuration: 1, delay: 0, options: [UIView.AnimationOptions.autoreverse], animations: {self.redSquare.frame = CGRect(x: (UIScreen.main.bounds.size.width - self.redSquare.frame.size.width), y: 0, width: self.redSquare.frame.size.width, height: self.redSquare.frame.size.height)})
        { (isCompleted) in
            self.redSquare.frame = CGRect(x: (UIScreen.main.bounds.size.width - self.redSquare.frame.size.width)/2, y: 150, width: self.redSquare.frame.size.width, height: self.redSquare.frame.size.height)}
    }
    
    func three() {
        let animation = CABasicAnimation(keyPath: "cornerRadius")
        animation.fromValue = NSNumber(value: 0)
        animation.toValue = NSNumber(value: Float(redSquare.frame.size.width / 2))
        animation.duration = 2
        redSquare.layer.add(animation, forKey: "cornerRadius")

    }
    
    func four() {
        UIView.animate(withDuration: 1, delay: 0, options: [UIView.AnimationOptions.autoreverse], animations: { self.redSquare.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        }) { (isCompleted) in
            self.redSquare.transform = CGAffineTransform(rotationAngle: 0)
            
        }}
    
    func five() {
        UIView.animate(withDuration: 1, delay: 0, options: [UIView.AnimationOptions.autoreverse], animations: { self.redSquare.alpha = 0
        }) { (isCompleted) in
            self.redSquare.alpha = 1
        }}
    
    func six() {
        UIView.animate(withDuration: 1, delay: 0, options: [UIView.AnimationOptions.autoreverse], animations: { self.redSquare.frame.size.height *= 2; self.redSquare.frame.size.width *= 2;
            self.redSquare.center = CGPoint(x: self.view.bounds.midX, y: 150 + (self.redSquare.frame.size.height/2))
        }) { (isCompleted) in
            self.redSquare.frame.size.height = 150; self.redSquare.frame.size.width = 150
            self.redSquare.center = CGPoint(x: self.view.bounds.midX, y: 150 + (150/2))
        }}
    
    func seven() {
       UIView.animate(withDuration: 1, delay: 0, options: .curveLinear, animations: {
            self.redSquare.transform = self.redSquare.transform.rotated(by: CGFloat.pi)
       }) { finished in self.label.text == "7" ?
        self.seven() : print("finished") }
        }
    
    var functionsArray: Array = [one, two, three, four, five, six, seven]
    
    @IBAction func nextButton(_ sender: Any) {
        currentIndex += 1
        label.text = "\(numbers[currentIndex % numbers.count])"
        
        switch label.text {
        case "1": one()
        case "2": two()
        case "3": three()
        case "4": four()
        case "5": five()
        case "6": six()
        default: seven()
        }}

    
    
    
    @IBAction func returnButton(_ sender: Any) {
        if currentIndex > 0 { currentIndex -= 1} else { currentIndex = numbers.count}
        label.text = "\(numbers[currentIndex % numbers.count])"
        switch label.text {
        case "1": one()
        case "2": two()
        case "3": three()
        case "4": four()
        case "5": five()
        case "6": six()
        default: seven()
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.redSquare.frame = CGRect(x: (UIScreen.main.bounds.size.width - self.redSquare.frame.size.width)/2, y: 150, width: 150, height: 150)}
    }


