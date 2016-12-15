//
//  ViewController.swift
//  ChanceOfWeather
//
//  Created by Jonathan Archille on 12/14/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc0 = ViewController0(nibName: "ViewController0", bundle: nil)
        
        self.addChildViewController(vc0)
        self.scrollView.addSubview(vc0.view)
        vc0.didMove(toParentViewController: self)
        
        let vc1 = ViewController1(nibName: "ViewController1", bundle:nil)
        
        var frame1 = vc1.view.frame
        frame1.origin.x = self.view.frame.size.width
        vc1.view.frame = frame1
        
        self.addChildViewController(vc1)
        self.scrollView.addSubview(vc1.view)
        vc1.didMove(toParentViewController: self)
        
        let vc2 = ViewController2(nibName: "ViewController2", bundle:nil)
        
        var frame2 = vc2.view.frame
        frame2.origin.x = self.view.frame.size.width * 2
        vc2.view.frame = frame2
        
        self.addChildViewController(vc2)
        self.scrollView.addSubview(vc2.view)
        vc2.didMove(toParentViewController: self)
        
        let vc3 = ViewController2(nibName: "ViewController3", bundle:nil)
        
        var frame3 = vc3.view.frame
        frame3.origin.x = self.view.frame.size.width * 3
        vc3.view.frame = frame3
        
        self.addChildViewController(vc3)
        self.scrollView.addSubview(vc3.view)
        vc3.didMove(toParentViewController: self)

        let vc4 = ViewController3(nibName: "ViewController3", bundle:nil)
        
        var frame4 = vc4.view.frame
        frame4.origin.x = self.view.frame.size.width * 4
        vc4.view.frame = frame4
        
        self.addChildViewController(vc3)
        self.scrollView.addSubview(vc3.view)
        vc3.didMove(toParentViewController: self)

        
        self.scrollView.contentSize = CGSize(width: self.view.frame.size.width * 5, height: self.view.frame.size.height - 66);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

