//
//  OptionTableViewController.swift
//  OptionSelector
//
//  Created by Nick Thompson on 3/31/19.
//  Copyright © 2019 Nick Thompson. All rights reserved.
//

import UIKit

public class OptionViewController<OptionType: OptionSelectorCell>: UITableViewController {

    public var selector: AnyOptionSelector<OptionType>?
    public var popOnSelection = true

    override public func viewDidLoad() {
        super.viewDidLoad()
        self.styleView()
    }

    override public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.selector?.options.count ?? 0
    }

    override public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.createCell()

        cell.textLabel?.text = self.selector?[indexPath.row]?.title
        cell.detailTextLabel?.text = self.selector?[indexPath.row]?.description
        cell.imageView?.image = self.selector?[indexPath.row]?.image
        cell.accessoryType = self.selector?.selectedIndices.contains(indexPath.row) ?? false ? .checkmark : .none

        return cell
    }

    override public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        self.selector?.toggle(index: indexPath.row)
        self.tableView.reloadData()
        if popOnSelection {
            self.navigationController?.popViewController(animated: true)
        }
    }

    public var defaultCellStyle: UITableViewCell.CellStyle {
        return .default
    }

    public func styleView() { }

    public func createCell() -> UITableViewCell {
        let cellIdentifier = "cell"
        return tableView.dequeueReusableCell(withIdentifier: cellIdentifier) ??
            UITableViewCell(style: self.defaultCellStyle, reuseIdentifier: cellIdentifier)
    }
}
