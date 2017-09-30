const colorize = require('colorize')

class FunctionDispatcher {
    constructor(score, topScore, bottomRange, topRange,scoreLevel) {
	this.score = score
	this.topScore = topScore
	this.bottomRange = bottomRange 
	this.topRange = topRange
	this.scoreLevel = scoreLevel
	this.operations = [
	    {func:(a,b) => a + b, symbol:'plus'},
	    {func:(a,b) => a - b, symbol:'minus'},
	    {func:(a,b) => a * b, symbol:'times'},
	    {func:(a,b) => a / b, symbol:'divided by'},
	]
    }
    clear() {
	//console.log('\033c') 
    }
    askForOperator() {
	const done = () => {
	    console.log('Now that process.stdin is paused, there is nothing more to do.');
	    process.exit();
	}
	process.stdin.resume();
	process.stdin.setEncoding('utf8');
	var util = require('util');

	process.stdin.on('data', function (text) {
	    console.log('received data:', util.inspect(text));
	    if (text === 'quit\n') {
		done();
	    }
	});

    }
}
FunctionDispatcher.start();
