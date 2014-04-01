shared void debug(Anything message){
	if (active) {dynamic {
		console.debug(message);
	}}
}


shared void info(Anything message){
	if (active)  {
		dynamic {
			console.info(message);
	}}
}

shared void log(Anything message){
	if (active) {
		dynamic {
			console.log(message);
	}}
}

variable Boolean active = false;