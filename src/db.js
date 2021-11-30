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


sequelize.authenticate().then(() => {
    console.log("Conexão com o banco de dados realizado com sucesso!");
}).catch((error) => {
    console.log("Error de conexão com banco de dados: " + error)
})

module.exports = sequelize;