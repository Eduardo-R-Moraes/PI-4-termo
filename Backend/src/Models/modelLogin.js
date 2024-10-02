const connection = require('./connection');

const login = async (email, senha) => {
    const queryEmail = 'SELECT * FROM usuarios WHERE usu_email = ?';
    const [user] = await connection.execute(queryEmail, [email]);

    console.log(user);

    if (user.length !== 1) {
        return null;
      } else {
      return user;
      }
};


module.exports = { login, };