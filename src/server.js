const restify = require("restify");
const usersRoute = require("./routes/routes");
const server = restify.createServer();
server.use(restify.plugins.queryParser());
server.use(restify.plugins.bodyParser());
usersRoute(server);
module.exports = server;