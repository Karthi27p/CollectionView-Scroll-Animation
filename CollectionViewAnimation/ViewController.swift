//
//  ViewController.swift
//  CollectionViewAnimation
//
//  Created by Karthi on 17/07/17.
//  Copyright © 2017 Tringapps. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource {
    let locationArray = ["Newyork","Miami","Los Angles","Chicago","Bay Area"]
    var customTableCell = CustomTableViewCell()
    static var indexCount : Int = 0
    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func rightAction(_ sender: Any) {
        if(ViewController.indexCount == locationArray.count-1)
        {
            ViewController.indexCount = locationArray.count-1
        }
        else
        {
        ViewController.indexCount = ViewController.indexCount + 1
        }
        let indexPath = NSIndexPath(row
            : ViewController.indexCount  , section: 0)
        customTableCell.collectionView.scrollToItem(at: indexPath as IndexPath, at: UICollectionViewScrollPosition.left, animated: true)
    }
    
    
    @IBAction func leftAction(_ sender: Any) {
        
        if(ViewController.indexCount == 0)
        {
           ViewController.indexCount = 0
        }
        else
        {
        ViewController.indexCount = ViewController.indexCount - 1
        }
            let indexPath = NSIndexPath(row: ViewController.indexCount , section: 0)
            customTableCell.collectionView.scrollToItem(at: indexPath as IndexPath, at: UICollectionViewScrollPosition.left, animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 5
    }
    
    public func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        return 1
    }
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    @available(iOS 6.0, *)
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CustomCollectionCellCollectionViewCell
        cell.locationLabel.text = self.locationArray[indexPath.row]
        return cell
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 3;
    }
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        var tableCell = UITableViewCell()
        if(indexPath.row == 0)
        {
           customTableCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! CustomTableViewCell
            tableCell = customTableCell as UITableViewCell
//            let cell : CustomCollectionCellCollectionViewCell
//             cell = customTableCell.collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CustomCollectionCellCollectionViewCell
//            cell.locationLabel.text = self.locationArray[indexPath.row]
            customTableCell.collectionView.reloadData()
        }
        else
        {
            tableCell = tableView.dequeueReusableCell(withIdentifier: "OrdinaryCell")!
        tableCell.textLabel?.text = "\(indexPath.row)"
        }
        return tableCell;
        
    }

}

