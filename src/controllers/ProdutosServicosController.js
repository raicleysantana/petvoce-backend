const ProdutosServicos = require('../models/ProdutosServicos');
const Categorias = require("../models/Categorias");

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
            include: [{
                model: Categorias,
                required: true
            }],
            where: {ps_id: id},
        });

        return res.json(produtoServico);
    },

    async list(req, res) {
        const produtosServicos = await ProdutosServicos.findAll({
            where: {ps_situacao: '1'}
        });

        return res.json(produtosServicos);
    },

    async register(req, res) {

        var produto = "";
        const dados = req.body;
        var codigo = dados.ps_id;
        delete dados.ps_id;

        if (codigo) {
            produto = await ProdutosServicos.update(dados, {where: {ps_id: codigo}});
        } else {
            produto = await ProdutosServicos.create(req.body);
        }

        return res.json(produto);
    },


}
