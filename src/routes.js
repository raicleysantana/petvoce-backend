const {Router} = require('express');
const ProdutosServicosController = require('./controllers/ProdutosServicosController');
const ServiceController = require("./controllers/ServicesController");

const routes = Router();
routes.get("/", (req, res) => {
    return res.send("Inicio");
});

routes.get("/produtos-servicos", ProdutosServicosController.index);
routes.get("/produto-servico", ProdutosServicosController.view);
routes.get("/destaques", ServiceController.index);

module.exports = routes;