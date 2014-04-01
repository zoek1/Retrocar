import ceylon.json { ... }
"Run the module `retrocar`."


native dynamic modgame (dynamic game) {
	dynamic {	
		/*dynamic sprite = game.sprite.create("human");
	 	sprite.position.x = game.width / 3;
	 	sprite.position.y = game.height / 3;
	 	game.add(sprite);
*/
		game.input.enable("keyboard");
	 	
	 	native dynamic jsmol = \iJSON.parse("{}");
	 	jsmol.sprite = game.sprite.create("human");
	 	jsmol.init = () {
	 		\ithis.sprite.position.x = game.width / 3;
	 		\ithis.sprite.position.y = game.width / 3;
	 		return false;
	 	};
		jsmol.update = () {
			if (game.input.key.\iLEFT_ARROW){
				\ithis.sprite.position.x = \ithis.sprite.position.x - 1;
				/*debug(\ithis.sprite.position.x);*/
			}else if(game.input.key.\iRIGHT_ARROW){
				\ithis.sprite.position.x = \ithis.sprite.position.x + 1;
			}else if (game.input.key.\iUP_ARROW){
				\ithis.sprite.position.y = \ithis.sprite.position.y - 1;
			}else if(game.input.key.\iDOWN_ARROW){
				\ithis.sprite.position.y = \ithis.sprite.position.y + 1;
			}
			return false;
		};

	
		native dynamic mol = game.molecule.define(jsmol);
		game.add(mol);
	}
	return true;
	
	
	//\ithis.sprite.position.x = game.width / 2;
	//\ithis.sprite.position.y = game.height / 2;
}   


shared void run() {
	active = true;
    log("Inicializando juego");

    dynamic {
        log("Inicializando molecula");
        Molecule(\iJSON.parse(
            Object {
            	"width" -> 320,
            	"height" -> 480,
            	"smooth"-> false,
            	"scale" -> 2,
            	"node" -> "wrapper",
            	"globals" -> Object { 
            			"debug" -> false}}.string))
            .sprite("human", "buhito.png")
            			//.ready(modgame);
            					.ready(modgame);
    		
	}
}