const db = require('../db');
const Sequelize = require('sequelize');

const FormaPagamento = db.define('forma_pagamento', {
    fp_id: {
        type: Sequelize.INTEGER,
        autoIncrement: true,
        allowNull: false,
        primaryKey: true,
    },
    fp_descricao: {
        type: Sequelize.STRING,
        allowNull: false,
    },
    fp_situacao : {
        type: Sequelize.ENUM('0', '1'),
        defaultValue: '1'
    }
}, {
    freezeTableName: true,
    createdAt: false,
    updatedAt: false,
});

module.exports = FormaPagamento;