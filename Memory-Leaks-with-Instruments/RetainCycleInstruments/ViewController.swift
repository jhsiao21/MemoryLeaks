//
//  ViewController.swift
//  RetainCycleInstruments
//
//  Created by LoganMacMini on 2024/1/11.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .white
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Show Red", style: .plain, target: self, action: #selector(handleShowRedController))
    }
    
    @objc func handleShowRedController() {
        navigationController?.pushViewController(RedController(), animated: true)
    }
}

class Service {
    // To Fix: add weak or unowned in front of var.
    var redController : RedController?
}

class RedController: UITableViewController {
    
    deinit {
        print("deinit RedController")
    }
    
    let service = Service()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .red
        
        //There is a retain cycle here because service keep a strong reference to `redController`
        service.redController = self
    }
}

