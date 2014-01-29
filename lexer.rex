class MisoLexer
macro
	DIGIT         \d+
	IDENT         [a-zA-Z_][a-zA-Z0-9_]*
	BLANK         [\ \t]+
	COMM_IN       \#
rule
	            {BLANK}

	# Keywords

	            role                    { [:ROLE, text] }
	            def                     { [:DEF, text] }

	# Comments

	            {COMM_IN}               { @state = :COMM; [:COMM_IN, text] }
	:COMM       .*$                     { @state = nil;   [:COMMENT, text] }


	# Other
	            \(                      { [:LPAREN, text] }
	            \)                      { [:RPAREN, text] }
	            \{                      { [:LCURLY, text] }
	            \}                      { [:RCURLY, text] }
	            {IDENT}                 { [:IDENTIFIER, text] }
	            .                       { [text, text] }
	            \n                      { [:NEWLINE, text] }
end
