//
//  HomeController.swift
//  MakeLinkedIn
//
//  Created by dave76 on 17/04/2019.
//  Copyright © 2019 dave76. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
  
  let cellId = "cellId"
  let headerId = "headerId"
  
  lazy var searchBar: UISearchBar = {
    let searchBar = UISearchBar()
    searchBar.placeholder = "검색"
    searchBar.translatesAutoresizingMaskIntoConstraints = false
    return searchBar
  }()
  
  let layout = UICollectionViewFlowLayout()
  lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    
    setupNavigationBarItem()
    setupCollectionView()
  }
  
  func setupCollectionView() {
    collectionView.dataSource = self
    collectionView.delegate = self
  }
  
  func setupNavigationBarItem() {
    navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "iconUserInfo"), style: .plain, target: self, action: #selector(handleUserMenu))
    navigationItem.leftBarButtonItem?.tintColor = .white
    
    navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "iconMailChatt"), style: .plain, target: self, action: #selector(handleChattMenu))
    navigationItem.rightBarButtonItem?.tintColor = .white

    navigationController?.navigationBar.addSubview(searchBar)
    guard let navBar = navigationController?.navigationBar else { return }
    searchBar.topAnchor.constraint(equalTo: navBar.topAnchor).isActive = true
    searchBar.leadingAnchor.constraint(equalTo: navBar.leadingAnchor, constant: 60).isActive = true

    searchBar.bottomAnchor.constraint(equalTo: navBar.bottomAnchor, constant: -8).isActive = true
    searchBar.trailingAnchor.constraint(equalTo: navBar.trailingAnchor, constant: -60).isActive = true
  }


  @objc func handleUserMenu() {
    print("user menu touched")
  }

  @objc func handleChattMenu() {
    print("chatt menu touched")
  }
}

extension HomeController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 10
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
    cell.backgroundColor = .red
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
  return .init(width: view.frame.width, height: 100)
  }
  
  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    if kind == UICollectionView.elementKindSectionHeader {
      let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath)
//      headerView.addSubview(topCareersStackView)
      
      return headerView
    }
    return UICollectionReusableView()
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return .init(width: view.frame.width, height: 100)
  }
  
}

extension HomeController: UISearchBarDelegate {
  
}
