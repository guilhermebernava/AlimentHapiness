//
//  Table.swift
//  AlimentsRating
//
//  Created by Guilherme Bernava on 29/06/22.
//

import SwiftUI

func GetIndexOfCell(_ cell: UITableViewCell, tableView: UITableView) -> Int?{
    if let indexPath = tableView.indexPath(for: cell){
        return indexPath.row
    }
    return nil
}

func GetCellFromGestureView(_ view: UIView?) -> UITableViewCell?{
    guard let cell = view as? UITableViewCell else {return nil}
    return cell
}

func GetItemFromCell<T>(_ cell: UITableViewCell, tableView:UITableView, list: [T]) -> T?{
    if let indexPath = tableView.indexPath(for: cell){
        return list[indexPath.row]
    }
    return nil
}



