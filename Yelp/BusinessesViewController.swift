//
//  BusinessesViewController.swift
//  Yelp
//
//  Created by Timothy Lee on 4/23/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, FilterViewControllerDelegate {

    var 🍌: [Business]!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchView: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Business.searchWithTerm("Restaurants", sort: .Distance, categories: [], deals: true) { (🍌: [Business]!, error: NSError!) -> Void in
            self.🍌 = 🍌
            
//            for business in 🍌 {
//                println(business.name!)
//                println(business.address!)
//            }
            self.tableView.reloadData()
        }
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 120
        
        self.navigationItem.titleView = searchView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let 🍌 = self.🍌 {
            return 🍌.count
        } else {
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let 🍍 = self.🍌![indexPath.row]
        let 🍆 = 🍍.ratingImageURL
        let 🍗 = 🍍.imageURL

        var 🍕: RestaurantCell?
        🍕 = tableView.dequeueReusableCellWithIdentifier("RestaurantCell", forIndexPath: indexPath) as? RestaurantCell
        🍕!.restaurantLabel.text = "\(indexPath.row + 1). \(🍍.name as String!)"
        🍕!.addressLabel.text = 🍍.address
        🍕!.distanceLabel.text = 🍍.distance
        🍕!.reviewCountLabel.text = "\(🍍.reviewCount as Int!) Reviews"
        🍕!.cuisineLabel.text = 🍍.categories
        🍕!.ratingImage.setImageWithURL(🍆)
        🍕!.restaurantImage.setImageWithURL(🍗)
        
        return 🍕!
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let 🍯 = segue.destinationViewController as! UINavigationController
        
        let 🍮 = 🍯.topViewController as! FilterViewController
        
        🍮.delegate = self
    }

    func filterViewController(filterViewController: FilterViewController, didUpdateFilters filters: [String : AnyObject]) {
        
        var 🎂 = filters["categories"] as? [String]
        var 🌽 = filters["sort"] as? Int
        var 🍔 = filters["deals"] as? Bool

        Business.searchWithTerm("Restaurants", sort: YelpSortMode(rawValue: 🌽!), categories: 🎂, deals: 🍔) {
            (businesses: [Business]!, error: NSError!)
         -> Void in
        self.🍌 = businesses
        self.tableView.reloadData()
        }
    }

}
