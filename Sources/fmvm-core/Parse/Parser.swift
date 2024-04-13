
// Parser.swift
// Auto-generated by SwiftSLR
// See https://github.com/Fleli/SwiftSLR

class SLRParser {

    private var index: Int = 0
    private var input: [Token] = []
    private var stack: [SLRNode] = []
    private var states: [() throws -> ()] = []
    
    private var accepted = false
    
    private var notExhausted: Bool { index < input.count }
    
    func parse(_ tokens: [Token]) throws -> SLRNode? {
        
        self.index = 0
        self.input = tokens
        
        self.accepted = false
        
        self.stack = []
        self.states = [state_0]
        
        repeat {
            
            try states[states.count - 1]()
            
        } while !accepted
        
        if stack.count != 1 {
            print(stack)
            return nil
        }
        
        return stack[0].children[0]
        
    }
    
    private func shift() {
        
        let token = input[index]
        let slrNode = SLRNode(token)
        stack.append(slrNode)
        index += 1
        
    }
    
    private func reduce(_ numberOfStates: Int, to nonTerminal: String) {
        
        let children = [SLRNode](stack[stack.count - numberOfStates ..< stack.count])
        
        let newNode = SLRNode(nonTerminal, children)
        
        stack.removeLast(numberOfStates)
        states.removeLast(numberOfStates)
        
        stack.append(newNode)
        
    }
    
    private func topOfStackIsToken(_ type: String) -> Bool {
        return topOfStackIsAmong([type])
    }
    
    private func topOfStackIsAmong(_ terminals: Set<String?>) -> Bool {
        
        guard notExhausted else {
            return terminals.contains(nil)
        }
        
        return terminals.contains(input[index].type)
        
    }
    
    private func topOfStackIsNonTerminal(_ type: String) -> Bool {
        
        guard stack.count > 0 else {
            return false
        }
        
        let top = stack[stack.count - 1]
        
        if top.token != nil {
            return false
        }
        
        return type == top.type
        
    }
    
    private func pushState(_ newState: @escaping () throws -> ()) {
        states.append(newState)
    }

	private func state_0() throws {

        if topOfStackIsNonTerminal("TopLevelStatements") {
            pushState(state_1)
            return
        }
        
        if topOfStackIsNonTerminal("FunctionDeclaration") {
            pushState(state_3)
            return
        }
        
        if topOfStackIsNonTerminal("TopLevelStatement") {
            pushState(state_26)
            return
        }
        
        if topOfStackIsToken("function") {
            shift()
            pushState(state_4)
            return
        }
        
        
        if topOfStackIsAmong([Optional("function"), nil]) {
            reduce(0, to: "TopLevelStatements")
            return
        }
        
        if index < input.count {
            throw ParseError.unexpected("TopLevelStatements", input[index].description, "reduction")
        } else {
            throw ParseError.abruptEnd("TopLevelStatements", "reduction")
        }
        
	}
	
	private func state_1() throws {

        if topOfStackIsNonTerminal("FunctionDeclaration") {
            pushState(state_3)
            return
        }
        
        if topOfStackIsNonTerminal("TopLevelStatement") {
            pushState(state_2)
            return
        }
        
        if topOfStackIsToken("function") {
            shift()
            pushState(state_4)
            return
        }
        
        
        if topOfStackIsAmong([nil]) {
            reduce(1, to: "SwiftSLRMain")
			accepted = true
            return
        }
        
        if index < input.count {
            throw ParseError.unexpected("TopLevelStatements", input[index].description, "TopLevelStatement")
        } else {
            throw ParseError.abruptEnd("TopLevelStatements", "TopLevelStatement")
        }
        
	}
	
	private func state_2() throws {

        
        if topOfStackIsAmong([Optional("function"), nil]) {
            reduce(2, to: "TopLevelStatements")
            return
        }
        
        if index < input.count {
            throw ParseError.unexpected("TopLevelStatements", input[index].description, "reduction")
        } else {
            throw ParseError.abruptEnd("TopLevelStatements", "reduction")
        }
        
	}
	
	private func state_3() throws {

        
        if topOfStackIsAmong([nil, Optional("function")]) {
            reduce(1, to: "TopLevelStatement")
            return
        }
        
        if index < input.count {
            throw ParseError.unexpected("TopLevelStatement", input[index].description, "reduction")
        } else {
            throw ParseError.abruptEnd("TopLevelStatement", "reduction")
        }
        
	}
	
	private func state_4() throws {

        if topOfStackIsToken("identifier") {
            shift()
            pushState(state_5)
            return
        }
        
        if index < input.count {
            throw ParseError.unexpected("FunctionDeclaration", input[index].description, "identifier")
        } else {
            throw ParseError.abruptEnd("FunctionDeclaration", "identifier")
        }
        
	}
	
	private func state_5() throws {

        if topOfStackIsToken("func") {
            shift()
            pushState(state_6)
            return
        }
        
        if index < input.count {
            throw ParseError.unexpected("FunctionDeclaration", input[index].description, "func")
        } else {
            throw ParseError.abruptEnd("FunctionDeclaration", "func")
        }
        
	}
	
	private func state_6() throws {

        if topOfStackIsNonTerminal("Type") {
            pushState(state_7)
            return
        }
        
        if topOfStackIsToken("func") {
            shift()
            pushState(state_21)
            return
        }
        
        if topOfStackIsToken("tuple") {
            shift()
            pushState(state_14)
            return
        }
        
        if topOfStackIsToken("int16") {
            shift()
            pushState(state_20)
            return
        }
        
        if topOfStackIsToken("ptr") {
            shift()
            pushState(state_10)
            return
        }
        
        if index < input.count {
            throw ParseError.unexpected("Type", input[index].description, "int16")
        } else {
            throw ParseError.abruptEnd("Type", "int16")
        }
        
	}
	
	private func state_7() throws {

        if topOfStackIsToken("->") {
            shift()
            pushState(state_8)
            return
        }
        
        if index < input.count {
            throw ParseError.unexpected("FunctionDeclaration", input[index].description, "->")
        } else {
            throw ParseError.abruptEnd("FunctionDeclaration", "->")
        }
        
	}
	
	private func state_8() throws {

        if topOfStackIsNonTerminal("Type") {
            pushState(state_9)
            return
        }
        
        if topOfStackIsToken("int16") {
            shift()
            pushState(state_20)
            return
        }
        
        if topOfStackIsToken("tuple") {
            shift()
            pushState(state_14)
            return
        }
        
        if topOfStackIsToken("func") {
            shift()
            pushState(state_21)
            return
        }
        
        if topOfStackIsToken("ptr") {
            shift()
            pushState(state_10)
            return
        }
        
        if index < input.count {
            throw ParseError.unexpected("Type", input[index].description, "int16")
        } else {
            throw ParseError.abruptEnd("Type", "int16")
        }
        
	}
	
	private func state_9() throws {

        
        if topOfStackIsAmong([nil, Optional("function")]) {
            reduce(6, to: "FunctionDeclaration")
            return
        }
        
        if index < input.count {
            throw ParseError.unexpected("FunctionDeclaration", input[index].description, "reduction")
        } else {
            throw ParseError.abruptEnd("FunctionDeclaration", "reduction")
        }
        
	}
	
	private func state_10() throws {

        if topOfStackIsToken("(") {
            shift()
            pushState(state_11)
            return
        }
        
        if index < input.count {
            throw ParseError.unexpected("Type", input[index].description, "(")
        } else {
            throw ParseError.abruptEnd("Type", "(")
        }
        
	}
	
	private func state_11() throws {

        if topOfStackIsNonTerminal("Type") {
            pushState(state_12)
            return
        }
        
        if topOfStackIsToken("func") {
            shift()
            pushState(state_21)
            return
        }
        
        if topOfStackIsToken("int16") {
            shift()
            pushState(state_20)
            return
        }
        
        if topOfStackIsToken("ptr") {
            shift()
            pushState(state_10)
            return
        }
        
        if topOfStackIsToken("tuple") {
            shift()
            pushState(state_14)
            return
        }
        
        if index < input.count {
            throw ParseError.unexpected("Type", input[index].description, "Type")
        } else {
            throw ParseError.abruptEnd("Type", "Type")
        }
        
	}
	
	private func state_12() throws {

        if topOfStackIsToken(")") {
            shift()
            pushState(state_13)
            return
        }
        
        if index < input.count {
            throw ParseError.unexpected("Type", input[index].description, ")")
        } else {
            throw ParseError.abruptEnd("Type", ")")
        }
        
	}
	
	private func state_13() throws {

        
        if topOfStackIsAmong([Optional(")"), Optional("]"), nil, Optional("->"), Optional("function"), Optional(",")]) {
            reduce(4, to: "Type")
            return
        }
        
        if index < input.count {
            throw ParseError.unexpected("Type", input[index].description, "reduction")
        } else {
            throw ParseError.abruptEnd("Type", "reduction")
        }
        
	}
	
	private func state_14() throws {

        if topOfStackIsToken("[") {
            shift()
            pushState(state_15)
            return
        }
        
        if index < input.count {
            throw ParseError.unexpected("Type", input[index].description, "[")
        } else {
            throw ParseError.abruptEnd("Type", "[")
        }
        
	}
	
	private func state_15() throws {

        if topOfStackIsNonTerminal("Types") {
            pushState(state_16)
            return
        }
        
        if topOfStackIsNonTerminal("Type") {
            pushState(state_25)
            return
        }
        
        if topOfStackIsToken("int16") {
            shift()
            pushState(state_20)
            return
        }
        
        if topOfStackIsToken("tuple") {
            shift()
            pushState(state_14)
            return
        }
        
        if topOfStackIsToken("ptr") {
            shift()
            pushState(state_10)
            return
        }
        
        if topOfStackIsToken("func") {
            shift()
            pushState(state_21)
            return
        }
        
        
        if topOfStackIsAmong([Optional(","), Optional("]")]) {
            reduce(0, to: "Types")
            return
        }
        
        if index < input.count {
            throw ParseError.unexpected("Type", input[index].description, "func")
        } else {
            throw ParseError.abruptEnd("Type", "func")
        }
        
	}
	
	private func state_16() throws {

        if topOfStackIsToken("]") {
            shift()
            pushState(state_17)
            return
        }
        
        if topOfStackIsToken(",") {
            shift()
            pushState(state_18)
            return
        }
        
        if index < input.count {
            throw ParseError.unexpected("Type", input[index].description, "]")
        } else {
            throw ParseError.abruptEnd("Type", "]")
        }
        
	}
	
	private func state_17() throws {

        
        if topOfStackIsAmong([Optional(")"), Optional("]"), nil, Optional("->"), Optional("function"), Optional(",")]) {
            reduce(4, to: "Type")
            return
        }
        
        if index < input.count {
            throw ParseError.unexpected("Type", input[index].description, "reduction")
        } else {
            throw ParseError.abruptEnd("Type", "reduction")
        }
        
	}
	
	private func state_18() throws {

        if topOfStackIsNonTerminal("Type") {
            pushState(state_19)
            return
        }
        
        if topOfStackIsToken("int16") {
            shift()
            pushState(state_20)
            return
        }
        
        if topOfStackIsToken("tuple") {
            shift()
            pushState(state_14)
            return
        }
        
        if topOfStackIsToken("ptr") {
            shift()
            pushState(state_10)
            return
        }
        
        if topOfStackIsToken("func") {
            shift()
            pushState(state_21)
            return
        }
        
        if index < input.count {
            throw ParseError.unexpected("Type", input[index].description, "tuple")
        } else {
            throw ParseError.abruptEnd("Type", "tuple")
        }
        
	}
	
	private func state_19() throws {

        
        if topOfStackIsAmong([Optional(","), Optional("]")]) {
            reduce(3, to: "Types")
            return
        }
        
        if index < input.count {
            throw ParseError.unexpected("Types", input[index].description, "reduction")
        } else {
            throw ParseError.abruptEnd("Types", "reduction")
        }
        
	}
	
	private func state_20() throws {

        
        if topOfStackIsAmong([Optional(")"), Optional("]"), nil, Optional("->"), Optional("function"), Optional(",")]) {
            reduce(1, to: "Type")
            return
        }
        
        if index < input.count {
            throw ParseError.unexpected("Type", input[index].description, "reduction")
        } else {
            throw ParseError.abruptEnd("Type", "reduction")
        }
        
	}
	
	private func state_21() throws {

        if topOfStackIsNonTerminal("Type") {
            pushState(state_22)
            return
        }
        
        if topOfStackIsToken("func") {
            shift()
            pushState(state_21)
            return
        }
        
        if topOfStackIsToken("tuple") {
            shift()
            pushState(state_14)
            return
        }
        
        if topOfStackIsToken("ptr") {
            shift()
            pushState(state_10)
            return
        }
        
        if topOfStackIsToken("int16") {
            shift()
            pushState(state_20)
            return
        }
        
        if index < input.count {
            throw ParseError.unexpected("Type", input[index].description, "ptr")
        } else {
            throw ParseError.abruptEnd("Type", "ptr")
        }
        
	}
	
	private func state_22() throws {

        if topOfStackIsToken("->") {
            shift()
            pushState(state_23)
            return
        }
        
        if index < input.count {
            throw ParseError.unexpected("Type", input[index].description, "->")
        } else {
            throw ParseError.abruptEnd("Type", "->")
        }
        
	}
	
	private func state_23() throws {

        if topOfStackIsNonTerminal("Type") {
            pushState(state_24)
            return
        }
        
        if topOfStackIsToken("ptr") {
            shift()
            pushState(state_10)
            return
        }
        
        if topOfStackIsToken("func") {
            shift()
            pushState(state_21)
            return
        }
        
        if topOfStackIsToken("tuple") {
            shift()
            pushState(state_14)
            return
        }
        
        if topOfStackIsToken("int16") {
            shift()
            pushState(state_20)
            return
        }
        
        if index < input.count {
            throw ParseError.unexpected("Type", input[index].description, "ptr")
        } else {
            throw ParseError.abruptEnd("Type", "ptr")
        }
        
	}
	
	private func state_24() throws {

        
        if topOfStackIsAmong([Optional(")"), Optional("]"), nil, Optional("->"), Optional("function"), Optional(",")]) {
            reduce(4, to: "Type")
            return
        }
        
        if index < input.count {
            throw ParseError.unexpected("Type", input[index].description, "reduction")
        } else {
            throw ParseError.abruptEnd("Type", "reduction")
        }
        
	}
	
	private func state_25() throws {

        
        if topOfStackIsAmong([Optional(","), Optional("]")]) {
            reduce(1, to: "Types")
            return
        }
        
        if index < input.count {
            throw ParseError.unexpected("Types", input[index].description, "reduction")
        } else {
            throw ParseError.abruptEnd("Types", "reduction")
        }
        
	}
	
	private func state_26() throws {

        
        if topOfStackIsAmong([Optional("function"), nil]) {
            reduce(1, to: "TopLevelStatements")
            return
        }
        
        if index < input.count {
            throw ParseError.unexpected("TopLevelStatements", input[index].description, "reduction")
        } else {
            throw ParseError.abruptEnd("TopLevelStatements", "reduction")
        }
        
	}
	

}

public enum ParseError: Error {
    case unexpected(_ nonTerminal: String, _ content: String, _ expected: String)
    case abruptEnd(_ nonTerminal: String, _ expected: String)
}

public class SLRNode: CustomStringConvertible {
    
    public let type: String
    public let children: [SLRNode]
    
    public let token: Token?
    
    public var description: String { "\(type)" }
    
    public func printFullDescription(_ indent: Int) {
        print(String(repeating: "|   ", count: indent) + type)
        for child in children {
            child.printFullDescription(indent + 1)
        }
    }
    
    init(_ type: String, _ children: [SLRNode]) {
        self.type = type
        self.children = children
        self.token = nil
    }
    
    init(_ token: Token) {
        self.type = token.type
        self.children = []
        self.token = token
    }
    
}

