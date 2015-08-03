//
//  ViewController.swift
//  HorizontalScrolling
//
//  Created by Sergio J. Carrasco A. on 03/08/15.
//  Copyright (c) 2015 Pixcomp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var imageStrings:[String] = []
     var myScrollView:UIScrollView!

    
    @IBOutlet weak var previewView: UIImageView!
   
    

    var scrollWidth : CGFloat = 320
    let scrollHeight : CGFloat = 100
    let thumbNailWidth : CGFloat = 80
    let thumbNailHeight : CGFloat = 80
    let padding: CGFloat = 10

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageStrings = ["image01","image02","image03","image04","image05","image06","image07","image08"]
        
        scrollWidth = self.view.frame.width
        
        //setup scrollView
        myScrollView = UIScrollView(frame: CGRectMake(0, self.view.frame.height - scrollHeight, scrollWidth, scrollHeight))
        
        //setup content size for scroll view
        let contentSizeWidth:CGFloat = (thumbNailWidth + padding) * (CGFloat(imageStrings.count))
        let contentSize = CGSize(width: contentSizeWidth ,height: thumbNailHeight)

        myScrollView.contentSize = contentSize
        myScrollView.autoresizingMask = UIViewAutoresizing.FlexibleWidth
        
        
        for(index,value) in enumerate(imageStrings) {
            var button:UIButton = UIButton.buttonWithType(.Custom) as! UIButton
            //calculate x for uibutton
            var xButton = CGFloat(padding * (CGFloat(index) + 1) + (CGFloat(index) * thumbNailWidth))
            button.frame = CGRectMake(xButton,padding, thumbNailWidth, thumbNailHeight)
            button.tag = index
            
            let image = UIImage(named:value)
            button.setBackgroundImage(image, forState: .Normal)
            button.addTarget(self, action: Selector("changeImage:"), forControlEvents: .TouchUpInside)
            
            myScrollView.addSubview(button)
        }
        previewView.image = UIImage(named: imageStrings[0])
        self.view.addSubview(myScrollView)
    }
        // Do any additional setup after loading the view, typically from a nib.
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func changeImage(sender:UIButton){
        let name = imageStrings[sender.tag]
        previewView.image = UIImage(named: name)
    }


}

