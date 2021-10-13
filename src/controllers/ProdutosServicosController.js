const ProdutosServicos = require('../models/ProdutosServicos');

module.exports = {
    async index(req, res) {
        const produtosServicos = await ProdutosServicos.findAll();

        return res.json(produtosServicos);
    },

    async view(req, res) {
        const {id} = req.query;
        const produtoServico = await ProdutosServicos.findByPk(id);

        return res.json(produtoServico);
    }


}
