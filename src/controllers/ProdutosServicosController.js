const ProdutosServicos = require('../models/ProdutosServicos');
const Cadastros = require('../models/Cadastros');

module.exports = {
    async index(req, res) {
        const produtosServicos = await ProdutosServicos.findAll({
            where: {ps_situacao: '1'}
        });

        return res.json(produtosServicos);
    },

    async view(req, res) {
        const {id} = req.query;
        const produtoServico = await ProdutosServicos.findOne({
            where: {ps_codigo: id},
            raw: false,
            include: [{
                model: Cadastros,
            }],
        });

        return res.json(produtoServico);
    }


}
