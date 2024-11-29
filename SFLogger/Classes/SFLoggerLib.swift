//
//  SFLib.swift
//  SFLogger
//
//  Created by hsf on 2024/11/23.
//

import Foundation
// Basic
import SFExtension

// MARK: - SFLoggerLib
public class SFLoggerLib: SFLib {
    public static var bundle: Bundle? = Bundle.sf.bundle(cls: SFLoggerLib.self, resource: nil)
}
