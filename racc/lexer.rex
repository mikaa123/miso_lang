class MisoLexer
macro
	BLANK           [\ \t]+
rule
	{BLANK}
	\w+             { [:IDENTIFIER, text] }
	,               { [:COMMA, text] }
	\n              { [:NEWLINE, text] }
	\#              { [:HASHTAG, text] }
end
