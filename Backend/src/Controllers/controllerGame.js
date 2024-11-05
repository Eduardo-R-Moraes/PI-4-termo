const models = require('../Models/modelGame')

const getAllGame = async(req,res) => {

    try {
        const games = await models.getAllGame();
        return res.status(200).json(games);
    } catch (error) {
        return res.status(500).json({msg: error.message});
    }
};

const getAllinfoGame = async (req, res) => {
    try {
        const id = req.params.id;
        const [InfoGame] = await models.getAllinfoGame(id);
        if(!InfoGame){
            return res.status(500).json({ erro: "erro ao buscar pelas informações do jogo" });
        }
        return res.status(200).json(InfoGame);
    } catch (error) {
        return res.status(500).json({msg: error.message});
    }
};

module.exports = {
    getAllGame,
    getAllinfoGame,
};