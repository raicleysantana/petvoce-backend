const { response } = require("express");
const db = require("../db");
const Cliente = require("../models/Clientes");

module.exports = {
    async index(req, res) {

    },

    async login(req, res) {
    
        const { username, password } = req.body;
        
        const cliente = await Cliente.findOne({
            where: { cli_usuario : username, cli_senha: password }
        });

        return res.json(cliente);
    }
}
