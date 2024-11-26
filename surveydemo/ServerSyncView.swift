import SwiftUI
import CouchbaseLiteSwift

struct ServerSyncView: View {
    @State private var showToast = false // 토스트 메시지 표시 여부

    var body: some View {
        VStack {
            Spacer()

            Text("Server Sync")
                .font(.largeTitle)
                .padding(.bottom, 40)
            
            Button(action: {
                syncData()
            }) {
                Text("Sync Data")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .shadow(radius: 2)
            }
            .padding(.horizontal, 40)
            
            Spacer()
        }
        .background(Color.white)
        .edgesIgnoringSafeArea(.all)
        .toast(isPresented: $showToast, message: "Sync Complete") // 토스트 메시지
    }
    
    // 데이터 동기화 함수
    func syncData() {
        do {
            let database = try Database(name: "survey")
            let collection = try database.createCollection(name: "survey", scope: "mobile")
            
            // 서버 엔드포인트 설정 (요청하신 URL로 수정)
            let target = URLEndpoint(url: URL(string: "ws://192.168.35.118:4985/travel-sample")!) //Sync_gateway가 설치된 서버 주소
            var replConfig = ReplicatorConfiguration(target: target)
            
            // 컬렉션 및 기본 충돌 해결 방식 추가
            replConfig.addCollection(collection)
            //Couchbase Server에서 생성한 User 정보 RestAPI "Authorization: Basic $DIGEST" 방식과 동일
            replConfig.authenticator = BasicAuthenticator(username: "investigator", password: "Passw0rd!")
            replConfig.replicatorType = .pushAndPull

            // 동기화 시작
            let replicator = Replicator(config: replConfig)
            replicator.start()

            replicator.addChangeListener { (change) in
                if let error = change.status.error as NSError? {
                    print("동기화 오류 발생: \(error.localizedDescription)")
                } else {
                    print("동기화 상태: \(change.status.activity) - 완료 문서 수: \(change.status.progress.completed) / 총 문서 수: \(change.status.progress.total)")
                }
            }
            
            // 동기화 완료 후 토스트 메시지 표시
            showToast = true
        } catch {
            print("동기화 실패: \(error.localizedDescription)")
        }
    }
}
