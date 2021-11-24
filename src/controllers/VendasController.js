const Sequelize = require('sequelize');
const db = require("../db");
const Vendas = require("../models/Vendas");

module.exports = {
    async index(req, res) {

    },

    async addVenda(req, res) {
        const {cli_id} = req.query;
        var ven_id = "";

        const venda = await Vendas.findOne({where: {cli_id, ven_situacao: "AGUARDANDO"}});


        if (!venda) {
            await Vendas.create({cli_id})
                .then((venda) => {
                    ven_id = venda.ven_id;
                });
        } else {
            ven_id = venda.ven_id;
        }

        return res.json(venda);
    }
}
