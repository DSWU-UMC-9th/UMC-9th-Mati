//
//  ContentView.swift
//  week2practice
//
//  Created by 김미주 on 9/28/25.
//

import SwiftUI

struct MovieView: View {
    @AppStorage("movieName") private var movieName: String = ""
    private var viewModel: MovieViewModel = .init()
    
    var body: some View {
        VStack(spacing: 56) {
            MovieCard(movieInfo: viewModel.movieModel[viewModel.currentIndex])
            
            leftRightChange
            
            settingMovie
            
            printAppStorageValue
        }
    }
    
    private var leftRightChange: some View {
        HStack(spacing: 61) {
            Button(action: {
                viewModel.previous()
            }) {
                Image(.left)
            }
            
            Text("영화 바꾸기")
                .font(.system(size: 20, weight: .regular))
            
            Button(action: {
                viewModel.next()
            }) {
                Image(.right)
            }
        }
        .padding(.horizontal, 22)
        .padding(.vertical, 17)
    }
    
    private var settingMovie: some View {
        Button(action: {
            movieName = viewModel.movieModel[viewModel.currentIndex].movieName
        }) {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.white)
                    .stroke(.black, lineWidth: 1)
                    .frame(width: 246, height: 65)
                
                Text("대표 영화로 설정")
                    .font(.system(size: 20, weight: .regular))
                    .foregroundStyle(.black)
            }
        }
    }
    
    private var printAppStorageValue: some View {
        VStack(spacing: 17) {
            Text("@AppStorage에 저장된 영화")
                .font(.system(size: 30, weight: .regular))
                .foregroundStyle(.black)
            
            Text("현재 저장된 영화 : \(movieName)")
                .font(.system(size: 20, weight: .regular))
                .foregroundStyle(.red)
        }
    }
}

#Preview {
    MovieView()
}
