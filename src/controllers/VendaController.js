const { response } = require("express");
const Sequelize = require('sequelize');
const db = require("../db");
const Venda = require("../models/Venda");

module.exports = {
    async index(req, res) {

    },

    async addVenda(req, res) {
        const { cli_id } = req.query;

        const venda = await Venda.findAll({
            where: { cli_id }
        });

        return res.json(venda);
    }
}
