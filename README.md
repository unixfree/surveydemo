이 애플리케이션은 설문 조사를 수행하는 데모 앱 입니다.. <br>

**이 소스는 카우치베이스 DB, Sync Gateway, Couchbase Lite가 어떻게 동작하는지는 보여 주는 데모입니다.** <br>

![hybrid search demo](survey.png)

아래에 설명된 내용은 카우치베이스 DB, Sync Gateway는 **Linux**이고, Couchbase Lite(APP)는 **MacOS** 환경에서 구현한 내용입니다. 
<br>Windows나 Linux환경에서 테스트시에는 OS에 종속된 부분은 수정/보완하여 테스트 하십시오. <br>

이 소스는 **설치형 Couchbase** 를 사용하는 데모이며, <br>
**관리형 Couchbase(Capella)** 를 사용하는 경우에는 *surveydemo/ServerSyncView.swift* 파일에서 *URLEndpoint*를 아래와 같이 Capella AppService Endpoint와 Bucket으로 수정하면 됩니다. <br>

            // 서버 엔드포인트 설정 (요청하신 URL로 수정)
            let target = URLEndpoint(url: URL(string: "wss://xxxxxxxxxx.apps.cloud.couchbase.com:4984/travel-sample")!)
            var replConfig = ReplicatorConfiguration(target: target)

## 설치 및 구성 방법 <br>
데모의 자세한 구성 방법은 **[Mobile_Survey_Demo_v1.0.pdf]** 화일에 있습니다. <br>

[Mobile_Survey_Demo_v1.0.pdf]: https://github.com/unixfree/surveydemo/blob/main/Mobile_Survey_Demo_v1.0.pdf
