const Sequelize = require('sequelize');
const db = require('../db');

const Cadastros = db.define("cadastros", {
    cad_id: {
        type: Sequelize.INTEGER,
        autoIncrement: true,
        allowNull: false,
        primaryKey: true,
    },
    cad_tipo: {
        type: Sequelize.STRING,
        allowNull: false,
    },

    cad_cpf_cnpj: {
        type: Sequelize.CHAR(20),
        allowNull: false,
    },

    cad_nome: {
        type: Sequelize.STRING(255),
    },

    cad_senha: {
        type: Sequelize.STRING(255),
    },

    cad_endereco: {
        type: Sequelize.STRING(255),
    },
    cad_email: {
        type: Sequelize.STRING(255),
    },

    cad_perfil: {
        type: Sequelize.TEXT,
    },

    cad_logo: {
        type: Sequelize.STRING(255),
    },

    cad_data: {
        type: Sequelize.STRING,
    },

    cad_situacao: {
        type: Sequelize.ENUM,
        values: ['0', '1'],
    }
}, {
    createdAt: false,
    updatedAt: false,

});

module.exports = Cadastros;