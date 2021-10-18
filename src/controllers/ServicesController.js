const Cadastros = require("../models/Cadastros");

module.exports = {
    async index(req, res) {
        const {type} = req.query;

        const destaques = await Cadastros.findAll({
            where: {cad_tipo: type}
        });

        return res.json(destaques);
    }
}