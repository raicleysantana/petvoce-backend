const Sequelize = require("sequelize");

const sequelize = new Sequelize("petvoce2", "root", "", {
    host: "localhost",
    dialect: "mysql",
    define: {
        defaultScope: {
            attributes: {
                exclude: ['created_at', 'updated_at']
            }
        }
    }
});

module.exports = sequelize;