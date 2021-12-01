const Categorias = require("../models/Categorias");

module.exports = {
    async index(req, res) {
        const categorias = await Categorias.findAll();

        return res.json(categorias);
    },
}
