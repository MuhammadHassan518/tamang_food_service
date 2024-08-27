import SwiftUI

struct FeaturePartners: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State private var isNavigationActive = false
    @State private var selectedDestination: Destination?
    var data: [FeaturPartnerModel]
    var isComingFrom: ComingFrom
    var title = String()
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    NavigationLink(destination: NavigationHelper.destinationView(for: selectedDestination), isActive: $isNavigationActive, label: {
                        EmptyView()
                    })
                    
                    
                    //MARK: Navigation View
                    ZStack{
                        
                        Text(title)
                            .font(.customYuGothicfont(.semiBold, fontSize: 16))
                            .foregroundColor(Color.lightBlack2)
                        
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
                    }.padding(.top)
                    
                    
                    VStack {
                        ScrollView(.vertical, showsIndicators: false) {
                            VStack{
                                if isComingFrom == .searchView {
                                    HStack {
                                        Text("We have founds 80 results of \n \(title),s")
                                            .font(.customYuGothicfont(.regular, fontSize: 16))
                                            .foregroundColor(Color.lightBlack2)
                                        Button {
                                            mode.wrappedValue.dismiss()
                                        } label : {
                                            Text("Search Again")
                                                .font(.customYuGothicfont(.regular, fontSize: 17))
                                                .frame(width: 130, height: 30)
                                                .foregroundColor(Color.lightYellow)
                                                .padding(.trailing, -30)
                                        }
                                    }
                                    
                                }
                                
                                LazyVGrid(columns: columns) {
                                    ForEach(data, id: \.id) { restaurant in
                                        
                                        Button {
                                            selectedDestination = .resturentDetailView(restaurant: dummyFeatureRestaurants, featuredListData: featuredListItemDummyData[0], featuredListMostPopuData: featuredListItemDummyDataMostPopular[0], featuredListSeaFoodData: featuredListItemDummyDataSeaFood[0], restData: dummyRestourents[0])
                                            isNavigationActive = true
                                        }label: {
                                            FetureRestLisView(data: restaurant)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
        .navigationTitle("")
        .navigationBarBackButtonHidden()
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
    
}

#Preview {
    FeaturePartners(data: dummyFeatureRestaurants, isComingFrom: .searchView, title: "Burger")
}
