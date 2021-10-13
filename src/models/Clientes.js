const Sequelize = require('sequelize');
const db = require('../db');

const User = db.define("clientes", {
    codigo: {
        type: Sequelize.INTEGER,
        autoIncrement: true,
        allowNull: false,
        primaryKey: true,
    },
    nome: {
        type: Sequelize.STRING,
        allowNull: false,
    },
    telefone: {
        type: Sequelize.STRING,
        allowNull: false,
    },

    email: {
        type: Sequelize.STRING,
        allowNull: false,
    },

    situacao: {
        type: Sequelize.STRING,
        allowNull: false,
    },
});

module.exports = User;