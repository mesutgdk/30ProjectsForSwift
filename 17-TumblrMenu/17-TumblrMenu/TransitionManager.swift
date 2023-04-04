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
        let container = transitionContext.containerView
        let fromView = transitionContext.view(forKey: UITransitionContextViewKey.from)!
        let toView = transitionContext.view(forKey: UITransitionContextViewKey.to)!
        
        // set up from 2D transforms that we'll use in the animation
        let offScreenRight = CGAffineTransformMakeTranslation(container.frame.width, 0)
        let offScreenLeft = CGAffineTransformMakeTranslation(-container.frame.width, 0)
        
        // start the toView to the right of the screen
        toView.transform = offScreenRight
        
        // add the both views to our view controller
        container.addSubview(toView)
        container.addSubview(fromView)
        
        // get the duration of the animation
        // DON'T just type '0.5s' -- the reason why won't make sense until the next post
        // but for now it's important to just follow this approach
        let duration = self.transitionDuration(using: transitionContext)
        
        // perform the animation!
        // for this example, just slid both fromView and toView to the left at the same time
        // meaning fromView is pushed off the screen and toView slides into view
        // we also use the block animation usingSpringWithDamping for a little bounce
        UIView.animate(withDuration: duration, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.8, animations: {
                    
            fromView.transform = offScreenLeft
            toView.transform = CGAffineTransformIdentity
                    
            }, completion: { finished in
                        // tell our transitionContext object that we've finished animating
            transitionContext.completeTransition(true)
        })
    }
    
    // return how many seconds the transiton animation will take
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
}
// MARK: - UIViewControllerTransitioningDelegate protocol methods

extension TransitionManager:  UIViewControllerAnimatedTransitioning{
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

//The important parts to notice are:
//
//iOS passes us an object called transitionContext whenever this method is performed. This object gives us references to views of screens that we’re transitioning from and to and very importantly gives us a third view that acts as a container for the animations to be performed in.
//We have to manually add our fromView and toView to the container view. The order we add our views determines which will be shown on top if they overlap as part of the animation.
//We use a regular block animation to perform the animation, but instead of entering the animation duration we call the method self.transitionDuration(transitionContext).
//When we’ve completed the animation we call the method transitionContext.completeTransition(true).
//Before we run the project we need to update our ViewController class and create an instance of the our TransitionManager object.

