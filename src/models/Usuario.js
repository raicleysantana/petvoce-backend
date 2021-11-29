const Sequelize = require('sequelize');
const db = require('../db');

const Usuario = db.define("usuario", {
    usu_id: {
        type: Sequelize.BIGINT,
        autoIncrement: true,
        allowNull: false,
        primaryKey: true,
    },

    usu_nome: {
        type: Sequelize.STRING(60),
        allowNull: false,
    },

    usu_usuario: {
        type: Sequelize.STRING(80),
        allowNull: false,
    },

    usu_senha: {
        type: Sequelize.STRING(100),
        allowNull: false,
    },

    usu_nivel_acesso: {
        type: Sequelize.ENUM('administrator', 'manager', 'user'),
        allowNull: false,
    },

    usu_situacao: {
        type: Sequelize.ENUM('0', '1'),
        allowNull: false,
        defaultValue: "1"
    },
}, {
    createdAt: false,
    updatedAt: false,
});

module.exports = Usuario;