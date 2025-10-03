//
//  HomeViewModel.swift
//  magabox
//
//  Created by 김미주 on 10/4/25.
//

import Foundation

@Observable
class HomeViewModel {
    let movieModel: [MovieChartModel] = [
        .init(poster: .init(.imgMovieNoOtherChoice), title: "어쩔수가없다", count: "139만명"),
        .init(poster: .init(.imgMovieDemonSlayer), title: "극장판 귀멸의 칼날: 무한성편", count: "506만명"),
        .init(poster: .init(.imgMovieF1), title: "F1 더 무비", count: "515만명"),
        .init(poster: .init(.imgMovieMononoke), title: "모노노케 히메", count: "17만명"),
        .init(poster: .init(.imgMovieBoss), title: "보스", count: "5,269명"),
        .init(poster: .init(.imgMovieYadang), title: "야당: 익스텐디드 컷", count: "2.7만명"),
        .init(poster: .init(.imgMovieTheRoses), title: "더 로즈: 완벽한 이혼", count: "1.8만명")
    ]
    
    let comingSoonModel: [MovieChartModel] = []
    
    let feedModel: [MovieFeedModel] = [
        .init(image: .init(.imgMovieFeedMononoke), title: "9월, 메가박스의 영화들(1) - 명작들의 재개봉’", description: "<모노노케 히메>,<퍼펙트 블루>"),
        .init(image: .init(.imgMovieFeedFace), title: "메가박스 오리지널 티켓 Re.37 <얼굴>", description: "영화 속 양극적인 감정의 대비")
    ]
}
