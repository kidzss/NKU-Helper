//
//  FunctionTableViewController.swift
//  NKU Helper
//
//  Created by 陈乐天 on 15/3/1.
//  Copyright (c) 2015年 陈乐天. All rights reserved.
//

import UIKit

class FunctionTableViewController: UITableViewController {

    /// 是否已经输入用户名和密码
    var isLoggedIn:Bool {
        do {
            try UserAgent.sharedInstance.getData()
            return true
        } catch {
            return false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.estimatedRowHeight = 150
        self.tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    override func viewWillAppear(animated: Bool) {
        do {
            try UserAgent.sharedInstance.getData()
            self.tableView.reloadData()
            super.viewWillAppear(animated)
        } catch {
            self.presentViewController(ErrorHandler.alert(ErrorHandler.NotLoggedIn()), animated: true, completion: nil)
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        if let actionType = tableViewActionType {
            if actionType == 0 {
                self.performSegueWithIdentifier(R.segue.functionTableViewController.showNotiCenter.identifier, sender: nil)
            }
            tableViewActionType = nil
        }
    }
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.row {
        case 0: //查询成绩
            cell.backgroundColor = UIColor(red: 131/255, green: 176/255, blue: 252/255, alpha: 1)
        case 1: //通知中心
            cell.backgroundColor = UIColor(red: 173/255, green: 114/255, blue: 195/255, alpha: 1)
//        case 2: // 选课
//            cell.backgroundColor = UIColor(red: 154/255, green: 202/255, blue: 39/255, alpha: 1)
        case 2: //评教
            cell.backgroundColor = UIColor(red: 255/255, green: 110/255, blue: 0/255, alpha: 1)
        case 3: //查询考试时间
            cell.backgroundColor = UIColor(red: 58/255, green: 153/255, blue: 216/255, alpha: 1)
        case 4: //更多
            cell.backgroundColor = UIColor(red: 250/255, green: 191/255, blue: 131/255, alpha: 1)
        default:
            break
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0: //查询成绩
            let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier(R.reuseIdentifier.gradeShowerCell.identifier)!
            cell.userInteractionEnabled = isLoggedIn
            return cell
        case 1: //通知中心
            let cell = tableView.dequeueReusableCellWithIdentifier(R.reuseIdentifier.notiCenterCell.identifier)!
            cell.userInteractionEnabled = isLoggedIn
            return cell
//        case 2: // 选课
//            let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier(R.reuseIdentifier.selectCourseCenterCell.identifier)!
//            cell.userInteractionEnabled = isLoggedIn
//            return cell
        case 2: //评教
            let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier(R.reuseIdentifier.evaluateCenterCell.identifier)!
            cell.userInteractionEnabled = isLoggedIn
            return cell
        case 3: //查询考试时间
            let cell = tableView.dequeueReusableCellWithIdentifier(R.reuseIdentifier.testTimeSearchCell.identifier)!
            cell.userInteractionEnabled = isLoggedIn
            return cell
        case 4: //更多
            let cell = tableView.dequeueReusableCellWithIdentifier(R.reuseIdentifier.moreFunctionCell.identifier)!
            cell.userInteractionEnabled = isLoggedIn
            return cell
        default:return UITableViewCell()
        }
    }

}
