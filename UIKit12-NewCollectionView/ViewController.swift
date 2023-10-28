//
//  ViewController.swift
//  UIKit12-NewCollectionView
//
//  Created by Lautaro matias Lezana luna on 22/11/2022.
//

import UIKit

struct Device: Hashable {
    let id: UUID = UUID()
    let title: String
    let imageName: String
}

let home  = [
    Device(title: "Laptop", imageName: "laptopcomputer"),
    Device(title: "Mac Mini", imageName: "macmini"),
    Device(title: "Mac Pro", imageName: "macpro.gen3"),
    Device(title: "Pantallas", imageName: "display.2"),
    Device(title: "Apple TV", imageName: "appletv"),
]

let office  = [
    Device(title: "Laptop", imageName: "laptopcomputer"),
    Device(title: "Mac Mini", imageName: "macmini"),
    Device(title: "Mac Pro", imageName: "macpro.gen3")
]

class ViewController: UIViewController {
    lazy var swiftbetaCollectionView: UICollectionView = {
        let configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    lazy var datasource: UICollectionViewDiffableDataSource<Int, Device> = {
        let deviceCell = UICollectionView.CellRegistration<UICollectionViewListCell, Device> { cell,indexPath, model in
            var listContentConfiguration = UIListContentConfiguration.cell()
            listContentConfiguration.text = model.title
            listContentConfiguration.image = UIImage(systemName: model.imageName)
            cell.contentConfiguration = listContentConfiguration
        }
        
        let datasource = UICollectionViewDiffableDataSource<Int, Device>(collectionView: swiftbetaCollectionView) { collectionView, indexPath, model in
            return collectionView.dequeueConfiguredReusableCell(using: deviceCell, for: indexPath, item: model)
        }
        
        return datasource
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        swiftbetaCollectionView.backgroundColor = .green
        view.addSubview(swiftbetaCollectionView)
        
        NSLayoutConstraint.activate([
            swiftbetaCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            swiftbetaCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            swiftbetaCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            swiftbetaCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        var snapshot = datasource.snapshot()
        snapshot.appendSections([0, 1])
        snapshot.appendItems(home, toSection: 0)
        snapshot.appendItems(office, toSection: 1)
        datasource.apply(snapshot)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            snapshot.appendItems([.init(title: "New Device", imageName: "appletv" )], toSection: 0)
            snapshot.appendItems([.init(title: "New Device 2", imageName: "appletv" )], toSection: 0)
            self.datasource.apply(snapshot)
        }
    }

}

