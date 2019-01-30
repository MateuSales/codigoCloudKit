////
////  ViewController.swift
////  CloudKitOne
////
////  Created by Mateus Sales on 25/01/19.
////  Copyright © 2019 Mateus Sales. All rights reserved.
////
//
//import UIKit
//import CloudKit
//
//class ViewController: UIViewController {
//
//    @IBOutlet weak var tableView: UITableView!
//
//    let searchController = UISearchController(searchResultsController: nil)
//    let dataBase = CKContainer.default().privateCloudDatabase
//
//    var notes = [CKRecord]()
//    //var notesString = [String]()
//    var notesString = ["Mateus","Debora","Xuxa"]
//    var filteredsNotes = [String]()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        tableView.delegate = self
//        tableView.dataSource = self
//
//        checkLogin()
//        setupSearchBar()
//        setupRefreshControl()
//    }
//
//    func setupRefreshControl(){
//        let refreshControl = UIRefreshControl()
//        refreshControl.attributedTitle = NSAttributedString(string: "Atualizando")
//        refreshControl.addTarget(self, action: #selector(queryDataBase), for: .valueChanged)
//        //refreshControl.addTarget(self, action: #selector(queryDataBase()), for: .valueChanged)
//        //refreshControl.addTarget(self, action: #selector(queryDataBase(search: searchController.searchBar.text!)), for: .valueChanged)
//        self.tableView.refreshControl = refreshControl
//    }
//
//    func setupSearchBar(){
//        // Setup the Search Controller
//        searchController.searchResultsUpdater = self
//        searchController.obscuresBackgroundDuringPresentation = false
//        searchController.searchBar.placeholder = "Search Quotas"
//        navigationItem.searchController = searchController
//        definesPresentationContext = true
//    }
//
//    @IBAction func onePlusTapped(){
//        let alert = UIAlertController(title: "Adicionando", message: "O que você gostaria de adicionar no notas?", preferredStyle: .alert)
//        alert.addTextField { (textField) in
//            textField.placeholder = "Digite sua nota aqui"
//        }
//        let cancel = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
//        let post = UIAlertAction(title: "Postar", style: .default) { (_) in
//            guard let text = alert.textFields?.first?.text else { return }
//            self.saveToCloud(note: text)
//            print(text)
//        }
//        alert.addAction(cancel)
//        alert.addAction(post)
//        present(alert, animated: true, completion: nil)
//    }
//
//    func saveToCloud(note: String){
//        let newNote = CKRecord(recordType: "Note")
//        newNote.setValue(note, forKey: "content")
//        dataBase.save(newNote) { (record, errors) in
//            print(errors)
//            guard record != nil else { return }
//            print("saved record")
//        }
//    }
//
//    func checkLogin(){
//        CKContainer.default().accountStatus { (accountStatus, error) in
//            switch accountStatus {
//            case .available:
//                print("iCloud Available")
//            case .noAccount:
//                print("No iCloud account")
//                let alert = UIAlertController(title: "iCloud Count", message: "Logue-se no iCloud", preferredStyle: .alert)
//                let confirmAction = UIAlertAction(title: "Fazer", style: .default, handler: nil)
//                alert.addAction(confirmAction)
//                self.present(alert, animated: true, completion: nil)
//            case .restricted:
//                print("iCloud restricted")
//            case .couldNotDetermine:
//                print("Unable to determine iCloud status")
//            }
//        }
//    }
//
//    @objc func queryDataBase() {
//        var query = CKQuery(recordType: "Note", predicate: NSPredicate(value: true))
//
//        if isFiltering(){
//            query = CKQuery(recordType: "Note", predicate: NSPredicate(format: "content contains[c] %@", searchController.searchBar.text!))
//        } else {
//            query = CKQuery(recordType: "Note", predicate: NSPredicate(value: true))
//        }
//
//        dataBase.perform(query, inZoneWith: nil) { (records, _) in
//            guard let records = records else { return }
//            let sortedRecords = records.sorted(by: { $0.creationDate! > $1.creationDate!})
//            self.notes = sortedRecords
//            DispatchQueue.main.async {
//                self.tableView.refreshControl?.endRefreshing()
//                self.tableView.reloadData()
//            }
//        }
//    }
//
//
//}
//
//extension ViewController: UITableViewDataSource, UITableViewDelegate {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        //        if isFiltering() {
//        //            return filteredsNotes.count
//        //        }
//        //
//        //        return notesString.count
//        return notes.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell()
//        cell.textLabel?.text = notes[indexPath.row].value(forKey: "content") as! String
//        return cell
//        //let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
//        //        let note: String
//        //        if isFiltering() {
//        //            note = filteredsNotes[indexPath.row]
//        //        } else {
//        //            note = notesString[indexPath.row]
//        //        }
//        //        cell.textLabel!.text = note
//        //        //cell.detailTextLabel!.text = candy.category -> Pode ser o autor
//        //        return cell
//    }
//
//    func isFiltering() -> Bool {
//        return searchController.isActive && !searchBarIsEmpty()
//    }
//}
//
//extension ViewController: UISearchResultsUpdating {
//    // MARK: - UISearchResultsUpdating Delegate
//    func updateSearchResults(for searchController: UISearchController) {
//        // TODO
//        //filterContentForSearchText(searchController.searchBar.text!)
//        self.queryDataBase()
//    }
//
//    // MARK: - Private instance methods
//    func searchBarIsEmpty() -> Bool {
//        // Returns true if the text is empty or nil
//        return searchController.searchBar.text?.isEmpty ?? true
//    }
//
//    //    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
//    //        filteredsNotes = notesString.filter({( note : String) -> Bool in
//    //            return note.lowercased().contains(searchText.lowercased())
//    //        })
//    //
//    //        tableView.reloadData()
//    //    }
//}
//
//extension ViewController: UISearchBarDelegate {
//    // MARK: - UISearchBar Delegate
//    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
//        self.queryDataBase()
//        //filterContentForSearchText(searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
//    }
//
//}
//
