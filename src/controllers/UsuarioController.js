const db = require("../db");
const Usuario = require("../models/Usuario");

module.exports = {
    async index(req, res) {
        const usuarios = await Usuario.findAll();
        return res.json(usuarios);
    },

    async login(req, res) {

        const {usuario, senha} = req.body;

        const response = await Usuario.findOne({
            where: {usu_usuario: usuario, usu_senha: senha}
        });

        return res.json(response);
    },

    async register(req, res) {

        var usuario = "";
        const dados = req.body;
        var codigo = dados.usu_id;
        delete dados.usu_id;

        if (codigo) {
            usuario = await Usuario.update(dados, {where: {usu_id: codigo}});
        } else {
            usuario = await Usuario.create(req.body);
        }

        return res.json(usuario);
    },

    async findOne(req, res) {
        const {id} = req.query;

        const usuario = await Usuario.findOne({where: {usu_id: id}});
        return res.json(usuario);
    },

    async delete(req, res) {
        const {id} = req.body;

        const response = await Usuario.destroy({
            where: {usu_id: id},
        });

        return res.json(response);
    }
}
