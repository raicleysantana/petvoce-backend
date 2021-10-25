const { Router } = require('express');
const ProdutosServicosController = require('./controllers/ProdutosServicosController');
const ServiceController = require("./controllers/ServicesController");
const StoreController = require("./controllers/StoreController");

const routes = Router();
routes.get("/", (req, res) => {
    return res.send("Inicio");
});

routes.get("/produtos-servicos", ProdutosServicosController.index);
routes.get("/produto-servico", ProdutosServicosController.view);
routes.get("/tipo-servicos", ServiceController.index);
routes.get("/destaques", ServiceController.destaques);
routes.get("/store", StoreController.view);

module.exports = routes;