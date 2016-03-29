//
//  ViewController.swift
//  SearchBar2
//
//  Created by Ricardo Michel Reyes Martínez on 3/29/16.
//  Copyright © 2016 Ricardo Michel Reyes. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate
{
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var original: [String] = ["A", "AB", "AC", "AD", "B", "BF", "BG", "BJ", "BC", "C", "CH"]
    var filtered: [String] = []
    
    var searching = false
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (searching) ? filtered.count : original.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")!
        
        let item = (searching) ? filtered[indexPath.row] : original[indexPath.row]
        
        cell.textLabel?.text = item
        
        return cell
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar)
    {
        searching = false
        
        tableView.reloadData()
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar)
    {
        searching = false
        
        tableView.reloadData()
    }
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar)
    {
        searching = true
        
        tableView.reloadData()
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String)
    {
        if (searchText.isEmpty)
        {
            self.filtered = original
            searching = false
            searchBar.resignFirstResponder()
        }
        else
        {
            let filteredItems = original.filter({$0.containsString(searchText)})
            
            self.filtered = filteredItems
        }
        
        tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        searchBar.resignFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

