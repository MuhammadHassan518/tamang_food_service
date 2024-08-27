//
//  OTPTextField.swift
//  TamangFoodService
//
//  Created by INVISION - 240 on 01/08/2024.
//

import SwiftUI


struct OTPTextField: View {
    
    @Binding var txtOTP: String
    @State var placeholder = "-"
    
    var body: some View {
        ZStack{
            
            
            HStack{
                
                Spacer()
                let otpCode = txtOTP.map{ String($0) }
                
                ForEach(0..<4) { index in
                    VStack{
                        
                        if( index < otpCode.count ) {
                            Text(otpCode[index])
                                .font(.customPoppinsfont(.bold, fontSize: 16))
                                .padding(15)
                        }else {
                            Text("")
                                .font(.customPoppinsfont(.bold, fontSize: 16))
                                .padding(15)
                        }
                        Divider()
                            .frame(height: 5)
                            .foregroundColor(Color.black)
                    }
                    .frame(width: 45, height: 50)
                }
                Spacer()
                
            }
            
            TextField("", text: $txtOTP)
                .keyboardType(.numberPad)
                .foregroundColor(.clear)
                .accentColor(.clear)
            
        }
    }
}
struct OTPTextField_Previews: PreviewProvider {
    
    @State static var txtCode = ""
    static var previews: some View {
        OTPTextField( txtOTP: $txtCode)
    }
}
