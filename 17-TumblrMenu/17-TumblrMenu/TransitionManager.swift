//
//  TransitionManager.swift
//  17-TumblrMenu
//
//  Created by Mesut Gedik on 4.04.2023.
//

import UIKit

class TransitionManager: NSObject {
    
    private var presenting = false
  
   
}
// MARK: - UIViewControllerAnimatedTransitioning protocol methods

extension TransitionManager:UIViewControllerTransitioningDelegate {
    
    // animate a change from one viewcontroller to another
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        //TODO : perform animation
        // get reference to our fromView, toView and the container view that we should perform the transition in
        // create a tuple of our screens
        let container = transitionContext.containerView
        
        let screens: (from:UIViewController, to:UIViewController) = (transitionContext.viewController(forKey: .from)!, transitionContext.viewController(forKey: .to)!)
        
        // assign references to our menu view controller and the 'bottom' view controller from the tuple
        // remember that our menuViewController will alternate between the from and to view controller depending if we're presenting or dismissing
        
        let menuViewController = !self.presenting ? screens.from as! MenuViewController : screens.to as! MenuViewController
        let bottomViewController = !self.presenting ? screens.to as UIViewController : screens.from as UIViewController
        
        let menuView: UIView! = menuViewController.view
        let bottomView: UIView! = bottomViewController.view
        
        
        // prepare the menu
        if (self.presenting){
            offStageMenuViewController(menuViewController: menuViewController)
        }
        
        // add the both views to our view controller
        container.addSubview(bottomView)
        container.addSubview(menuView)
        
        // get the duration of the animation
        // DON'T just type '0.5s' -- the reason why won't make sense until the next post
        // but for now it's important to just follow this approach
        let duration = self.transitionDuration(using: transitionContext)
        
        UIView.animate(withDuration: duration, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.8, animations: {
            // either fade in or fade out
            if (self.presenting){
                self.onStageMenuViewController(menuViewController: menuViewController)
            }else {
                self.offStageMenuViewController(menuViewController: menuViewController)
            }
          
           
        } , completion: { finished in
            // tell our transitionContext object that we've finished animating
            transitionContext.completeTransition(true)
            UIApplication.shared.keyWindow!.addSubview(screens.to.view)
        })
    }
    func offStageMenuViewController(menuViewController: MenuViewController){
        menuViewController.view.alpha = 0
        // setup 2D transitions for animations
        let offstageLeft = CGAffineTransformMakeTranslation(-150, 0)
        let offstageRight = CGAffineTransformMakeTranslation(150, 0)
        
        menuViewController.textButton.transform = offstageLeft
        menuViewController.photoButton.transform = offstageLeft
        menuViewController.dendenButton.transform = offstageLeft
        
        menuViewController.audioButton.transform = offstageRight
        menuViewController.chatButton.transform = offstageRight
        menuViewController.linkButton.transform = offstageRight

    }
    
    func onStageMenuViewController(menuViewController: MenuViewController){
        menuViewController.view.alpha = 1
        
        menuViewController.textButton.transform = CGAffineTransformIdentity
        menuViewController.photoButton.transform = CGAffineTransformIdentity
        menuViewController.dendenButton.transform = CGAffineTransformIdentity
        
        menuViewController.audioButton.transform = CGAffineTransformIdentity
        menuViewController.chatButton.transform = CGAffineTransformIdentity
        menuViewController.linkButton.transform = CGAffineTransformIdentity
    }
    
    // return how many seconds the transiton animation will take
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1
    }
}
// MARK: - UIViewControllerTransitioningDelegate protocol methods

extension TransitionManager:  UIViewControllerAnimatedTransitioning {
    // return the animataor when presenting a viewcontroller
    // remember that an animator (or animation controller) is any object that aheres to the UIViewControllerAnimatedTransitioning protocol
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.presenting = true
        return self
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.presenting = false
        return self
    }

    
}
//http://mathewsanders.com/animated-transitions-in-swift/

