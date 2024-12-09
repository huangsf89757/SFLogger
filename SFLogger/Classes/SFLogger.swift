//
//  SFLogger.swift
//  SFLogger
//
//  Created by hsf on 2024/7/12.
//

import Foundation
// Third
import SwiftyBeaver

open class SFLogger {
    public static func config() {
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
        console.format = "$Dyyyy-MM-dd HH:mm:ss.SSSSSSZ$d $C$L$c $N.$F:$l - $M"
        SwiftyBeaver.addDestination(console)
        
        let file = FileDestination()
        file.levelString.verbose = "[V]"
        file.levelString.debug = "[D]"
        file.levelString.info = "[I]"
        file.levelString.warning = "[W]"
        file.levelString.error = "[E]"
        file.format = "$Dyyyy-MM-dd HH:mm:ss.SSSSSSZ$d $C$L$c $N.$F:$l - $M"
        SwiftyBeaver.addDestination(file)
    }
}

// MARK: - 可变参数版本
extension SFLogger {
    public class func verbose(file: String = #file, function: String = #function, line: Int = #line, context: Any? = nil,
                              messages: Any...) {
        let message = messages.map { String(describing: $0) }.joined(separator: " ")
        SwiftyBeaver.verbose(message, file: file, function: function, line: line, context: context)
    }
    public class func debug(file: String = #file, function: String = #function, line: Int = #line, context: Any? = nil,
                            messages: Any...) {
        let message = messages.map { String(describing: $0) }.joined(separator: " ")
        SwiftyBeaver.debug(message, file: file, function: function, line: line, context: context)
    }
    public class func info(file: String = #file, function: String = #function, line: Int = #line, context: Any? = nil,
                           messages: Any...) {
        let message = messages.map { String(describing: $0) }.joined(separator: " ")
        SwiftyBeaver.info(message, file: file, function: function, line: line, context: context)
    }
    public class func warning(file: String = #file, function: String = #function, line: Int = #line, context: Any? = nil,
                              messages: Any...) {
        let message = messages.map { String(describing: $0) }.joined(separator: " ")
        SwiftyBeaver.warning(message, file: file, function: function, line: line, context: context)
    }
    public class func error(file: String = #file, function: String = #function, line: Int = #line, context: Any? = nil,
                            messages: Any...) {
        let message = messages.map { String(describing: $0) }.joined(separator: " ")
        SwiftyBeaver.error(message, file: file, function: function, line: line, context: context)
    }
    public class func critical(file: String = #file, function: String = #function, line: Int = #line, context: Any? = nil,
                               messages: Any...) {
        let message = messages.map { String(describing: $0) }.joined(separator: " ")
        SwiftyBeaver.critical(message, file: file, function: function, line: line, context: context)
    }
    public class func fault(file: String = #file, function: String = #function, line: Int = #line, context: Any? = nil,
                            messages: Any...) {
        let message = messages.map { String(describing: $0) }.joined(separator: " ")
        SwiftyBeaver.fault(message, file: file, function: function, line: line, context: context)
    }
    public class func custom(level: SwiftyBeaver.Level,
                             file: String = #file, function: String = #function, line: Int = #line, context: Any? = nil,
                             messages: Any...) {
        let message = messages.map { String(describing: $0) }.joined(separator: " ")
        SwiftyBeaver.custom(level: level, message: message, file: file, function: function, line: line, context: context)
    }
}
