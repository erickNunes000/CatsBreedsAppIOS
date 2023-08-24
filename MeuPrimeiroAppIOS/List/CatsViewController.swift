//
//  ViewController.swift
//  MeuPrimeiroAppIOS
//
//  Created by Erico e Alisson  on 09/08/23.
//

import UIKit

class CatsViewController: UIViewController {
    
    private var cats: [Cat] = []
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.textColor = .orange
        label.numberOfLines = 0
        label.text = "Cats Breeds"
        return label
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        addViewsInHierarchy()
        setupConstraints()
        fetchRemoteCats()
       	
    }

    private func addViewsInHierarchy() {
        view.addSubview(titleLabel)
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32)
        ])
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func fetchRemoteCats(){
        let url = URL(string: "https://api.thecatapi.com/v1/breeds?limit=10&page=0")!
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) {data,response,error in
            if error != nil {return}
                
            guard let catsData = data else { return }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            guard let remoteCats = try? decoder.decode([Cat].self, from: catsData) else {return}
            
            self.cats = remoteCats
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }
        task.resume()
    }
}




extension CatsViewController: UITableViewDataSource, UITableViewDelegate	{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CatCell()
        let cat = cats[indexPath.row]
        cell.configure(cat: cat)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cats.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Detail", bundle: Bundle(for: DetailViewController.self))
        let detailViewController = storyboard.instantiateViewController(withIdentifier: "Detail") as! DetailViewController
        detailViewController.cat = cats[indexPath.row]
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}
	
