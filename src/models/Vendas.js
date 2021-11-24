const Sequelize = require('sequelize');
const db = require('../db');
const Clientes = require("./Clientes");

const Vendas = db.define("vendas", {
    ven_id: {
        type: Sequelize.BIGINT,
        autoIncrement: true,
        allowNull: false,
        primaryKey: true,
    },

    ven_data_criacao: {
        type: Sequelize.DATE,
        allowNull: false,
        defaultValue: Sequelize.NOW,
    },

    cli_id: {
        type: Sequelize.BIGINT,
        allowNull: false,
    },

    ven_data_venda: {
        type: Sequelize.DATE,
        allowNull: true,
    },

    ven_forma_pagamento: {
        type: Sequelize.INTEGER,
        allowNull: true,
    },

    ven_taxa_entrega: {
        type: Sequelize.DECIMAL(20, 2),
        allowNull: true,
    },

    ven_total: {
        type: Sequelize.DECIMAL(20, 2),
        allowNull: true,
    },

    ven_situacao: {
        type: Sequelize.ENUM('PAGO', 'PENDENTE', 'CANCELADO', 'AGUARDANDO'),
        defaultValue: 'AGUARDANDO'
    }
}, {
    createdAt: false,
    updatedAt: false,
});

Vendas.belongsTo(Clientes, {foreignKey: "cli_id", allowNull: false});

module.exports = Vendas;