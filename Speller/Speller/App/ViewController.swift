//
//  ViewController.swift
//  Speller
//
//  Created by Julia Nikitina on 07.05.2018.

import UIKit

class ViewController: UIViewController {

     var textField: TextField!
     var label: UILabel!
     var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        createUI()
    }

    private func createUI() {
        createTextField()
        createLabel()
        createButton()
        createConstraints()
    }

    private func createTextField() {
        let textField = TextField()
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .white
        textField.placeholder = "Enter a word to check"
        view.addSubview(textField)
        self.textField = textField
    }
    
    private func createLabel() {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        view.addSubview(label)
        self.label = label
    }
    
    private func createButton() {
        let button = UIButton()
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.layer.cornerRadius = 20
        button.backgroundColor = .purple
        button.setTitle("Check word", for: .normal)
        button.contentEdgeInsets = UIEdgeInsetsMake(10, 20, 10, 20)
        
        view.addSubview(button)
        self.button = button
    }
    
    @objc private func buttonTapped() {
        guard let userText = textField?.text, !userText.isEmpty, !userText.latinCharactersOnly
        else {
            //shows entered text without checking it
            if let text = textField?.text, !text.isEmpty {
                label.text = "\(text) is not in the dictionary"
                textField.resignFirstResponder()
            }
            textField.clearsOnBeginEditing = true
            return
        }
        
        let letterCharacters = CharacterSet.letters
        let userTextCharacters = CharacterSet(charactersIn: userText)
        
        if letterCharacters.isSuperset(of: userTextCharacters) &&
            !userText.latinCharactersOnly {
            //string is valid
            
            let wordIsGood: Bool = check(userText)
            unload()
            
            var inTheDic = ""
            
            if wordIsGood {
                inTheDic = "in the dictionary"
            } else {
                inTheDic = "not in the dictionary"
            }
            
            label.text = "\(userText) is \(inTheDic)"
            textField.resignFirstResponder()
            
        } else {
            label.text = nil
            textField.clearsOnBeginEditing = true
            textField.resignFirstResponder()
            return
        }
    
    }
    
    private func createConstraints() {
        let views: [UIView] = [textField, label, button]
        
        for item in views {
            item.translatesAutoresizingMaskIntoConstraints = false
        }
        
        let constraints = [
            textField.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            textField.heightAnchor.constraint(equalToConstant: 45),
            label.topAnchor.constraint(equalTo: (textField?.bottomAnchor)!, constant: 30),
            label.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            button.topAnchor.constraint(equalTo: (label?.bottomAnchor)!, constant: 30),
            button.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
   
}














