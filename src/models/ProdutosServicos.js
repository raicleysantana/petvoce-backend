const Sequelize = require('sequelize');
const db = require('../db');

const ProdutosServicos = db.define("produtos_servicos", {
    ps_codigo: {
        type: Sequelize.INTEGER,
        autoIncrement: true,
        allowNull: false,
        primaryKey: true,
    },
    ps_nome: {
        type: Sequelize.STRING,
        allowNull: false,
    },
    cad_codigo: {
        type: Sequelize.BIGINT,
        allowNull: false,
    },

    cat_codigo: {
        type: Sequelize.BIGINT,
        allowNull: false,
    },

    ps_descricao: {
        type: Sequelize.TEXT,
        allowNull: false,
    },
    ps_foto: {
        type: Sequelize.STRING,
        allowNull: false,
    },
    ps_valor: {
        type: Sequelize.DECIMAL,
        allowNull: false,
    },
    ps_situacao: {
        type: Sequelize.STRING,
        allowNull: false,
    },
}, {
    createdAt: false,
    updatedAt: false,
});


module.exports = ProdutosServicos;