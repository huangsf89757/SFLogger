//
//  SFLogger.swift
//  SFLogger
//
//  Created by hsf on 2024/7/12.
//

import Foundation
// Third
import SwiftyBeaver

public typealias Log = SwiftyBeaver

public class SFLogger {
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
