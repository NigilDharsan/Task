//
//  ViewController.swift
//  Task
//
//  Created by MAHENDRAN on 20/05/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!

    
    var viewModel : listViewModel?
    var definition_Arr = [Definition]()
    var filterdata =  [Definition]()
    
    var doublecatedata =  [Definition]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        registerCell()
        viewModel = listViewModel(controller: self)
        viewModel?.Apicalling()
    }

    
    func registerCell() {
        tableView.register(UINib(nibName: "ListTableViewCell", bundle: nil), forCellReuseIdentifier: "ListTableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
        
    }

}

// MARK: - TableviewDelegate and Datasource

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return definition_Arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell") as! ListTableViewCell
        
        cell.descripLabel.text = "Definition :  " + definition_Arr[indexPath.row].definition
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
}

// MARK: - API Response

extension ViewController {
    
    func isSuccess(Details: [WelcomeElement]){
        if !(Details.isEmpty){
            print("Defination Array",Details)
            let meanings = Details[0].meanings
            self.definition_Arr = meanings[0].definitions
            self.doublecatedata = meanings[0].definitions
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
}


// MARK: - Search Functionality

extension ViewController: UISearchBarDelegate {
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
      if searchText.count != 0  {
          searchResult(searchText: searchText)
          
      }else {
          definition_Arr = doublecatedata

      }
      DispatchQueue.main.async {
          self.tableView.reloadData()
      }
  }
    
    
    
    func searchResult(searchText: String) {
        let fullLegthArr = definition_Arr
        if  searchText.count > 3  {
            let filterdatas = fullLegthArr.filter({ $0.definition.contains(searchText)})
            definition_Arr = filterdatas
        }
        
    }
}
