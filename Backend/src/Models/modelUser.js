const connection = require("./connection");
const bcrypt = require("bcrypt");

class user {
  constructor(usu_nome, usu_email, usu_senha) {
    (this.usu_nome = usu_nome),
    (this.usu_email = usu_email),
    (this.usu_senha = usu_senha),
    (this.usu_adm = 0)
  }
}

const createUser = async (infoUser) => {
  const { usu_nome, usu_email, usu_senha, usu_adm } = infoUser;
 
  const query =
    "INSERT INTO usuarios (usu_nome , usu_email , usu_senha , usu_adm) VALUES (?, ?, ?, ?)";
  const newUser = new user(usu_nome, usu_email, usu_senha, usu_adm);

  const salt = await bcrypt.genSalt(12);
  const SenhaHash = await bcrypt.hash(usu_senha, salt);
  console.log(usu_nome ,usu_email, SenhaHash, usu_adm);

  const [createUser] = await connection.execute(query, [
    newUser.usu_nome,
    newUser.usu_email,
    SenhaHash,
    newUser.usu_adm,
  ]);
  console.log(createUser)
  return createUser;
};

const getAllInfoUser = async (usu_id) => {
  const query = "SELECT usu_nome, usu_email , usu_adm FROM usuarios WHERE usu_id = ?";

  const [InfoUser] = await connection.execute(query, [usu_id]);
  return InfoUser;
};

const getAll = async () => {
  try {
    const query = "SELECT * FROM usuarios";

    const [users] = await connection.execute(query);
    return users;
  } catch (error) {
    return res.status(500).json({ status: 7 });
  }
};

module.exports = {
  getAll,
  createUser,
  getAllInfoUser,
};