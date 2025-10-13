//
//  MovieDetailViewModel.swift
//  magabox
//
//  Created by 김미주 on 10/5/25.
//

import Foundation

@Observable
class MovieDetailViewModel {
    let detailModel: [MovieModel] = [
        .init(detailImage: .init(.imgDetailF1), titleKor: "F1 더 무비", titleEng: "F1: The Movie", description: "최고가 되지 못한 전설 VS 최고가 되고 싶은 루키\n\n한때 주목받는 유망주였지만 끔찍한 사고로 F1에서  우승하지 못하고  한순간에 추락한 드라이버 ‘손; 헤이스'(브래드 피트). 그의 오랜 동료인 ‘루벤 세르반테스'(하비에르 바르뎀)에게 레이싱 복귀를 제안받으며 최하위 팀인 APGXP에 합류한다.", age: "12세 이상 관람가", date: "2025.06.25")
    ]
}
