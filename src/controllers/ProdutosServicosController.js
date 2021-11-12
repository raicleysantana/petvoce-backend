const ProdutosServicos = require('../models/ProdutosServicos');

module.exports = {
    async index(req, res) {
        const produtosServicos = await ProdutosServicos.findAll({
            where: { ps_situacao: '1' }
        });

        console.log(res.json(produtosServicos));
        return res.json(produtosServicos);
    },

    async view(req, res) {
        const { id } = req.query;
        const produtoServico = await ProdutosServicos.findOne({
            where: { ps_codigo: id },
        });

        return res.json(produtoServico);
    }


}
