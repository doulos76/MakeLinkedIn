//
//  CareersController.swift
//  MakeLinkedIn
//
//  Created by dave76 on 17/04/2019.
//  Copyright © 2019 dave76. All rights reserved.
//

import UIKit

class CareersController: UIViewController {
  
  let cellId = "cellId"
  let headerId = "headerId"
  
  let layout = UICollectionViewFlowLayout()
  lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
  
  lazy var searchBar: UISearchBar = {
    let searchBar = UISearchBar()
    searchBar.placeholder = "채용 공고 검색"
    searchBar.translatesAutoresizingMaskIntoConstraints = false
    return searchBar
  }()
  
  let savedCareersView: UIView = {
    let view = UIView()
    view.backgroundColor = .red
    return view
  }()
  
  let applyedCareersView: UIView = {
    let view = UIView()
    view.backgroundColor = .green
    return view
  }()

  let interestedCareersView: UIView = {
    let view = UIView()
    view.backgroundColor = .white
    return view
  }()
  
  lazy var topCareersStackView: UIStackView = {
    let arrangedSubviews = [
      savedCareersView,
      applyedCareersView,
      interestedCareersView
    ]
    let stackView = UIStackView(arrangedSubviews: arrangedSubviews)
    stackView.axis = .horizontal
    stackView.distribution = .fillEqually
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.backgroundColor = .white
    return stackView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    collectionView.backgroundColor = .white
    
    collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
    collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
    setupNavigationItem()
    setupViews()
  }
  
  fileprivate func setupViews() {
    view.addSubview(topCareersStackView)
      view.addSubview(collectionView)
    collectionView.dataSource = self
    collectionView.delegate = self
//    collectionView.backgroundColor = .blue
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    let layout = UICollectionViewFlowLayout()
    collectionView.collectionViewLayout = layout
    collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
  }
  
  func setupNavigationItem() {
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

extension CareersController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 10
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
    cell.backgroundColor = .yellow
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
    return .init(width: view.frame.width, height: 100)
  }
  
  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    if kind == UICollectionView.elementKindSectionHeader {
      let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath)
//      headerView.backgroundColor = .green
      headerView.addSubview(interestedCareersView)
      return headerView
    }
    return UICollectionReusableView()
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return .init(width: view.frame.width, height: 100)
  }
}
