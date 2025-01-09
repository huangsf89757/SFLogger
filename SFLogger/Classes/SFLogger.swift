//
//  SFLogger.swift
//  SFLogger
//
//  Created by hsf on 2024/7/12.
//

import Foundation
// Third
import SwiftyBeaver

// MARK: - SFLogger
public class SFLogger {
    // MARK: singleton
    public static let shared = SFLogger()
    private init() {
        addAppLifeCycleNotify()
        addSceneLifeCycleNotify()
    }
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    private var timeMap = [String: Date]()
}

// MARK: - config
extension SFLogger {
    public func config() {
        /*
         【format说明】
         $L: 日志级别词
         $M: 日志消息
         $T: 线程名称
         $N: 不带后缀的文件名
         $n: 带后缀的文件名
         $F: 函数名
         $l: 行号
         $D: 日期/时间(可自定义格式)
         $U: 运行时间
         $Z: UTC时区的日期/时间
         $C: 日志级别的颜色代码
         $c: 重置颜色
         $X: 上下文信息
         */
        
        let console = ConsoleDestination()
        console.levelString.verbose = "[V]"
        console.levelString.debug = "[D]"
        console.levelString.info = "[I]"
        console.levelString.warning = "[W]"
        console.levelString.error = "[E]"
        console.format = "$DMM/dd HH:mm:ss.SSSZ$d $C$L$c $N.$F:$l $M"
        SwiftyBeaver.addDestination(console)
        
        let file = FileDestination()
        file.levelString.verbose = "[V]"
        file.levelString.debug = "[D]"
        file.levelString.info = "[I]"
        file.levelString.warning = "[W]"
        file.levelString.error = "[E]"
        file.format = "$DMM/dd HH:mm:ss.SSSZ$d $C$L$c $N.$F:$l $M"
        SwiftyBeaver.addDestination(file)
    }
}

// MARK: - app life cycle
extension SFLogger {
    private static let appLifeCycleTag = "[App]"
    private func addAppLifeCycleNotify() {
        NotificationCenter.default.addObserver(self, selector: #selector(appDidEnterBackgroundNotification(_:)), name: UIApplication.didEnterBackgroundNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(appWillEnterForegroundNotification(_:)), name: UIApplication.willEnterForegroundNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(appDidFinishLaunchingNotification(_:)), name: UIApplication.didFinishLaunchingNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(appDidBecomeActiveNotification(_:)), name: UIApplication.didBecomeActiveNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(appWillResignActiveNotification(_:)), name: UIApplication.willResignActiveNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(appWillTerminateNotification(_:)), name: UIApplication.willTerminateNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(appDidReceiveMemoryWarningNotification(_:)), name: UIApplication.didReceiveMemoryWarningNotification, object: nil)
    }
    
    @objc private func appDidEnterBackgroundNotification(_ sender: Notification) {
        SFLogger.verbose(tag: Self.appLifeCycleTag, msgs: "didEnterBackground")
    }
    @objc private func appWillEnterForegroundNotification(_ sender: Notification) {
        SFLogger.verbose(tag: Self.appLifeCycleTag, msgs: "willEnterForeground")
    }
    @objc private func appDidFinishLaunchingNotification(_ sender: Notification) {
        SFLogger.verbose(tag: Self.appLifeCycleTag, msgs: "didFinishLaunching")
    }
    @objc private func appDidBecomeActiveNotification(_ sender: Notification) {
        SFLogger.verbose(tag: Self.appLifeCycleTag, msgs: "didBecomeActive")
    }
    @objc private func appWillResignActiveNotification(_ sender: Notification) {
        SFLogger.verbose(tag: Self.appLifeCycleTag, msgs: "willResignActive")
    }
    @objc private func appWillTerminateNotification(_ sender: Notification) {
        SFLogger.verbose(tag: Self.appLifeCycleTag, msgs: "willTerminate")
    }
    @objc private func appDidReceiveMemoryWarningNotification(_ sender: Notification) {
        SFLogger.verbose(tag: Self.appLifeCycleTag, msgs: "didReceiveMemoryWarning")
    }
}

// MARK: - scene life cycle
extension SFLogger {
    private static let sceneLifeCycleTag = "[Scene]"
    private func addSceneLifeCycleNotify() {
        NotificationCenter.default.addObserver(self, selector: #selector(sceneWillConnectNotification(_:)), name: UIScene.willConnectNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(sceneDidDisconnectNotification(_:)), name: UIScene.didDisconnectNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(sceneDidActivateNotification(_:)), name: UIScene.didActivateNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(sceneWillDeactivateNotification(_:)), name: UIScene.willDeactivateNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(sceneWillEnterForegroundNotification(_:)), name: UIScene.willEnterForegroundNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(sceneDidEnterBackgroundNotification(_:)), name: UIScene.didEnterBackgroundNotification, object: nil)
    }
    
    @objc private func sceneWillConnectNotification(_ sender: Notification) {
        SFLogger.verbose(tag: Self.sceneLifeCycleTag, msgs: "willConnect")
    }
    @objc private func sceneDidDisconnectNotification(_ sender: Notification) {
        SFLogger.verbose(tag: Self.sceneLifeCycleTag, msgs: "didDisconnect")
    }
    @objc private func sceneDidActivateNotification(_ sender: Notification) {
        SFLogger.verbose(tag: Self.sceneLifeCycleTag, msgs: "didActivate")
    }
    @objc private func sceneWillDeactivateNotification(_ sender: Notification) {
        SFLogger.verbose(tag: Self.sceneLifeCycleTag, msgs: "willDeactivate")
    }
    @objc private func sceneWillEnterForegroundNotification(_ sender: Notification) {
        SFLogger.verbose(tag: Self.sceneLifeCycleTag, msgs: "willEnterForeground")
    }
    @objc private func sceneDidEnterBackgroundNotification(_ sender: Notification) {
        SFLogger.verbose(tag: Self.sceneLifeCycleTag, msgs: "didEnterBackground")
    }
}

// MARK: - func
extension SFLogger {
    @discardableResult
    private static func custom(level: SwiftyBeaver.Level,
                               file: String = #file, function: String = #function, line: Int = #line, context: Any? = nil,
                               tag: String? = nil,
                               step: SFLogStep? = nil,
                               from log: SFLogInfo? = nil,
                               message: Any) -> SFLogInfo {
        var msgs = [Any]()
        // applicationState
        let msg_appState: String = {
            if Thread.isMainThread {
                return getAppState()
            } else {
                return DispatchQueue.main.sync {
                    getAppState()
                }
            }
        }()
        func getAppState() -> String {
            switch UIApplication.shared.applicationState {
            case .active:
                return "Ⓐ"
            case .inactive:
                return "⒤"
            case .background:
                return "🅑"
            @unknown default:
                return "🅄"
            }
        }
        msgs.append(msg_appState)
        // time
        if let time = log?.time {
            let distance = Date().timeIntervalSince(time)
            let msg_time = String(format: "%6.3f", distance)
            msgs.append(msg_time)
        }
        // tag
        if let tag = tag {
            msgs.append(tag)
        }
        // step
        if let step = step {
            msgs.append(step.desc)
        }
        // message
        msgs.append(message)
        
        SwiftyBeaver.custom(level: level,
                            message: msgs.map { String(describing: $0) }.joined(separator: " "),
                            file: file, function: function, line: line, context: context)
        return SFLogInfo()
    }
}

// MARK: - 可变参数版本
extension SFLogger {
    @discardableResult
    public static func verbose(file: String = #file, function: String = #function, line: Int = #line, context: Any? = nil,
                               tag: String? = nil,
                               step: SFLogStep? = nil,
                               from log: SFLogInfo? = nil,
                               msgs: Any...) -> SFLogInfo {
        let message = msgs.map { String(describing: $0) }.joined(separator: " ")
        return custom(level: .verbose,
                      file: file, function: function, line: line, context: context,
                      tag: tag,
                      step: step,
                      from: log,
                      message: message)
    }
    
    @discardableResult
    public static func debug(file: String = #file, function: String = #function, line: Int = #line, context: Any? = nil,
                             tag: String? = nil,
                             step: SFLogStep? = nil,
                             from log: SFLogInfo? = nil,
                             msgs: Any...) -> SFLogInfo {
        let message = msgs.map { String(describing: $0) }.joined(separator: " ")
        return custom(level: .debug,
                      file: file, function: function, line: line, context: context,
                      tag: tag,
                      step: step,
                      from: log,
                      message: message)
    }
    
    @discardableResult
    public static func info(file: String = #file, function: String = #function, line: Int = #line, context: Any? = nil,
                            tag: String? = nil,
                            step: SFLogStep? = nil,
                            from log: SFLogInfo? = nil,
                            msgs: Any...) -> SFLogInfo {
        let message = msgs.map { String(describing: $0) }.joined(separator: " ")
        return custom(level: .info,
                      file: file, function: function, line: line, context: context,
                      tag: tag,
                      step: step,
                      from: log,
                      message: message)
    }
    
    @discardableResult
    public static func warning(file: String = #file, function: String = #function, line: Int = #line, context: Any? = nil,
                               tag: String? = nil,
                               step: SFLogStep? = nil,
                               from log: SFLogInfo? = nil,
                               msgs: Any...) -> SFLogInfo {
        let message = msgs.map { String(describing: $0) }.joined(separator: " ")
        return custom(level: .warning,
                      file: file, function: function, line: line, context: context,
                      tag: tag,
                      step: step,
                      from: log,
                      message: message)
    }
    
    @discardableResult
    public static func error(file: String = #file, function: String = #function, line: Int = #line, context: Any? = nil,
                             tag: String? = nil,
                             step: SFLogStep? = nil,
                             from log: SFLogInfo? = nil,
                             msgs: Any...) -> SFLogInfo {
        let message = msgs.map { String(describing: $0) }.joined(separator: " ")
        return custom(level: .error,
                      file: file, function: function, line: line, context: context,
                      tag: tag,
                      step: step,
                      from: log,
                      message: message)
    }
    
    @discardableResult
    public static func critical(file: String = #file, function: String = #function, line: Int = #line, context: Any? = nil,
                                tag: String? = nil,
                                step: SFLogStep? = nil,
                                from log: SFLogInfo? = nil,
                                msgs: Any...) -> SFLogInfo {
        let message = msgs.map { String(describing: $0) }.joined(separator: " ")
        return custom(level: .critical,
                      file: file, function: function, line: line, context: context,
                      tag: tag,
                      step: step,
                      from: log,
                      message: message)
    }
    
    @discardableResult
    public static func fault(file: String = #file, function: String = #function, line: Int = #line, context: Any? = nil,
                             tag: String? = nil,
                             step: SFLogStep? = nil,
                             from log: SFLogInfo? = nil,
                             msgs: Any...) -> SFLogInfo {
        let message = msgs.map { String(describing: $0) }.joined(separator: " ")
        return custom(level: .fault,
                      file: file, function: function, line: line, context: context,
                      tag: tag,
                      step: step,
                      from: log,
                      message: message)
    }
    
    @discardableResult
    public static func custom(level: SwiftyBeaver.Level,
                              file: String = #file, function: String = #function, line: Int = #line, context: Any? = nil,
                              tag: String? = nil,
                              step: SFLogStep? = nil,
                              from log: SFLogInfo? = nil,
                              msgs: Any...) -> SFLogInfo {
        let message = msgs.map { String(describing: $0) }.joined(separator: " ")
        return custom(level: level,
                      file: file, function: function, line: line, context: context,
                      tag: tag,
                      step: step,
                      from: log,
                      message: message)
    }
}

// MARK: - SFLogStep
public enum SFLogStep {
    case begin
    case inProcess
    case success
    case failure
    
    var desc: String {
        switch self {
        case .begin:
            return "开始"
        case .inProcess:
            return "过程"
        case .success:
            return "成功"
        case .failure:
            return "失败"
        }
    }
}

// MARK: - SFLogInfo
public struct SFLogInfo {
    // MARK: var
    public let identifier = UUID()
    public let time = Date()
}
