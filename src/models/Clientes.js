const Sequelize = require('sequelize');
const db = require('../db');

const Cliente = db.define("clientes", {
    cli_id: {
        type: Sequelize.BIGINT,
        autoIncrement: true,
        allowNull: false,
        primaryKey: true,
    },

    cli_nome: {
        type: Sequelize.STRING(60),
        allowNull: false,
    },

    cli_celular: {
        type: Sequelize.STRING(20),
        allowNull: false,
    },

    cli_usuario: {
        type: Sequelize.STRING(80),
        allowNull: false,
    },

    cli_senha: {
        type: Sequelize.STRING(100),
        allowNull: false,
    },

    cli_email: {
        type: Sequelize.STRING(80),
        allowNull: false,
    },

    cli_endereco: {
        type: Sequelize.STRING(255),
        allowNull: true,
    },

    cli_situacao: {
        type: Sequelize.ENUM('0', '1'),
        allowNull: false,
        defaultValue: "1"
    },
}, {
    createdAt: false,
    updatedAt: false,
});

module.exports = Cliente;