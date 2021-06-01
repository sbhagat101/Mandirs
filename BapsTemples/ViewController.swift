//
//  ViewController.swift
//  BapsTemples
//
//  Created by Shiv Bhagat on 5/25/21.
//
import SDWebImage
import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var result: Result?
    
    @IBOutlet var tableView : UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parseJSON()
        let nib = UINib(nibName: "CustomTableViewCell", bundle: nil)
        tableView?.register(nib, forCellReuseIdentifier: "CustomTableViewCell")
        tableView?.delegate = self
        tableView?.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = MapViewController(address: (result?.data[indexPath.row].address)!)
        vc.title = result?.data[indexPath.row].name
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return result?.data.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell",
                                                 for: indexPath) as! CustomTableViewCell
        cell.myLabel.text = result?.data[indexPath.row].name
        let urlString = (result?.data[indexPath.row].image)!
        cell.myimage.sd_setImage(with: URL(string: urlString), completed: nil)
        return cell
    }
    
    
    
    private func parseJSON() {
        guard let path = Bundle.main.path(forResource: "data", ofType: "json") else{
            return
        }
        let url = URL(fileURLWithPath: path)
        
        do {
            let jsonData = try Data(contentsOf: url)
            result = try JSONDecoder().decode(Result.self, from: jsonData)
        }
        catch {
            print("Error: \(error)")
        }
    }
    
    
}


