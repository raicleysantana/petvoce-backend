const Sequelize = require('sequelize');
const db = require("../db");
const Vendas = require("../models/Vendas");
const VendasProdutos = require("../models/VendasProdutos");
const ProdutosServicos = require("../models/ProdutosServicos");

module.exports = {
    async index(req, res) {

    },

    async venda(req, res) {
        const {cli_id, ps_id, opc} = req.query;

        var vendas = "";
        var produtos_servicos = "";
        var vendas_produtos = "";

        vendas = await Vendas.findOne({where: {cli_id, ven_situacao: "AGUARDANDO"}});

        if (!vendas) {
            vendas = await Vendas.create({cli_id});
        }
        if (ps_id) {
            var chave = cli_id + vendas.ven_id + ps_id;

            vendas_produtos = await VendasProdutos.findOne({where: {vp_chave: chave}});

            if (!vendas_produtos) {
                produtos_servicos = await ProdutosServicos.findOne({where: {ps_id}});

                vendas_produtos = await VendasProdutos.create({
                    vp_chave: chave,
                    ps_id,
                    cli_id,
                    vp_valor_unitario: produtos_servicos.ps_valor,
                    ven_id: vendas.ven_id,
                    vp_quantidade: 1,
                });
            } else {
                switch (opc) {
                    case "mais":
                        vendas_produtos = await VendasProdutos.update({
                            vp_quantidade: Sequelize.literal('vp_quantidade + 1')
                        }, {where: {vp_chave: chave}});
                        break;

                    case "menos":
                        if (vendas_produtos.vp_quantidade == 1) {
                            vendas_produtos = await VendasProdutos.destroy({
                                where: {vp_chave: chave},
                            });
                        } else {
                            vendas_produtos = await VendasProdutos.update({
                                vp_quantidade: Sequelize.literal('vp_quantidade - 1')
                            }, {where: {vp_chave: chave}});
                        }
                        break;
                }
            }
        }


        return res.json(vendas_produtos);
    }
}
