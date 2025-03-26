//
//  WorryView.swift
//  VannyVanny
//
//  Created by Apple Coding machine on 3/25/25.
//

import SwiftUI

struct WorryView: View {
    
    var viewModel: WorryViewModel
    
    init() {
        self.viewModel = .init()
    }
    
    var body: some View {
        ZStack {
            Image(.background)
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .aspectRatio(contentMode: .fill)
            
            VStack(content: {
                
                WorryViewContents(viewModel: viewModel)
                
                Spacer().frame(height: 40)

                
                HStack {
                    if viewModel.currentPage >= 1 {
                        CustomMainButton(buttonStyle: .cancel, action: {
                            viewModel.currentPageDown()
                        }, width: 180, height: 60)
                    }
                    
                    CustomMainButton(buttonStyle: viewModel.currentPage < 3 ? .next : .ok, action: {
                        viewModel.currentPageUP()
                    }, width: 180, height: 60)
                    
                }
            })
            .safeAreaPadding()
        }
    }
}

#Preview {
    WorryView()
}
