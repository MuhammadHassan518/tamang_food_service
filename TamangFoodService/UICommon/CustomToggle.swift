//
//  CustomToggle.swift
//  TamangFoodService
//
//  Created by INVISION - 240 on 19/08/2024.
//

import SwiftUI

struct CustomToggle: UIViewRepresentable {
    @Binding var isOn: Bool
    var onTintColor: UIColor =  UIColor(hex: "EEA734") ?? UIColor.systemYellow
    var offTintColor: UIColor = UIColor(hex: "868686") ?? UIColor.systemGray
    
    func makeUIView(context: Context) -> UISwitch {
        let toggleSwitch = UISwitch()
        toggleSwitch.addTarget(context.coordinator, action: #selector(Coordinator.toggleChanged), for: .valueChanged)
        return toggleSwitch
    }
    
    func updateUIView(_ uiView: UISwitch, context: Context) {
        uiView.isOn = isOn
        uiView.onTintColor = onTintColor
        uiView.tintColor = offTintColor
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject {
        var parent: CustomToggle
        
        init(_ parent: CustomToggle) {
            self.parent = parent
        }
        
        @objc func toggleChanged(_ sender: UISwitch) {
            parent.isOn = sender.isOn
        }
    }
}


#Preview {
    CustomToggle(isOn: .constant(true))
}
