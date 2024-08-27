//
//  PhoneNumber.swift
//  TamangFoodService
//
//  Created by INVISION - 240 on 01/08/2024.
//

import SwiftUI

struct PhoneNumber: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State private var phone: String = ""
    @State private var isNavigationActive = false
    @State private var selectedDestination: Destination?
    @State private var selectedCountryCode: String = "US"
    @State private var selectedPhoneCode: String = "+1"

    var body: some View {
        NavigationView {
            ZStack {
                NavigationLink(destination: NavigationHelper.destinationView(for: selectedDestination), isActive: $isNavigationActive) {
                    EmptyView()
                }
                
                VStack {
                    //MARK: Navigation View
                    ZStack {
                        Text("Login to Foodly Services")
                            .font(.customYuGothicfont(.semiBold, fontSize: 18))
                        HStack {
                            Button {
                                mode.wrappedValue.dismiss()
                            } label: {
                                Image("back")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                            }
                            .foregroundColor(.white)
                            .offset(x: 30)
                            Spacer()
                        }
                    }
                    
                    ScrollView {
                        VStack(spacing: 20) {
                            Text("Get started with Foodly")
                                .font(.customYuGothicfont(.semiBold, fontSize: 25))
                                .foregroundColor(Color.lightBlack2)
                                .padding(.top, 30)
                            
                            Text("Enter your phone number to use Foodly and enjoy your food :)")
                                .font(.customYuGothicfont(.regular, fontSize: 17))
                                .foregroundColor(Color.subTitle)
                                .multilineTextAlignment(.center)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal, 34)
                                .padding(.bottom, 24)
                            
                            VStack {
                                Text("PHONE NUMBER")
                                    .font(.customYuGothicfont(.light, fontSize: 14))
                                    .foregroundStyle(Color.lightBlack)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.horizontal, 34)
                                
                                HStack(spacing: 0) {
                                    NavigationLink(destination: CountryPickerView(selectedCountryCode: $selectedCountryCode, selectedPhoneCode: $selectedPhoneCode)) {
                                        HStack(spacing: 0) {
                                            Text(countryFlag(selectedCountryCode))
                                                .font(.system(size: 30))
                                            Image(systemName: "arrowtriangle.down.fill")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 10, height: 10)
                                                .foregroundStyle(Color.lightBlack)
                                                .padding(.trailing, 10)
                                        }
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.leading,50)
                                    }
                                    
                                    Text(selectedPhoneCode)
                                        .font(.customPoppinsfont(.regular, fontSize: 17))
                                        .foregroundStyle(Color.lightBlack2)
                                        .padding(.leading, -85)
                                    
                                    TextField("0123456789", text: $phone)
                                        .font(.customPoppinsfont(.regular, fontSize: 17))
                                        .foregroundStyle(Color.lightBlack2)
                                        .tint(Color.lightBlack)
                                        .padding(.leading, -50)
                                        .keyboardType(.decimalPad)
                                }
                            }
                            
                            Spacer().frame(height: 300)
                            
                            Button(action: {
                                isNavigationActive = true
                                selectedDestination = .otpView
                            }) {
                                BigYellowButton(buttonTitle: "SIGN UP", isBold: true)
                                    .padding(.horizontal, 34)
                            }
                        }
                    }
                }
            }
            .padding(.top, 20)
        }
        .edgesIgnoringSafeArea(.all)
        .navigationTitle("")
        .navigationBarBackButtonHidden()
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }

    func countryFlag(_ countryCode: String) -> String {
        guard countryCode.count == 2 else { return "" }
        let base: UInt32 = 127397
        var scalarView = String.UnicodeScalarView()
        for scalar in countryCode.uppercased().unicodeScalars {
            scalarView.append(UnicodeScalar(base + scalar.value)!)
        }
        return String(scalarView)
    }
}

#Preview {
    PhoneNumber()
}

struct CountryPickerView: View {
    @Binding var selectedCountryCode: String
    @Binding var selectedPhoneCode: String
    @Environment(\.presentationMode) var presentationMode
    
    let countryPhoneCodes: [String: String] = ["AF":"93","AL":"355","DZ":"213","US":"1","AD":"376","AO":"244","AI":"1","AG":"1","AR":"54","AM":"374","AW":"297","AU":"61","AT":"43","AZ":"994","BS":"1","BH":"973","BD":"880","BB":"1","BY":"375","BE":"32","BZ":"501","BJ":"229","BM":"1","BT":"975","BA":"387","BW":"267","BR":"55","IO":"246","BG":"359","BF":"226","BI":"257","KH":"855","CM":"237","CA":"1","CV":"238","KY":"345","CF":"236","TD":"235","CL":"56","CN":"86","CX":"61","CO":"57","KM":"269","CG":"242","CK":"682","CR":"506","HR":"385","CU":"53","CY":"537","CZ":"420","DK":"45","DJ":"253","DM":"1","DO":"1","EC":"593","EG":"20","SV":"503","GQ":"240","ER":"291","EE":"372","ET":"251","FO":"298","FJ":"679","FI":"358","FR":"33","GF":"594","PF":"689","GA":"241","GM":"220","GE":"995","DE":"49","GH":"233","GI":"350","GR":"30","GL":"299","GD":"1","GP":"590","GU":"1","GT":"502","GN":"224","GW":"245","GY":"595","HT":"509","HN":"504","HU":"36","IS":"354","IN":"91","ID":"62","IQ":"964","IE":"353","IL":"972","IT":"39","JM":"1","JP":"81","JO":"962","KZ":"77","KE":"254","KI":"686","KW":"965","KG":"996","LV":"371","LB":"961","LS":"266","LR":"231","LI":"423","LT":"370","LU":"352","MG":"261","MW":"265","MY":"60","MV":"960","ML":"223","MT":"356","MH":"692","MQ":"596","MR":"222","MU":"230","YT":"262","MX":"52","MC":"377","MN":"976","ME":"382","MS":"1","MA":"212","MM":"95","NA":"264","NR":"674","NP":"977","NL":"31","NC":"687","NZ":"64","NI":"505","NE":"227","NG":"234","NU":"683","NF":"672","MP":"1","NO":"47","OM":"968","PK":"92","PW":"680","PA":"507","PG":"675","PY":"595","PE":"51","PH":"63","PL":"48","PT":"351","PR":"1","QA":"974","RO":"40","RW":"250","WS":"685","SM":"378","SA":"966","SN":"221","RS":"381","SC":"248","SL":"232","SG":"65","SK":"421","SI":"386","SB":"677","ZA":"27","GS":"500","ES":"34","LK":"94","SD":"249","SR":"597","SZ":"268","SE":"46","CH":"41","TJ":"992","TH":"66","TG":"228","TK":"690","TO":"676","TT":"1","TN":"216","TR":"90","TM":"993","TC":"1","TV":"688","UG":"256","UA":"380","AE":"971","GB":"44","AS":"1","UY":"598","UZ":"998","VU":"678","WF":"681","YE":"967","ZM":"260","ZW":"263","BO":"591","BN":"673","CC":"61","CD":"243","CI":"225","FK":"500","GG":"44","VA":"379","HK":"852","IR":"98","IM":"44","JE":"44","KP":"850","KR":"82","LA":"856","LY":"218","MO":"853","MK":"389","FM":"691","MD":"373","MZ":"258","PS":"970","PN":"872","RE":"262","RU":"7","BL":"590","SH":"290","KN":"1","LC":"1","MF":"590","PM":"508","VC":"1","ST":"239","SO":"252","SJ":"47","SY":"963","TW":"886","TZ":"255","TL":"670","VE":"58","VN":"84","VG":"284","VI":"340"]


    
    var body: some View {
        List(NSLocale.isoCountryCodes, id: \.self) { countryCode in
            HStack {
                Text(countryFlag(countryCode))
                Text(Locale.current.localizedString(forRegionCode: countryCode) ?? "")
                Spacer()
                Text(countryPhoneCodes[countryCode] ?? "")
            }
            .onTapGesture {
                selectedCountryCode = countryCode
                selectedPhoneCode = countryPhoneCodes[countryCode] ?? ""
                presentationMode.wrappedValue.dismiss()
            }
        }
        .navigationTitle("Select Country")
    }
    
    func countryFlag(_ countryCode: String) -> String {
        guard countryCode.count == 2 else { return "" }
        let base: UInt32 = 127397
        var scalarView = String.UnicodeScalarView()
        for scalar in countryCode.uppercased().unicodeScalars {
            scalarView.append(UnicodeScalar(base + scalar.value)!)
        }
        return String(scalarView)
    }
}
