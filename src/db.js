require("dotenv/config");

const Sequelize = require("sequelize");

const sequelize = new Sequelize(
	process.env.DB,
	process.env.USER,
	process.env.PASSWORD,
	{
		host: process.env.HOST,
		dialect: "mysql",
		define: {
			defaultScope: {
				attributes: {
					exclude: ["created_at", "updated_at"],
				},
			},
		},
	}
);

sequelize
	.authenticate()
	.then(() => {
		console.log("Conexão com o banco de dados realizado com sucesso!");
	})
	.catch((error) => {
		console.log("Error de conexão com banco de dados: " + error);
	});

module.exports = sequelize;
