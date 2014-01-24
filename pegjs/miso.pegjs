{
  var ast = [];
}

start
	= Expressions

Expressions
	= Expression
	/ Expression Terminator

Expression
	= Call

Terminator
	= NEWLINE

Call
	= receiver:IDENTIFIER ", " method:IDENTIFIER {
		console.log("coucou");
	}

// Literal
//  = STRING


/**
 * Tokens
 */

NEWLINE
	= text:[\n]

IDENTIFIER
	= ident: [a-zA-Z]+ { return ident.join(""); }

