//
//  File.swift
//  
//
//  Created by dlernatovich on 02.02.2021.
//

import Foundation

#if os(iOS)
import UIKit

/// Read Wrapper typealias
public typealias AFWrapperRead<T> = (_ defaults: UserDefaults, _ key: String) -> T?

/// Write Wrapper typealias
public typealias AFWrapperWrite<T> = (_ defaults: UserDefaults, _ key: String, _ value: T) -> Void
#endif
