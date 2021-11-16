const ProdutosServicos = require('../models/ProdutosServicos');
const Categorias = require("../models/Categorias");

module.exports = {
    async index(req, res) {
        const produtosServicos = await ProdutosServicos.findAll({
            where: { ps_situacao: '1' }
        });

        return res.json(produtosServicos);
    },

    async view(req, res) {
        const { id } = req.query;
        const produtoServico = await ProdutosServicos.findOne({
            include: [{
                model: Categorias,
                required: true
            }],
            where: { ps_id: id },
        });

        return res.json(produtoServico);
    },

    async list(req, res) {
        const produtosServicos = await ProdutosServicos.findAll({
            where: { ps_situacao: '1' }
        });

        return res.json(produtosServicos);
    },


}
