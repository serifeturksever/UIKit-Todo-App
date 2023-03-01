//
//  ViewController.swift
//  TodoApp
//
//  Created by Şerife Türksever on 1.03.2023.
//

import UIKit

class TodoListViewController: UICollectionViewController {
    
    typealias DataSource = UICollectionViewDiffableDataSource<Int,String>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int,String>

    var dataSource: DataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let listLayout = listLayout()
        collectionView.collectionViewLayout = listLayout
        
        let cellRegistration = UICollectionView.CellRegistration{ (cell: UICollectionViewListCell, indexPath: IndexPath, itemIdentifier: String ) in
            
            let todo = Todo.sampleData[indexPath.item]
            var contentConfiguration = cell.defaultContentConfiguration()
            contentConfiguration.text = todo.name
            contentConfiguration.secondaryText = todo.type
            contentConfiguration.image = todo.isDone == false ? UIImage(systemName: "circle") : UIImage(systemName: "checkmark.circle")
            cell.contentConfiguration = contentConfiguration
        }
        
        dataSource = DataSource(collectionView: collectionView) { (collectionView:UICollectionView, indexPath: IndexPath, itemIdentifier: String) in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for:indexPath , item: itemIdentifier)
        }
        
        navigationItem.title = "Todo List"
        let editButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editButtonTapped))
        navigationItem.leftBarButtonItem = editButton
    
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        navigationItem.rightBarButtonItem = addButton
        
        var snapshot = Snapshot()
        snapshot.appendSections([0])
        snapshot.appendItems(Todo.sampleData.map {$0.name})
        dataSource.apply(snapshot)
        collectionView.dataSource = dataSource
    }


    private func listLayout() -> UICollectionViewCompositionalLayout{
        let listConfiguration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        return UICollectionViewCompositionalLayout.list(using: listConfiguration)
    }
    
    @objc func editButtonTapped(_ sender: UIBarButtonItem) {
        print("edit")
    }
    
    @objc func addButtonTapped(_ sender: UIBarButtonItem){
        print("add")
    }
}

