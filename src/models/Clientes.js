const Sequelize = require('sequelize');
const db = require('../db');

const Cliente = db.define("clientes", {
    cli_id: {
        type: Sequelize.INTEGER,
        autoIncrement: true,
        allowNull: false,
        primaryKey: true,
    },
    cli_nome: {
        type: Sequelize.STRING,
        allowNull: false,
    },
    cli_celular: {
        type: Sequelize.STRING,
        allowNull: false,
    },

    cli_email: {
        type: Sequelize.STRING,
        allowNull: true,
    },
    cli_endereco: {
        type: Sequelize.STRING,
        allowNull: true,
    },

    cli_situacao: {
        type: Sequelize.STRING,
        allowNull: false,
    },
}, {
    createdAt: false,
    updatedAt: false,
});

module.exports = Cliente;