class BeatTimer {
    private var eventTick: EventTickHandler
    private var beatCount: Int = 0
    private var isCounting: Bool = false
    
    init(eventTick: EventTickHandler) {
        self.eventTick = eventTick
    }
    
    private var beatTimer: Timer? = nil {
        willSet {
            beatTimer?.invalidate()
        }
    }
    
    func startBeatTimer(bpm: Int) {
        stopBeatTimer()
        let timerIntervallInSamples = 60 / Double(bpm)
        
        beatTimer = Timer.scheduledTimer(withTimeInterval: timerIntervallInSamples, repeats: true) { [weak self] timer in
            guard let self = self else { return }
            self.eventTick.send(res: true)
            
            if self.isCounting {
                self.beatCount += 1                
            }
        }
    }
    
    func stopBeatTimer() {
        guard beatTimer != nil else { return }
        beatTimer?.invalidate()
        beatTimer = nil
    }
    
    func handleStateChange(isStart: Bool, isEnd: Bool) {
        if isStart {
            isCounting = true
            beatCount = 0
        }
        
        if isEnd && isCounting {
            isCounting = false
        }
    }
    
    private func resetCount() {
        beatCount = 0
        isCounting = false
    }

    // 현재 카운트 값을 반환하는 프로퍼티 추가
    var currentCount: Int {
        return beatCount
    }
    
    // 카운팅 중인지 여부를 반환하는 프로퍼티 추가
    var isCountingActive: Bool {
        return isCounting
    }
}
