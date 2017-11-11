var PROTO_PATH = __dirname + '/protos/ratingservice.proto';

var grpc = require('grpc');
var process = require('process');

var ratingService = grpc.load(PROTO_PATH).ratingService.RatingService;

function getRatingFactorByZip(call, callback) {
    callback(null, {ratingFactor: 2.05});
}

function main() {
    var server = new grpc.Server();
    server.addService(ratingService.service, {getRatingFactorByZip: getRatingFactorByZip});
    server.bind('0.0.0.0:' + process.env.RATING_SERVICE_PORT, grpc.ServerCredentials.createInsecure());
    server.start();
}

main();