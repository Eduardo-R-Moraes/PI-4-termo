const models = require('../Models/modelLogin');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcrypt');

const login = async (req,res) => {
    try{

            const {email,senha} = req.body;

            const user = await models.login(email, senha);

            if (user == null) {
                return res.status(400).json({msg: 'Campos email e senha são obrigatórios'});
            }

            const hashSenha = user[0].usu_senha;

            const salt = await bcrypt.genSalt(12);
            const senhaCripto = await bcrypt.hash(hashSenha,salt);
            console.log(senhaCripto);

            const senhaCorreta = await bcrypt.compare(senha, hashSenha);  

            console.log(hashSenha);
            console.log(senha);

            console.log(senhaCorreta);

        if (senhaCorreta) {
            const token = jwt.sign(
                {
                    id: user[0].usu_id,
                    email: user[0].usu_email,
                    nome: user[0].usu_nome,
                },
                process.env.SECRET,
                {expiresIn: '1h'}
            ); 
            return res.status(200).json({msg: 'Login feito com sucesso!!!', token});
        } else {
            return res.status(400).json({msg: 'Email ou senha incorretos!!'});
        }
    } catch (error) {
        return res.status(500).json({msg: "Erro interno do servidor ao logar o usuário"});
    };
}

module.exports = {
    login,
};