//
//  ListFlowViewModel.swift
//  week4concept
//
//  Created by 김미주 on 10/11/25.
//

import Foundation
import Combine

final class ListFlowViewModel: ObservableObject {
    @Published var items: [String] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    @Published private var reloadTick: Int = 0 // @Published의 Publisher
    private var bag = Set<AnyCancellable>()
    
    // MARK: - Init
    init() {
        $reloadTick
            .map { _ in
                Self.mockLoad()
                    .handleEvents(
                        receiveSubscription: { _ in self.isLoading = true }, // 요청 시작
                        receiveCompletion: { _ in self.isLoading = false }, // 요청 끝
                        receiveCancel: { self.isLoading = false } // 중간에 취소
                    )
            }
            .switchToLatest() // Published로부터 새 값이 갱신 -> 이전 값 전부 cancel -> 마지막 값만 기억 ==> 가장 최신 값으로 업데이트
            .receive(on: DispatchQueue.main) // Combine 체인의 마지막 부분은 메인 스레드에서 실행되도록 보장 (필수)
            .sink { [weak self] completion in // Publisher로부터 데이터를 최종 수신하는 Subscriber
                if case .failure(let e) = completion {
                    self?.errorMessage = e.localizedDescription
                }
            } receiveValue: { [weak self] values in // 성공적으로 데이터 도착했을 때 실행
                self?.errorMessage = nil
                self?.items = values
            }
            .store(in: &bag) // Combine에서는 구독을 유지하지 않으면 스트림 사라짐 -> AnyCancellable 인스턴스를 저장하여 구독 유지
    }
    
    // MARK: - Function
    func onReloadTap() { reloadTick &+= 1 }
    // &+= 오버플로우 허용 덧셈 => 오버플로우 시 크래시를 피하기 위해 사용
    // reloadTick 값이 바뀌면 $reloadTick Publisher가 새로운 이벤트를 방출 -> 데이터 새로고침 실행
    
    private static func mockLoad() -> AnyPublisher<[String], Error> {
        Deferred { // 구독이 일어날 때까지 Future 지연
            Future { promise in // Future: 한 번만 값을 내보내고 끝나는 Publisher
                DispatchQueue.global().asyncAfter(deadline: .now() + 0.5) {
                    promise(.success(["A", "B", "C"])) // 성공/실패 명시적 전달
                }
            }
        }
        .eraseToAnyPublisher() // 현재 퍼블리셔의 구체 타입 숨기기
    }
}
