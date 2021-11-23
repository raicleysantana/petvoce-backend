const { response } = require("express");
const db = require("../db");
const Cliente = require("../models/Clientes");

module.exports = {
    async index(req, res) {

    },

    async login(req, res) {

        const { usuario, senha } = req.body;

        const cliente = await Cliente.findOne({
            where: { cli_usuario: usuario, cli_senha: senha }
        });

        return res.json(cliente);
    },

    async register(req, res) {
        const cliente = await Cliente.create(req.body);
        return res.json(cliente);
    },

    async findOne(req, res) {
        const { id } = req.query;

        const cliente = await Cliente.findOne({ where: { cli_id: id } });
        return res.json(cliente);
    }
}
