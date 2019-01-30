//
//  BaseViewController.swift
//  Propoma
//
//  Created by Alysson Moreira on 29/01/19.
//  Copyright © 2019 Mateus Sales. All rights reserved.
//

import UIKit
import CloudKit
class BaseViewController: UIViewController {

    var bbiCreate = UIBarButtonItem()
    
    @IBOutlet weak var tableView: UITableView!
    
    var mode: ControllerMode?
    
    var notes: [String] = ["Ela é puro extase", "Temos Todo o Tempo do mundo", "Sempre em frent"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.register(UINib(nibName: "PhraseTableViewCell", bundle: nil), forCellReuseIdentifier: "PhraseCell")
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let mode = self.mode {
            
            if mode.canCreate {
                self.bbiCreate = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapBbiCreate(_:)))
                self.navigationItem.rightBarButtonItem = self.bbiCreate
            }
            //            self.navigationController?.navigationBar.topItem?.title = mode.title
            //            self.title = mode.title
            
            print("Mode Title: \(mode.title)")
            self.navigationItem.title = mode.title
            //self.navigationController?.navigationBar.topItem?.title = mode.title
            
            
        }
    }
    
    
    @objc func didTapBbiCreate(_ sender: Any) {
        performSegue(withIdentifier: "CreateSegue", sender: nil)
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension BaseViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhraseCell", for: indexPath) as! PhraseTableViewCell
        
        cell.indexPath = indexPath
        
        cell.lbPhrase.text = self.notes[indexPath.row]
        
        cell.mode = self.mode
        cell.delegate = self
        
        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.isSelected = false
    }
    
    
}

extension BaseViewController: PhraseCellDelegate {
    
    func phraseDidTapFavorite(indepath: IndexPath) {
        
    }
    
    func phraseDidTapShare(indexPath: IndexPath) {
        
    }
    
    
    
    
}
