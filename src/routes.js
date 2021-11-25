const {Router} = require('express');
const ProdutosServicosController = require('./controllers/ProdutosServicosController');
const ClienteController = require("./controllers/ClientesController");
const VendasController = require('./controllers/VendasController');
const VendasProdutosController = require('./controllers/VendasProdutosController');

const routes = Router();

routes.get("/", (req, res) => {
    return res.send("Inicio");
});

routes.get("/produtos-servicos", ProdutosServicosController.index);
routes.get("/produtos-servicos-list", ProdutosServicosController.list);
routes.get("/produto-servico", ProdutosServicosController.view);
routes.post("/login", ClienteController.login);
routes.post("/register-client", ClienteController.register);
routes.get("/cliente", ClienteController.findOne);
routes.get("/venda", VendasController.venda);
routes.get("/vendas-produtos", VendasProdutosController.index);

module.exports = routes;