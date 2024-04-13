
// Converters.swift
// Auto-generated by SwiftParse
// See https://github.com/Fleli/SwiftParse

internal extension SLRNode {
    
    func convertToTopLevelStatements() -> TopLevelStatements {
        
        if children.count == 0 {
            return []
        }
        
        if children.count == 1 {
            return [children[0].convertToTopLevelStatement()]
        }
        
        if children.count == 2 {
            return children[0].convertToTopLevelStatements() + [children[1].convertToTopLevelStatement()]
        }
        
        if children.count == 3 {
            return children[0].convertToTopLevelStatements() + [children[2].convertToTopLevelStatement()]
        }
        
        fatalError()
        
    }
    
}
internal extension SLRNode {
    
    func convertToTypes() -> Types {
        
        if children.count == 0 {
            return []
        }
        
        if children.count == 1 {
            return [children[0].convertToType()]
        }
        
        if children.count == 2 {
            return children[0].convertToTypes() + [children[1].convertToType()]
        }
        
        if children.count == 3 {
            return children[0].convertToTypes() + [children[2].convertToType()]
        }
        
        fatalError()
        
    }
    
}
internal extension SLRNode {

	func convertToTopLevelStatement() -> TopLevelStatement {
		
        if type == "TopLevelStatement" && children[0].type == "FunctionDeclaration" {
            let nonTerminalNode = children[0].convertToFunctionDeclaration()
            return TopLevelStatement.functionDeclaration(nonTerminalNode)
        }
	
        fatalError()
        
    }

}

internal extension SLRNode {

	func convertToFunctionDeclaration() -> FunctionDeclaration {
		
		if type == "FunctionDeclaration" && children.count == 6 && children[0].type == "function" && children[1].type == "identifier" && children[2].type == "func" && children[3].type == "Type" && children[4].type == "->" && children[5].type == "Type" {
			let arg1 = children[1].convertToTerminal()
			let arg3 = children[3].convertToType()
			let arg5 = children[5].convertToType()
			return .init(arg1, arg3, arg5)
		}
		
		fatalError()
		
	}

}

internal extension SLRNode {

	func convertToType() -> `Type` {
		
		if type == "Type" && children.count == 1 && children[0].type == "int16" {
			let arg0 = children[0].convertToTerminal()
			return `Type`.builtin(arg0)
		}
	
		if type == "Type" && children.count == 4 && children[0].type == "ptr" && children[1].type == "(" && children[2].type == "Type" && children[3].type == ")" {
			let arg0 = children[0].convertToTerminal()
			let arg1 = children[1].convertToTerminal()
			let arg2 = children[2].convertToType()
			let arg3 = children[3].convertToTerminal()
			return `Type`.pointer(arg0, arg1, arg2, arg3)
		}
	
		if type == "Type" && children.count == 4 && children[0].type == "tuple" && children[1].type == "[" && children[2].type == "Types" && children[3].type == "]" {
			let arg0 = children[0].convertToTerminal()
			let arg1 = children[1].convertToTerminal()
			let arg2 = children[2].convertToTypes()
			let arg3 = children[3].convertToTerminal()
			return `Type`.tuple(arg0, arg1, arg2, arg3)
		}
	
		if type == "Type" && children.count == 4 && children[0].type == "func" && children[1].type == "Type" && children[2].type == "->" && children[3].type == "Type" {
			let arg0 = children[0].convertToTerminal()
			let arg1 = children[1].convertToType()
			let arg2 = children[2].convertToTerminal()
			let arg3 = children[3].convertToType()
			return `Type`.function(arg0, arg1, arg2, arg3)
		}
	
		fatalError()
	
	}
	
}


internal extension SLRNode {

    func convertToTerminal() -> String {
    
        if let token = self.token {
            return token.content
        }
        
        fatalError()
    
    }
    
}
