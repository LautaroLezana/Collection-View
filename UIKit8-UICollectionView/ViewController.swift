//
//  ViewController.swift
//  UIKit8-UICollectionView
//
//  Created by Lautaro matias Lezana luna on 21/11/2022.
//

import UIKit
struct Device {
    let title: String
    let imageName: String
}

let house = [
    Device(title: "Laptop", imageName: "laptopcomputer"),
    Device(title: "Mac Mini", imageName: "macmini"),
    Device(title: "Mac Pro", imageName: "macpro.gen3"),
    Device(title: "Pantallas", imageName: "display.2"),
    Device(title: "Apple TV", imageName: "appletv"),
    Device(title: "Laptop", imageName: "laptopcomputer"),
    Device(title: "Mac Mini", imageName: "macmini"),
    Device(title: "Mac Pro", imageName: "macpro.gen3"),
    Device(title: "Pantallas", imageName: "display.2"),
    Device(title: "Apple TV", imageName: "appletv"),
    Device(title: "Laptop", imageName: "laptopcomputer"),
    Device(title: "Mac Mini", imageName: "macmini"),
    Device(title: "Mac Pro", imageName: "macpro.gen3"),
    Device(title: "Pantallas", imageName: "display.2"),
    Device(title: "Apple TV", imageName: "appletv"),
    Device(title: "Laptop", imageName: "laptopcomputer"),
    Device(title: "Mac Mini", imageName: "macmini"),
    Device(title: "Mac Pro", imageName: "macpro.gen3"),
    Device(title: "Pantallas", imageName: "display.2"),
    Device(title: "Apple TV", imageName: "appletv"),
    Device(title: "Laptop", imageName: "laptopcomputer"),
    Device(title: "Mac Mini", imageName: "macmini"),
    Device(title: "Mac Pro", imageName: "macpro.gen3"),
    Device(title: "Pantallas", imageName: "display.2"),
    Device(title: "Apple TV", imageName: "appletv"),
]

class ViewController: UIViewController, UICollectionViewDataSource {
    private let swiftBetaCollectionView : UICollectionView = {
        let layout  = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = .init(width: 200, height: 60)
//        layout.minimumLineSpacing = 200
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        swiftBetaCollectionView.backgroundColor = .blue
        swiftBetaCollectionView.dataSource = self
        swiftBetaCollectionView.register(swiftBetaCollectionViewCell.self, forCellWithReuseIdentifier: "swiftBetaCollectionViewCell")
        view.addSubview(swiftBetaCollectionView)
        
        NSLayoutConstraint.activate([
            swiftBetaCollectionView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            swiftBetaCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            swiftBetaCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            swiftBetaCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        house.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "swiftBetaCollectionViewCell", for: indexPath) as! swiftBetaCollectionViewCell
        cell.backgroundColor = .red
        
        let model = house[indexPath.row]
        cell.configure(model: model)
        
        return cell
    }

}

