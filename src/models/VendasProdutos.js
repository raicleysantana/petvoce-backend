const Sequelize = require('sequelize');
const db = require('../db');
const Clientes = require("./Clientes");
const ProdutosServicos = require("./ProdutosServicos");
const Vendas = require("./Vendas");

const VendasProdutos = db.define("vendas_produtos", {
    vp_id: {
        type: Sequelize.BIGINT,
        autoIncrement: true,
        allowNull: false,
        primaryKey: true,
    },

    vp_data_criacao: {
        type: Sequelize.DATE,
        allowNull: false,
        defaultValue: Sequelize.NOW,
    },

    cli_id: {
        type: Sequelize.BIGINT,
        allowNull: false,
    },

    vp_chave: {
        type: Sequelize.CHAR(100),
        allowNull: false,
    },

    ven_id: {
        type: Sequelize.BIGINT,
        allowNull: false,
    },

    ps_id: {
        type: Sequelize.BIGINT,
        allowNull: false,
    },

    vp_valor_unitario: {
        type: Sequelize.INTEGER,
        allowNull: false,
    },

    vp_quantidade: {
        type: Sequelize.INTEGER,
        allowNull: false,
    },

    vp_observacao: {
        type: Sequelize.TEXT,
        allowNull: true,
    },

}, {
    createdAt: false,
    updatedAt: false,
});

VendasProdutos.belongsTo(Clientes, {foreignKey: "cli_id", allowNull: false});
VendasProdutos.belongsTo(ProdutosServicos, {foreignKey: "ps_id", allowNull: false});
VendasProdutos.belongsTo(Vendas, {foreignKey: "ven_id", allowNull: false});

module.exports = VendasProdutos;