const {Router} = require('express');
const ProdutosServicosController = require('./controllers/ProdutosServicosController');

const routes = Router();
routes.get("/", (req, res) => {
    return res.send("Inicio");
});

routes.get("/produtos-servicos", ProdutosServicosController.index);
routes.get("/produto-servico", ProdutosServicosController.view);

module.exports = routes;