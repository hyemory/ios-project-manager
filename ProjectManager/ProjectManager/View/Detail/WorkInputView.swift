//
//  WorkInputView.swift
//  ProjectManager
//
//  Created by Hyejeong Jeong on 2023/05/21.
//

import UIKit

final class WorkInputView: UIView {
    private let titleTextField: UITextField = {
        let textField = UITextField()
        
        textField.font = .preferredFont(forTextStyle: .body)
        textField.placeholder = "Title"
        textField.drawShadow()
        
        return textField
    }()
    
    private let deadlinePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        datePicker.locale = Locale(identifier: Locale.preferredLanguages.first ?? Locale.current.identifier)
        
        return datePicker
    }()
    
    private let bodyTextView: UITextView = {
        let textView = UITextView()
        
        textView.font = .preferredFont(forTextStyle: .body)
        textView.drawShadow()
        
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .systemBackground
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureLayout() {
        let stackView = createStackView()
        
        self.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            stackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8),
            stackView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -24),
            
            titleTextField.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    private func createStackView() -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: [titleTextField, deadlinePicker, bodyTextView])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        
        return stackView
    }
}

private extension UIView {
    func drawShadow() {
        self.backgroundColor = .systemBackground
        
        self.layer.cornerRadius = 4
        
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowOpacity = 0.4
        self.layer.shadowRadius = 4
        self.layer.masksToBounds = false
    }
}