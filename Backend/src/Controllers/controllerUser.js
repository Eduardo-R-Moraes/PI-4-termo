const models = require('../Models/modelUser')

const getAll = async(req,res) => {

    try {
        const users = await models.getAll();
        return res.status(200).json(users);
    } catch (error) {
        return res.status(500).json({msg: error.message});
    }
};

const createUser = async(req, res) => {

    try {
        
        const createUser = await models.createUser(req.body);
        return res.status(201).json(createUser);
    } catch (error) {
        return res.status(500).json({ status: 4 , error: error.message});
    }
    
};
const getUserById = async (req, res) => {
    try {
        const id = req.params.id;
        const [user] = await models.getAllInfoUser(id);
        if(!user){
            return res.status(500).json({ erro: "erro ao buscar por suas informações" });
        }
        return res.status(200).json(user);
    } catch (error) {
        return res.status(500).json({msg: error.message});
    }
};
/*
const getAllInfoUser = async (req, res) => {
    try {

        const usu_id = req.body.usu_id;
        console.log(usu_id)
        //const UserData = req.body;
        //UserData.user.usu_id = usu_id;
    
        const InfoUserList = await models.getAllInfoUser(usu_id);
    
        if(!InfoUserList.length){
            return res.status(500).json({ erro: "erro ao buscar por suas informações" });
        }
        const firstUser = InfoUserList[0]
        return res.status(200).json(firstUser);
    } catch (error) {
        return res.status(500).json({msg: error.message});
    }
};
*/

module.exports = {
    getAll,
    createUser,
    getUserById
};