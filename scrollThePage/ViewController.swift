//
//  ViewController.swift
//  scrollThePage
//
//  Created by Roydon Jeffrey on 11/20/16.
//  Copyright © 2016 Italyte. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {
    
    //Outlet
    @IBOutlet var myView: UIImageView!
    @IBOutlet var scrollView: UIScrollView!
    
    //Array to hold the images as imageViews
    var images = [UIImageView]()
    
    let panRec = UIPanGestureRecognizer()
    let tapRec = UITapGestureRecognizer()
    
    let tapToScroll = CGRect(x: <#T##CGFloat#>, y: <#T##CGFloat#>, width: <#T##CGFloat#>, height: <#T##CGFloat#>)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func myViewTime(sender: UITapGestureRecognizer) {
        
        let location = sender.location(in: myView)
        let rect = CGRect(origin: location, size: .zero)
        scrollView.scrollRectToVisible(tapToScroll, animated: true)
        
        print("you tapped me")
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        //
        tapRec.addTarget(self, action: #selector(ViewController.myViewTime))
        myView.addGestureRecognizer(tapRec)
        myView.isUserInteractionEnabled = true
        
        //Creating containers to contain the width of the content and the scrollView
        var contentWidth: CGFloat = 0.0
        let scrollWidth = scrollView.frame.size.width
        
        //Loop for the images prefixed by "icon" and suffixed with numbers ranging from 0-2
        for x in 0...2 {
            
            //Grab each image and convert them into UIImageViews and then append them to the images array
            let image = UIImage(named: "icon\(x)")
            let imageView = UIImageView(image: image)
            images.append(imageView)
            
            //Determining the x coordinate for the imageView and determining the width of the content within the scrollView
            var newX: CGFloat = 0.0
            newX = (scrollWidth / 2) + (scrollWidth * CGFloat(x))
            contentWidth = newX + (scrollWidth / 2)
            
            //Add the imageView to the scrollView
            scrollView.addSubview(imageView)
            
            //Setting the position of the imageView in the center while determining the size by width & height
            imageView.frame = CGRect(x: newX - 75, y: (scrollView.frame.size.height / 2) - 75, width: 150, height: 150)
            
            print(imageView.frame)
            
        }
        
        //Setting the size of the content within the scrollView
        scrollView.contentSize = CGSize(width: contentWidth, height: scrollView.frame.size.height)
        
        //Disconnect the next imageView from the scrollView bounds so it appears that it's coming in from the edge of the UIView
        scrollView.clipsToBounds = false
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

