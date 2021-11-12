const db = require('../db');
const Sequelize = require('sequelize');

const Categorias = db.define('categorias', {
    cat_id: {
        type: Sequelize.INTEGER,
        autoIncrement: true,
        allowNull: false,
        primaryKey: true,
    },
    cat_nome: {
        type: Sequelize.STRING,
        allowNull: false,
    },
});

module.exports = Categorias;