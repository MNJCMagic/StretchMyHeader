//
//  ViewController.swift
//  StretchMyHeader
//
//  Created by Mike Cameron on 2018-05-22.
//  Copyright © 2018 Mike Cameron. All rights reserved.
//

import UIKit

private let kTableHeaderHeight: CGFloat = 300.0

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        headerView = tableView.tableHeaderView
        tableView.tableHeaderView = nil
        tableView.addSubview(headerView)
        tableView.contentInset = UIEdgeInsets(top: kTableHeaderHeight, left: 0, bottom: 0, right: 0)
        CGPoint(x: 0, y: -kTableHeaderHeight)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //MARK: Status bar
    override var prefersStatusBarHidden: Bool {
        return true
    }



    //MARK: Table View
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stretchCell", for: indexPath) as! stretchTableViewCell
        let item = items[indexPath.row]
        cell.newsItem = item
        return cell
    }
    
    //MARK: Header
    
    var headerView: UIView!
    
    func updateHeaderView() {
        var headerRect = CGRect(x: 0, y: -kTableHeaderHeight, width: tableView.bounds.width, height: kTableHeaderHeight)
        if tableView.contentOffset.y < -kTableHeaderHeight {
            headerRect.origin.y = tableView.contentOffset.y
            headerRect.size.height = -tableView.contentOffset.y
        }
        headerView.frame = headerRect
    }
    
    //MARK: Scrollview
    
     func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateHeaderView()
    }
    
    //MARK: Items
    
    let items = [NewsItem(category: .World, summary: "Climate change protests, divestments meet fossil fuels realities"),
                 NewsItem(category: .Europe, summary: "Scotland's 'Yes' leader says independence vote is 'once in a lifetime'"),
                 NewsItem(category: .MiddleEast, summary: "Airstrikes boost Islamic State, FBI director warns more hostages possible"),
                 NewsItem(category: .Africa, summary: "Nigeria says 70 dead in building collapse; questions S. Africa victim claim"),
                 NewsItem(category: .AsiaPacific, summary: "Despite UN ruling, Japan seeks backing for whale hunting"),
                 NewsItem(category: .Americas, summary: "Officials: FBI is tracking 100 Americans who fought alongside IS in Syria"),
                 NewsItem(category: .World, summary: "South Africa in $40 billion deal for Russian nuclear reactors"),
                 NewsItem(category: .Europe, summary: "'One million babies' created by EU student exchanges")]

}

