const connection = require("./connection");

const getAllinfoGame = async (jog_id) => {
    const query =
      "SELECT jog_titulo, jog_preco, jog_plataforma, jog_descricao FROM jogos WHERE jog_id = ?";
  
    const [InfoGame] = await connection.execute(query, [jog_id]);
    return InfoGame;
};

const getAllGame = async () => {
    try {
      const query = "SELECT jog_titulo, jog_preco FROM jogos";
  
      const [games] = await connection.execute(query);
      return games;
    } catch (error) {
      return res.status(500).json({ status: 7 });
    }
};

module.exports = {
    getAllGame,
    getAllinfoGame,
};