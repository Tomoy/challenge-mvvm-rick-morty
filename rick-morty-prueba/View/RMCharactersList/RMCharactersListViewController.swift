//
//  ViewController.swift
//  rick-morty-prueba
//
//  Created by Tomas Ignacio Moyano on 22.11.22.
//

import UIKit

class RMCharactersListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var charactersListViewModel: RMCharacterListViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "RMCharacterTableViewCell", bundle: nil), forCellReuseIdentifier: "RMCharacterCell")

        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

        let repository = RMCharactersRepositoryWeb(apiService: ApiService())
        charactersListViewModel = RMCharacterListViewModel(repository: repository)
        
        charactersListViewModel?.characters.bind { [weak self] _ in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        
        charactersListViewModel?.errorMessage.bind { [weak self] message in
            DispatchQueue.main.async {
                self?.showMessageAlertController(title: "Error", message: message, dismissButtonText: "OK")
            }
        }
        
        charactersListViewModel?.totalCharacters.bind{ [weak self] totalCharacters in
            DispatchQueue.main.async {
                self?.title = "Total characters: \(totalCharacters)"
            }
        }
        charactersListViewModel?.fetchCharacters()
    }
}

extension RMCharactersListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rmCharacterDetailVC = RMCharacterDetailViewController.instantiate()
        rmCharacterDetailVC.setModel(theModel: charactersListViewModel!.characters.value[indexPath.row])
        navigationController?.pushViewController(rmCharacterDetailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.CHARACTERS_ROW_HEIGHT
    }
}

extension RMCharactersListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "RMCharacterCell", for: indexPath) as! RMCharacterTableViewCell
        cell.configure(cellModel: charactersListViewModel!.characters.value[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return charactersListViewModel!.characters.value.count
    }
}

