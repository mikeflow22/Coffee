//
//  AddOrderViewController.swift
//  Coffee
//
//  Created by Michael Flowers on 11/13/21.
//

import UIKit

class AddOrderViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var viewModel = AddCoffeeOrderViewModel()
    private var coffeeSizesSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        let email = self.emailTextField.text
        let name = self.nameTextField.text
        
        let selectedSize = self.coffeeSizesSegmentedControl.titleForSegment(at: self.coffeeSizesSegmentedControl.selectedSegmentIndex)
        
        guard let indexPath = self.tableView.indexPathForSelectedRow else {
            fatalError("Error in selecting coffee!")
        }
        
        self.viewModel.name = name
        self.viewModel.coffeeName = email
        self.viewModel.selectedSize = selectedSize
//        self.viewModel.selectedType = self.viewModel.
    }
    private func setupUI() {
        self.coffeeSizesSegmentedControl = UISegmentedControl(items: self.viewModel.sizes)
        self.coffeeSizesSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(self.coffeeSizesSegmentedControl)
        
        self.coffeeSizesSegmentedControl.topAnchor.constraint(equalTo: self.tableView.bottomAnchor, constant: 20).isActive = true
        
        self.coffeeSizesSegmentedControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.sizes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CoffeeSizeCell", for: indexPath)
        cell.textLabel?.text = self.viewModel.sizes[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }
}
