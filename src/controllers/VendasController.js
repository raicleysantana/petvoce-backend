const Sequelize = require('sequelize');
const {QueryTypes} = require('sequelize');
const db = require("../db");
const Vendas = require("../models/Vendas");
const VendasProdutos = require("../models/VendasProdutos");
const ProdutosServicos = require("../models/ProdutosServicos");

module.exports = {
    async index(req, res) {
    },

    async venda(req, res) {
        const {cli_id, ps_id, vp_quantidade, opc} = req.query;

        var vendas = "";
        var produtos_servicos = "";
        var vendas_produtos = "";

        vendas = await Vendas.findOne({where: {cli_id, ven_situacao: "AGUARDANDO"}});

        if (!vendas) {
            vendas = await Vendas.create({cli_id});
        }

        //if (ps_id) {
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
                case "remove":
                    vendas_produtos = await VendasProdutos.destroy({
                        where: {vp_chave: chave},
                    });
                    break;
                default:
                    vendas_produtos = await VendasProdutos.update({
                        vp_quantidade,
                    }, {where: {vp_chave: chave}});
            }


            /*switch (opc) {
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
            }*/
        }
        //}


        return res.json(vendas_produtos);
    },

    async detalhes(req, res) {
        const {cli_id} = req.body;

        var sql = "SELECT SUM(vp.vp_valor_unitario * vp_quantidade) as total FROM vendas v\n " +
            " INNER JOIN vendas_produtos vp ON vp.ven_id = v.ven_id\n" +
            " INNER JOIN produtos_servicos ps ON ps.ps_id = vp.ps_id\n" +
            " WHERE v.cli_id = " + cli_id + " AND v.ven_situacao = 'AGUARDANDO'";

        const vendas = await db.query(sql, {type: QueryTypes.SELECT});
        return res.json(vendas[0]);
    },

    async pagar(req, res) {
        const {cli_id, total, fp_id} = req.body;

        const venda = Vendas.update({
            ven_situacao: "PAGO",
            ven_total: total,
            ven_forma_pagamento: fp_id

        }, {
            where: {cli_id}
        });

        return res.json(venda);
    },

    async vendas_pagas(req, res) {
        const {cli_id} = req.body;

        const vendas = await Vendas.findAll({
            where: {cli_id, ven_situacao: "PAGO"},
        });

        return res.json(vendas);
    }
}
