const db = require("../db");
const Usuario = require("../models/Usuario");

module.exports = {
    async index(req, res) {

    },

    async login(req, res) {

        const {usuario, senha} = req.body;

        const response = await Usuario.findOne({
            where: {usu_usuario: usuario, usu_senha: senha}
        });

        return res.json(response);
    },

    async register(req, res) {
        const usuario = await Usuario.create(req.body);
        return res.json(usuario);
    },

    async findOne(req, res) {
        const {id} = req.query;

        const usuario = await Usuario.findOne({where: {usu_id: id}});
        return res.json(usuario);
    }
}
