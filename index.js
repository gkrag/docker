var http = require("http");
const port = 3000;

var requestHandler = (request, response) => {
    console.log(request.url);
    reponse.end('Ping !');
}

const server = http.createServer(requestHandler);

server.listen(port, (err) => {
    if(err){
        return console.log('Error occurred -' + err)
    }

    console.log('Server listening..');
});