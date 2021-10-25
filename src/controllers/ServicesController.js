const Cadastros = require("../models/Cadastros");
const { Op } = require("sequelize");

module.exports = {
    async index(req, res) {
        const { type } = req.query;

        const destaques = await Cadastros.findAll({
            where: { cad_tipo: type }
        });

        return res.json(destaques);
    },

    async destaques(req, res) {
        const destaques = await Cadastros.findAll({
            where: { cad_tipo: { [Op.between]: ["cv", "ps"] } }
        });

        return res.json(destaques);
    }


}