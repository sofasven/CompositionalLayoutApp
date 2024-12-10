//
//  ViewController.swift
//  CompositionalLayoutApp
//
//  Created by Sofa on 28.11.24.
//

import UIKit

class ViewController: UIViewController {
    
    enum Section {
        case main
    }

    //Mark: - Properties

    typealias DataSource = UICollectionViewDiffableDataSource<Section, Int>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Int>

    let items = [1,2,3,4,5,6,7,8,9,0]
    lazy var dataSource = makeDataSource()

    //Mark: - Subviews

    var collectionView: UICollectionView! = nil

    //Mark: - Initializers

    //Mark: - Lifecycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
        applySnapshot(animatingDifferences: false)
    }
    
    private func createLayout() -> UICollectionViewLayout {
        let spacing: CGFloat = 10
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(44))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        group.interItemSpacing = .fixed(spacing)

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: spacing, leading: spacing, bottom: spacing, trailing: spacing)
        section.interGroupSpacing = spacing

        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
    private func configureHierarchy() {
        view.backgroundColor = .white
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        //collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
       // collectionView.backgroundColor = .systemBackground
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.reuseId)
        view.addSubview(collectionView)
    }
    
    
        func makeDataSource() -> DataSource {
            let dataSource = DataSource(collectionView: collectionView, cellProvider: { (collectionView, indexPath, item) ->
                    UICollectionViewCell? in
    
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.reuseId,
                                                                  for: indexPath) as? CollectionViewCell
                    cell?.text = "\(item)"
                    return cell
                })
    
            return dataSource
        }
    
        func applySnapshot(animatingDifferences: Bool = true) {
            var snapshot = Snapshot()
    
            snapshot.appendSections([.main])
            snapshot.appendItems(items)
    
            dataSource.apply(snapshot, animatingDifferences: animatingDifferences)
        }
}
