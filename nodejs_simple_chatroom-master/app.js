var app = require('express')();
var http = require('http').Server(app);
var io = require('socket.io')(http);

app.get('/', function(req, res){
	res.sendFile(__dirname + '/video.html');
});


app.get('/input', function(req, res){
	res.sendFile(__dirname + '/index.html');
});
var user_count = 0;

//當新的使用者連接進來的時候
io.on('connection', function(socket){

	//監聽新訊息事件
	socket.on('chat message', function(msg){
		console.log(msg);
		io.emit('chat message', msg);
	});

	//left
	socket.on('disconnect',function(){
		console.log(socket.username+" left.");
		io.emit('user left',{
			username:socket.username
		});
	});


});

//指定port
http.listen(3002, function(){
	console.log('listening on *:3002');
});