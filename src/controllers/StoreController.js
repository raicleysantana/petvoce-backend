const Cadastros = require("../models/Cadastros");


module.exports = {
    async view(req, res) {
        const { id } = req.query;

        const Store = await Cadastros.findOne({
            where: { cad_id: id },
        });
      
        return res.json(Store);
    }
}