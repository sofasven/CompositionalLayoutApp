//
//  CollectionViewCell.swift
//  CompositionalLayoutApp
//
//  Created by Sofa on 1.12.24.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "CollectionViewCell"
    
    let label = UILabel()
    
    var text: String? {
        didSet {
            label.text = text
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(label)
        
        NSLayoutConstraint.activate([
        
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
            ])
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

//class TwoColumnViewController: UIViewController {
//
//    enum Section {
//        case main
//    }
//
//    var dataSource: UICollectionViewDiffableDataSource<Section, Int>! = nil
//    var collectionView: UICollectionView! = nil
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        configureHierarchy()
//        configureDataSource()
//    }
//
//    private func createLayout() -> UICollectionViewLayout {
//        let spacing: CGFloat = 10
//        let itemSize = NSCollectionLayoutSize(
//            widthDimension: .fractionalWidth(1.0),
//            heightDimension: .fractionalHeight(1.0))
//        let item = NSCollectionLayoutItem(layoutSize: itemSize)
//
//        let groupSize = NSCollectionLayoutSize(
//            widthDimension: .fractionalWidth(1.0),
//            heightDimension: .absolute(44))
//        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
//        group.interItemSpacing = .fixed(spacing)
//
//        let section = NSCollectionLayoutSection(group: group)
//        section.contentInsets = .init(top: spacing, leading: spacing, bottom: spacing, trailing: spacing)
//        section.interGroupSpacing = spacing
//
//        let layout = UICollectionViewCompositionalLayout(section: section)
//        return layout
//    }
//
//    private func configureHierarchy() {
//        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
//        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        collectionView.backgroundColor = .systemBackground
//        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: CollectionViewCell.reuseId)
//        view.addSubview(collectionView)
//    }
//
//    private func configureDataSource() {
//        dataSource = UICollectionViewDiffableDataSource<Section, Int>(collectionView: collectionView) {
//            (collectionView: UICollectionView, indexPath: IndexPath, identifier: Int) -> UICollectionViewCell? in
//
//            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.reuseId, for: indexPath) as? CollectionViewCell else { fatalError("Cannot create the cell") }
//
//            cell.text = "\(identifier)"
//
//            return cell
//        }
//
//        var snapshot = NSDiffableDataSourceSnapshot<Section, Int>()
//        snapshot.appendSections([.main])
//        snapshot.appendItems(Array(0..<100))
//        dataSource.apply(snapshot, animatingDifferences: false)
//    }
//}
