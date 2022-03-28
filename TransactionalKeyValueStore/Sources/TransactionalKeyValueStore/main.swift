import TransactionalKeyValueStoreCore

let commandLineParser = CommandLineParser()

while true {
    if let line = readLine() {
        do {
            if let output = try parse(line, commandLineParser) {
                print(output)
            }
        } catch {
            
        }
    }
}

func parse(_ line: String, _ commandLineParser: CommandLineParser) throws -> String? {
    let args = line.components(separatedBy: " ")
    do {
        try commandLineParser.createCommand(args: args)
    } catch CommandLineParserError.noTransaction {
        return "no transactions" // We can localize the strings to support different languages
    } catch CommandLineParserError.keyNotSet {
        return "key not set"
    } catch CommandLineParserError.operationNotSupported {
        return "Operation not supported"
    }
    
    return nil
}
