var websocket = new WebSocket("ws://localhost:8787/Semi03_MultiChat/Chat/websocketendpoint");

var messageText = document.getElementById("messageText")
var messageTextArea = document.getElementById("messageTextArea");

webSocket.onopen = function(message){onOpen(message);};
webSocket.onclose = function(message){onClose(message);};
webSocket.onmessage = function(message){onMessage(message);};
webSocket.onerror = function(message){onError(message);};

function sendMessage(){
	websocket.send(messageText.value);
	messageText.value="";
}

function onOpen(message){messageTextArea.value += "Connected...\n";};

function onMessage(message){
	var jsonData = JSON.parse(message.data);
	if(jsonData.message != null){
		messageTextArea.value += jsonData.message;
	}
}

function onClose(message){messageTextArea.value += "Disconnect... \n";}

function onError(message){echoText.value += "Error.. \n";}

