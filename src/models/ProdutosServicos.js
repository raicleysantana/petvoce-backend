const Sequelize = require('sequelize');
const db = require('../db');
const Categorias = require('./Categorias');

const ProdutosServicos = db.define("produtos_servicos", {
    ps_id: {
        type: Sequelize.INTEGER,
        autoIncrement: true,
        allowNull: false,
        primaryKey: true,
    },
    ps_nome: {
        type: Sequelize.STRING,
        allowNull: false,
    },

    cat_id: {
        type: Sequelize.BIGINT,
        allowNull: false,
    },

    ps_tipo: {
        type: Sequelize.STRING,
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
        type: Sequelize.ENUM('0', '1'),
        allowNull: false,
        defaultValue: "1"
    },
}, {
    createdAt: false,
    updatedAt: false,
});

ProdutosServicos.belongsTo(Categorias, {foreignKey: 'cat_id', allowNull: true})

module.exports = ProdutosServicos;