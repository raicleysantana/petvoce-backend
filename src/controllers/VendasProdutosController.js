const Sequelize = require('sequelize');
const db = require("../db");
const VendasProdutos = require("../models/VendasProdutos");
const Vendas = require("../models/Vendas");
const Produtos = require("../models/ProdutosServicos");
const ProdutosServicos = require("../models/ProdutosServicos");

module.exports = {
    async index(req, res) {
        const {cli_id} = req.query;
        var vendas_produtos = "";

        vendas_produtos = await VendasProdutos.findAll({
            where: {cli_id, '$venda.ven_situacao$': 'AGUARDANDO'},
            include: [
                {
                    model: Vendas,
                },
                {
                    model: ProdutosServicos,
                }
            ],
        });
        return res.json(vendas_produtos);
    },
};