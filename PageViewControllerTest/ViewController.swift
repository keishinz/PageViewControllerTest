//
//  ViewController.swift
//  PageViewControllerTest
//
//  Created by Keishin CHOU on 2019/12/17.
//  Copyright © 2019 Keishin CHOU. All rights reserved.
//

import UIKit

class ViewController: UIPageViewController, UIPageViewControllerDataSource {
    
    let idList = ["First", "Second", "Third"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let controller = storyboard?.instantiateViewController(withIdentifier: idList.first!) as! FirstViewController
        setViewControllers([controller], direction: .forward, animated: true, completion: nil)
        print(controller.restorationIdentifier)

//        print(view.restorationidentifer)

        dataSource = self
    }
    
    func getFirst() -> FirstViewController {
        return storyboard!.instantiateViewController(withIdentifier: "First") as! FirstViewController
    }
    
    func getSecond() -> SecondViewController {
        return storyboard!.instantiateViewController(withIdentifier: "Second") as! SecondViewController
    }

    func getThird() -> ThirdViewController {
        return storyboard!.instantiateViewController(withIdentifier: "Third") as! ThirdViewController
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let index = idList.firstIndex(of: viewController.restorationIdentifier!)!
        if (index > 0) {
            return storyboard?.instantiateViewController(withIdentifier: idList[index - 1])
        }
        return nil
//        if viewController is ThirdViewController {
//            // 3 -> 2
//            return getSecond()
//        } else if viewController is SecondViewController {
//            // 2 -> 1
//            return getFirst()
//        } else {
//            // 1 -> end of the road
//            return nil
//        }
        
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let index = idList.firstIndex(of: viewController.restorationIdentifier!)!
        if (index < idList.count - 1) {
            return storyboard?.instantiateViewController(withIdentifier: idList[index + 1])
        }
        return nil
//        if viewController is FirstViewController {
//            // 1 -> 2
//            return getSecond()
//        } else if viewController is SecondViewController {
//            // 2 -> 3
//            return getThird()
//        } else {
//            // 3 -> end of the road
//            return nil
//        }
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return idList.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }


}

